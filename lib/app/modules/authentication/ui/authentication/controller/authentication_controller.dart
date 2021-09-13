import 'package:mobx/mobx.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/usecase/user_authentication_usecase.dart';
part 'authentication_controller.g.dart';

class AuthenticationController = _AuthenticationControllerBase
    with _$AuthenticationController;

abstract class _AuthenticationControllerBase with Store {
  final UserAuthenticationUsecase _authenticationUsecase;

  _AuthenticationControllerBase({
    required UserAuthenticationUsecase authenticationUsecase,
  }) : _authenticationUsecase = authenticationUsecase;

  @observable
  UserEntity? _userEntity;

  @action
  Future<void> authenticateUser() async {
    final result = await _authenticationUsecase.userAuthentication();
    result.fold(
      (l) => true,
      (r) => _userEntity = r,
    );
  }
}
