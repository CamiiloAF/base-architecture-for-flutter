import 'package:dio/dio.dart';

/// Proxy for get http client
///
/// You can change http client without any problem with this proxy
abstract class HttpProxyInterface {
  Dio instance();
}
