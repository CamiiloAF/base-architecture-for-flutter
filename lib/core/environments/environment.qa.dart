import 'dart:developer';

import '../../main.dart';
import '../di/injection_container.dart';
import 'environment_interface.dart';

Future<void> main() async {
  await mainCommon(
    env: EnvironmentInterface.qa,
    debug: false,
    injectionDependencies: initialize,
  );
}

/// It's executed after call [main]
Future<void> initialize() async {
  log('MODO: ${EnvironmentInterface.qa}');
  await injectionDependencies();
}
