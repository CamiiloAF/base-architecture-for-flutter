import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../domain/repositories/authentication_repository_contract.dart';
import 'custom_on_error.dart';
import 'custom_on_request.dart';

/// Intercept every request that is send to the backend
class HttpInterceptor extends Interceptor {
  HttpInterceptor(this._authenticationRepositoryContract);

  final AuthenticationRepositoryContract _authenticationRepositoryContract;

  @override
  Future<void> onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    final reqOptions = await customOnRequest(
      options,
      _authenticationRepositoryContract,
    );
    handler.next(reqOptions);
  }

  @override
  Future<FutureOr> onError(
    final DioError err,
    final ErrorInterceptorHandler handler,
  ) async {
    final customError = await customOnError(err);
    handler.next(customError);
  }

  @override
  Future<dynamic> onResponse(
    final Response response,
    final ResponseInterceptorHandler handler,
  ) async {
    log(response.toString());
    handler.next(response);
  }
}
