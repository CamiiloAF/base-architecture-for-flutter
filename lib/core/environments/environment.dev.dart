import 'dart:developer';

import '../../main.dart';
import '../di/injection_container.dart';
import 'environment_interface.dart';

Future<void> main() async {
  await mainCommon(
    env: EnvironmentInterface.dev,
    debug: true,
    injectionDependencies: initialize,
  );
}

/// It's executed after call [main]
Future<void> initialize() async {
  log('MODO: ${EnvironmentInterface.dev}');
  await injectionDependencies();
}
