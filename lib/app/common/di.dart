import 'package:get_it/get_it.dart';
import 'package:user_authentication_flutter/app/core/httpClient/http_client_imp.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/usecase/user_authentication_usecase.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/datasource/user_authentication_datasource.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/repository/user_authentication_repository_imp.dart';
import 'package:user_authentication_flutter/app/modules/authentication/ui/authentication/controller/authentication_controller.dart';

class AppInjection {
  void call(GetIt instanceGetIt) {
    instanceGetIt
      ..registerSingleton<HttpClient>(HttpClient())
      ..registerLazySingleton<UserAuthenticationDataSource>(
        () => UserAuthenticationDataSource(
          httpClient: instanceGetIt<HttpClient>(),
        ),
      )
      ..registerLazySingleton<UserAuthenticationRepository>(
        () => UserAuthenticationRepository(
          instanceGetIt<UserAuthenticationDataSource>(),
        ),
      )
      ..registerLazySingleton<UserAuthenticationUsecase>(
        () => UserAuthenticationUsecase(
          instanceGetIt<UserAuthenticationRepository>(),
        ),
      )
      ..registerSingleton<AuthenticationController>(
        AuthenticationController(
          authenticationUsecase: instanceGetIt<UserAuthenticationUsecase>(),
        ),
      );
  }
}
