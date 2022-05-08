import '../../di/injection_container.dart';
import '../data/config/remote_api_constants.dart';
import '../data/http_proxy_impl.dart';
import '../data/repositories/authentication_repository.dart';

Future<void> setUpHttpDependencies() async {
  sl.registerFactory(
    AuthenticationRepository.new,
  );

  sl.registerFactory(
    () => HttpProxyImpl(
      RemoteApiConstants.baseUrl,
      sl<AuthenticationRepository>(),
    ),
  );
}
