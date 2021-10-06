import 'package:mobx/mobx.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_data_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/usecase/sign_up_with_email_usecase.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/usecase/authentication_with_email_usecase.dart';
part 'authentication_controller.g.dart';

class AuthenticationController = _AuthenticationControllerBase
    with _$AuthenticationController;

abstract class _AuthenticationControllerBase with Store {
  final SignUpWithEmailUsecase _signUpWithEmailUsecase;
  final AuthenticationEmailUsecase _authenticationUsecase;

  _AuthenticationControllerBase({
    required SignUpWithEmailUsecase signUpWithEmailUsecase,
    required AuthenticationEmailUsecase authenticationUsecase,
  })  : _authenticationUsecase = authenticationUsecase,
        _signUpWithEmailUsecase = signUpWithEmailUsecase;

  @observable
  UserEntity? _userEntity;

  @observable
  UserDataEntity? _userDataEntity;

  @action
  Future<void> authenticateUser() async {
    final result = await _authenticationUsecase.userAuthentication();
    result.fold(
      (l) => true,
      (r) => _userEntity = r,
    );
  }

  @action
  Future<void> signUpUser() async {
    final result = await _signUpWithEmailUsecase.signUpUser(_userDataEntity!);
    result.fold(
      (l) => true,
      (r) => _userEntity = r,
    );
  }
}
