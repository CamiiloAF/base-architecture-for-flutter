import 'package:get_it/get_it.dart';

import '../http/dependencies/http_dependencies.dart';

GetIt sl = GetIt.instance;

/// Set up dependencies injection
Future<void> injectionDependencies() async {
  await setUpHttpDependencies();
}
