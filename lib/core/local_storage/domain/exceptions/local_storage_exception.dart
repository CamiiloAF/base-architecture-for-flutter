import 'dart:developer';

/// Throws when occurs an error while trying to access local storage
class LocalStorageException implements Exception {
  LocalStorageException(
    this.message,
    this.error,
  ) {
    log('LocalStorageException', error: error);
  }

  final String message;
  final Object? error;

  @override
  String toString() => message;
}
