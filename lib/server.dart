import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_client/mqtt_client.dart';

MqttClient setup(
    String serverAddress, String uniqueID, int port, bool useWebSocket) {
  final client = MqttServerClient.withPort(serverAddress, uniqueID, port);
  client.useAlternateWebSocketImplementation = false;
  client.useWebSocket = useWebSocket;
  return client;
}
