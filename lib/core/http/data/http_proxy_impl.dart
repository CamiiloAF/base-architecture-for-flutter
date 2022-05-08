import 'package:dio/dio.dart';

import '../domain/repositories/authentication_repository_contract.dart';
import '../domain/repositories/http_proxy_repository.dart';
import 'interceptors/http_interceptor.dart';

class HttpProxyImpl extends HttpProxyInterface {
  HttpProxyImpl(this.baseUrl, this._authenticationRepositoryContract) {
    _http = Dio()
      ..interceptors.add(
        HttpInterceptor(
          _authenticationRepositoryContract,
        ),
      )
      ..options.connectTimeout = 40000
      ..options.receiveTimeout = 40000
      ..options.sendTimeout = 3000
      ..options.baseUrl = baseUrl;
  }

  late Dio _http;
  final String baseUrl;
  final AuthenticationRepositoryContract _authenticationRepositoryContract;

  @override
  Dio instance() => _http;
}
