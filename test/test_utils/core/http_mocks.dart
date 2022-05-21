import 'package:base_architecture_for_flutter/core/http/data/http_proxy_impl.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpProxyImpl extends Mock implements HttpProxyImpl {}

class MockDio extends Mock implements Dio {}

class MockDioResponse extends Mock implements Response {}
