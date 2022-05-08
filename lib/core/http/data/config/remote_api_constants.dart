import '../../../environments/config_environment.dart';

/// Here you can see the backend services and base URL
abstract class RemoteApiConstants {
  static String get baseUrl => ConfigEnvironments.getApiHostAws();

  /// For example this is the endpoint for security service
  ///
  /// In the backend could exist /security-service/login and
  /// /security-service/register
  static String get contextSecurity => '/security-service';
}
