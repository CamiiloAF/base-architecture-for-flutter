import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../models/generic_http_error.dart';

/// Handle http errors and parse the error message
Future<DioError> customOnError(final DioError dioError) async {
  if (dioError.type == DioErrorType.connectTimeout) {
    return _customReportError(
      dioError,
      GenericHttpError(
        description:
            'We are currently working on changes, come back in a moment',
      ),
    );
  }

  if (dioError.error is SocketException) {
    return _customReportError(
      dioError,
      GenericHttpError(description: 'Please check your internet connection'),
    );
  }

  /// Check if http response contains error message
  ///
  /// You can customize that according your backend response
  if (dioError.response?.data != null &&
      dioError.response?.data is Map &&
      dioError.response?.data?.containsKey('message')) {
    return _customReportError(
      dioError,
      GenericHttpError(description: dioError.response!.data['message']),
    );
  }

  switch (dioError.response?.statusCode ?? 501) {
    case 400:
      return _customReportError(
        dioError,
        GenericHttpError(
          description: 'Bad request',
        ),
      );
    case 401:
      return _customReportError(
        dioError,
        GenericHttpError(description: "You don't have permission"),
      );
    case 404:
      return _customReportError(
        dioError,
        GenericHttpError(description: 'Service not found'),
      );
    case 500:
      return _customReportError(
        dioError,
        GenericHttpError(description: 'Internal server error'),
      );
    default:
      return dioError;
  }
}

Future<DioError> _customReportError(
  final DioError dioError,
  final GenericHttpError genericError,
) async {
  dioError.error = genericError;
  return dioError;
}
