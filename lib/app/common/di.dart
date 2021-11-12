import 'package:get_it/get_it.dart';
import '../core/httpClient/http_client_imp.dart';
import '../modules/authentication/domain/usecase/sign_up_with_email_usecase.dart';
import '../modules/authentication/data/datasource/sign_up_with_email_datasource.dart';
import '../modules/authentication/data/datasource/user_authentication_datasource.dart';
import '../modules/authentication/domain/usecase/authentication_with_email_usecase.dart';
import '../modules/authentication/data/repository/sign_up_with_email_repository_imp.dart';
import '../modules/authentication/data/repository/user_authentication_repository_imp.dart';
import '../modules/authentication/ui/authentication/controller/authentication_controller.dart';

class AppInjection {
  void call(GetIt instanceGetIt) {
    instanceGetIt
      ..registerSingleton<HttpClient>(HttpClient())
      ..registerLazySingleton<UserAuthenticationDataSource>(
        () => UserAuthenticationDataSource(
          httpClient: instanceGetIt<HttpClient>(),
        ),
      )
      ..registerLazySingleton<SignUpWithEmailDataSource>(
        () => SignUpWithEmailDataSource(
          httpClient: instanceGetIt<HttpClient>(),
        ),
      )
      ..registerLazySingleton<UserAuthenticationRepository>(
        () => UserAuthenticationRepository(
          instanceGetIt<UserAuthenticationDataSource>(),
        ),
      )
      ..registerLazySingleton<SignUpWithEmailRepository>(
        () => SignUpWithEmailRepository(
            instanceGetIt<SignUpWithEmailDataSource>()),
      )
      ..registerLazySingleton<AuthenticationEmailUsecase>(
        () => AuthenticationEmailUsecase(
          instanceGetIt<UserAuthenticationRepository>(),
        ),
      )
      ..registerLazySingleton<SignUpWithEmailUsecase>(
        () => SignUpWithEmailUsecase(
          instanceGetIt<SignUpWithEmailRepository>(),
        ),
      )
      ..registerSingleton<AuthenticationController>(
        AuthenticationController(
          signUpWithEmailUsecase: instanceGetIt<SignUpWithEmailUsecase>(),
          authenticationUsecase: instanceGetIt<AuthenticationEmailUsecase>(),
        ),
      );
  }
}
