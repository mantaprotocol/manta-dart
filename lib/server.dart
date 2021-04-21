import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_client/mqtt_client.dart' hide Protocol;
import 'package:manta_dart/protocol.dart';

MqttClient setup(
    String serverAddress, String uniqueID, int port, Protocol protocol) {
  final client = MqttServerClient.withPort(serverAddress, uniqueID, port);
  client.useAlternateWebSocketImplementation = false;
  client.useWebSocket = protocol != Protocol.mqtt ? true : false;
  return client;
}
