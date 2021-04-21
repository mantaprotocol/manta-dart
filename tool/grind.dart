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

List<String> getRunningServices() {
  final result = run('docker-compose',
      arguments: ['ps', '--services', '--filter', 'status=running'],
      workingDirectory: 'test');

  return result.split('/n');
}

void start_docker() {
  run('docker-compose', arguments: ['up', '-d'], workingDirectory: 'test');
}

void stop_docker() {
  run('docker-compose', arguments: ['down'], workingDirectory: 'test');
}

Future main(args) => grind(args);

@Task()
Future test() => TestRunner().testAsync();

@Task(
    'Executes integration tests. Launch with --start-docker to start docker-compose')
void integration() {
  final args = context.invocation.arguments;

  if (args.getFlag('start-docker')) {
    start_docker();
  }

  final mqttPort = getHostPort('mosquitto', 1883);
  final storePort = getHostPort('store', 8080);
  TestRunner().test(
      files: 'test/wallet_test_mqtt.dart',
      runOptions: RunOptions(environment: {
        'MQTT_PORT': mqttPort.toString(),
        'STORE_PORT': storePort.toString(),
      }));

  if (args.getFlag('start-docker')) {
    stop_docker();
  }
}

@DefaultTask()
@Depends(test)
void build() {
  Pub.build();
}

@Task()
void clean() => defaultClean();
