import 'package:grinder/grinder.dart';

int getHostPort(String service, int port) {
  final dockerID = run('docker-compose',
          arguments: ['ps', '-q', service], workingDirectory: 'test')
      .replaceAll('\n', '');

  final hostPort = run(
    'docker',
    arguments: [
      'inspect',
      "--format='{{(index (index .NetworkSettings.Ports \"$port/tcp\") 0).HostPort}}'",
      '$dockerID'
    ],
  ).replaceAll('\n', '').replaceAll("'", '');

  return int.parse(hostPort);
}

main(args) => grind(args);

@Task()
test() => TestRunner().testAsync();

@Task()
void integration() {
  final mqttPort = getHostPort('mosquitto', 1883);
  final storePort = getHostPort('store', 8080);
  TestRunner().test(
      files: 'test/wallet_test_mqtt.dart',
      runOptions: RunOptions(environment: {
        'MQTT_PORT': mqttPort.toString(),
        'STORE_PORT': storePort.toString(),
      }));
}

@DefaultTask()
@Depends(test)
build() {
  Pub.build();
}

@Task()
clean() => defaultClean();
