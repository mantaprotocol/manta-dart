import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart' hide Protocol;
import 'package:manta_dart/protocol.dart';

MqttClient setup(
    String serverAddress, String uniqueID, int port, Protocol protocol) {
  if (protocol == Protocol.mqtt) {
    throw ('MQTT protocol not supported in Browser');
  }
  final client = MqttBrowserClient.withPort(serverAddress, uniqueID, port);
  return client;
}
