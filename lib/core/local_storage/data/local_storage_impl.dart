import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../domain/exceptions/local_storage_exception.dart';
import '../domain/local_storage.dart';

/// Local storage CRUD
///
/// [_localStorage] can be FlutterSecureStorage, Hive or similar.
class LocalStorageImpl extends LocalStorage {
  LocalStorageImpl(this._localStorage);

  final FlutterSecureStorage _localStorage;

  @override
  Future<void> delete(final String key) async {
    try {
      await _localStorage.delete(key: key);
    } catch (e) {
      throw LocalStorageException(
        'There was an error trying to remove $key from storage',
        e,
      );
    }
  }

  @override
  Future<String?> fetch(final String key) async {
    try {
      return await _localStorage.read(key: key);
    } catch (e) {
      throw LocalStorageException(
        'There was an error trying to read $key in storage',
        e,
      );
    }
  }

  @override
  Future save({required final String key, required final String value}) async {
    try {
      await _localStorage.write(key: key, value: value);
    } catch (e) {
      throw LocalStorageException(
        'There was an error trying to write $key in storage',
        e,
      );
    }
  }

  @override
  Future<void> clean() async {
    try {
      await _localStorage.deleteAll();
    } catch (e) {
      throw LocalStorageException(
        'There was an error trying to clean storage',
        e,
      );
    }
  }
}
