import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../di/injection_container.dart';
import '../data/local_storage_impl.dart';
import '../domain/local_storage.dart';

Future<void> setUpLocalStorageDependencies() async {
  sl.registerLazySingleton<LocalStorage>(
    () => LocalStorageImpl(const FlutterSecureStorage()),
  );
}
