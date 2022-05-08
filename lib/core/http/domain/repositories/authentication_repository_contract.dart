/// Fetch resources for each request
///
/// For example, get authentication token
abstract class AuthenticationRepositoryContract {
  Future<String> getToken();
}
