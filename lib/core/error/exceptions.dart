import 'dart:developer';

import 'package:dio/dio.dart';

class ServerException implements Exception {
  ServerException({
    this.error,
    final String? message,
    final StackTrace? stackTrace,
  }) : message = message ?? _defaultMessage {
    if (error is Error) {
      _handleTypeError();
    } else {
      _defaultErrorHandler(stackTrace);
    }
  }

  ServerException.fromDioError({required final DioError dioError})
      : error = dioError,
        message = dioError.message {
    _defaultErrorHandler();
  }

  final String message;

  // ignore: no-object-declaration
  final Object? error;
  static const _defaultMessage = 'Ocurrió un error inesperado';

  void _defaultErrorHandler([final StackTrace? stackTrace]) {
    log(message, error: error, stackTrace: stackTrace);
  }

  void _handleTypeError() {
    _defaultErrorHandler((error as Error?)?.stackTrace ?? StackTrace.empty);
  }
}

class Failure implements Exception {
  Failure([this.message = 'Ocurrió un error inesperado']);

  final String message;
}

class UnhandledException implements Exception {}

class NotInternetConnection implements Exception {}

class UnexpectedError implements Exception {
  UnexpectedError({this.message, this.error, this.stackTrace});

  final String? message;

  // ignore: no-object-declaration
  final Object? error;
  final StackTrace? stackTrace;
}
