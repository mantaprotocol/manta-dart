import 'dart:async' show Future;
import 'dart:convert' show jsonEncode, jsonDecode, utf8;
import 'package:http/http.dart' as http;

import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:test/test.dart' show expect, isNot, setUp, test;

import 'package:manta_dart/crypto.dart' show RsaKeyHelper;
import 'package:manta_dart/manta_wallet.dart' show MantaWallet;
import 'package:manta_dart/protocol.dart';
import 'package:manta_dart/messages.dart' show AckMessage;

import 'package:manta_dart/environment_config.dart';
import 'certifcate.dart';

class RemoteController {
  int port;
  String host;

  RemoteController(this.port, [this.host = 'localhost']);

  Future<String> send(String path, Map data) async {
    final body = jsonEncode(data);
    final url = Uri.parse('http://$host:$port$path');
    final response = await http
        .post(url, body: body, headers: {'Access-Control-Allow-Origin': '*'});

    return response.body;
  }
}

void main() {
  final MQTT_PORT = EnvironmentConfig.mqttPort;
  final STORE_PORT = EnvironmentConfig.storePort;
  final MQTT_WS_PORT = EnvironmentConfig.mqttWSPort;

  print('MQTT_PORT: $MQTT_PORT');
  print('MQTT_WS_PORT: $MQTT_WS_PORT');
  print('STORE_PORT: $STORE_PORT');

  final protocol = const bool.fromEnvironment('dart.library.html')
      ? Protocol.ws
      : Protocol.mqtt;

  final mqttPort = const bool.fromEnvironment('dart.library.html')
      ? MQTT_WS_PORT
      : MQTT_PORT;

  late MantaWallet wallet;
  late RemoteController store;
  late RemoteController payproc;
  setUp(() {
    wallet = MantaWallet('manta://localhost:$mqttPort/123', protocol: protocol);
    store = RemoteController(STORE_PORT);
    payproc = RemoteController(8092);
  });
  test('Connection', () async {
    expect(wallet.client.connectionStatus?.state,
        mqtt.MqttConnectionState.disconnected);
    await wallet.connect();
    expect(wallet.client.connectionStatus?.state,
        mqtt.MqttConnectionState.connected);
  });
  test('Get and verify PaymentRequest with local cert', () async {
    final res =
        await store.send('/merchant_order/', {'amount': '10', 'fiat': 'EUR'});
    print("Res is '$res'");
    var ack = AckMessage.fromJson(jsonDecode(res));
    // Replace mosquitto address to localhost
    final url = ack.url!.replaceFirst('mosquitto', 'localhost:$mqttPort');
    print('Manta wallet url: $url');
    wallet = MantaWallet(url, protocol: protocol);
    await wallet.connect();
    expect(wallet.client.updates?.isBroadcast, true);
    var envelope = await wallet.getPaymentRequest(cryptoCurrency: 'NANO');
    final helper = RsaKeyHelper();
    expect(envelope.verify(helper.parsePublicKeyFromCertificate(CERT)), true);
    var pr = envelope.unpack();
    expect(pr.fiat_currency, 'EUR');
  });
  test("Get and verify PaymentRequest with PayProc's cert", () async {
    final res =
        await store.send('/merchant_order/', {'amount': '10', 'fiat': 'EUR'});
    print("Res is '$res'");
    var ack = AckMessage.fromJson(jsonDecode(res));

    final url = ack.url!.replaceFirst('mosquitto', 'localhost:$mqttPort');
    print('Manta wallet url: $url');
    wallet = MantaWallet(url, protocol: protocol);

    var envelope = await wallet.getPaymentRequest(cryptoCurrency: 'NANO');
    var cert = await wallet.getCertificate();
    final helper = RsaKeyHelper();
    expect(envelope.verify(cert), true);
    var pr = envelope.unpack();
    expect(pr.fiat_currency, 'EUR');
  });
}
