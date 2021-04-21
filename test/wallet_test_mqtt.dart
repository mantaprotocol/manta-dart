import 'dart:async' show Future;
import 'dart:convert' show jsonEncode, jsonDecode, utf8;
import 'dart:io'
    show HttpClient, HttpClientRequest, HttpClientResponse, Platform;

import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:test/test.dart' show expect, isNot, setUp, test;

import 'package:manta_dart/crypto.dart' show RsaKeyHelper;
import 'package:manta_dart/manta_wallet.dart' show MantaWallet;
import 'package:manta_dart/messages.dart' show AckMessage;

const PRIVATE_KEY = 'test/certificates/root/keys/test.key';
const CERTIFICATE = 'test/certificates/root/certs/test.crt';

class RemoteController {
  int port;
  String host;
  HttpClient client;

  RemoteController(int port, [String host]) {
    this.port = port;
    this.host = host ?? 'localhost';
    client = HttpClient();
  }
  Future<String> send(String path, [Map data]) async {
    data ??= {};
    final req = await client.post(host, port, path);
    req.write(jsonEncode(data));
    final res = await req.close();
    var result = '';
    await res.transform(utf8.decoder).listen((contents) {
      result += contents;
    });
    return result;
  }
}

void main() {
  final MQTT_PORT = Platform.environment['MQTT_PORT'] != null
      ? int.parse(Platform.environment['MQTT_PORT'])
      : 1883;
  final STORE_PORT = Platform.environment['STORE_PORT'] != null
      ? int.parse(Platform.environment['STORE_PORT'])
      : 8080;
  print('MQTT_PORT: $MQTT_PORT');
  print('STORE_PORT: $STORE_PORT');

  MantaWallet wallet;
  RemoteController store;
  RemoteController payproc;
  setUp(() {
    wallet = MantaWallet('manta://localhost:$MQTT_PORT/123');
    store = RemoteController(STORE_PORT);
    payproc = RemoteController(8092);
  });
  test('Connection', () async {
    expect(wallet.client.connectionStatus.state,
        mqtt.MqttConnectionState.disconnected);
    await wallet.connect();
    expect(wallet.client.connectionStatus.state,
        mqtt.MqttConnectionState.connected);
  });
  test('Get and verify PaymentRequest with local cert', () async {
    final res =
        await store.send('/merchant_order/', {'amount': '10', 'fiat': 'EUR'});
    print("Res is '$res'");
    var ack = AckMessage.fromJson(jsonDecode(res));
    // Replace mosquitto address to localhost
    final url = ack.url.replaceFirst('mosquitto', 'localhost:$MQTT_PORT');
    print('Manta wallet url: $url');
    wallet = MantaWallet(url);
    await wallet.connect();
    expect(wallet.client.updates.isBroadcast, true);
    var envelope = await wallet.getPaymentRequest(cryptoCurrency: 'NANO');
    final helper = RsaKeyHelper();
    expect(
        envelope.verify(helper.parsePublicKeyFromCertificateFile(CERTIFICATE)),
        true);
    var pr = envelope.unpack();
    expect(pr.fiat_currency, "EUR");
  });
  test("Get and verify PaymentRequest with PayProc's cert", () async {
    final res =
        await store.send('/merchant_order/', {'amount': '10', 'fiat': 'EUR'});
    print("Res is '$res'");
    var ack = AckMessage.fromJson(jsonDecode(res));

    final url = ack.url.replaceFirst('mosquitto', 'localhost:$MQTT_PORT');
    print('Manta wallet url: $url');
    wallet = MantaWallet(url);

    var envelope = await wallet.getPaymentRequest(cryptoCurrency: 'NANO');
    var cert = await wallet.getCertificate();
    final helper = RsaKeyHelper();
    expect(envelope.verify(cert), true);
    var pr = envelope.unpack();
    expect(pr.fiat_currency, 'EUR');
  });
}
