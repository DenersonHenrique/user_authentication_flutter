import 'package:dartz/dartz.dart';
import 'package:user_authentication_flutter/app/core/errors/failures.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/repository/user_authentication_repository.dart';

abstract class IUserAuthenticationUsercase {
  Future<Either<Failure, UserEntity>> userAuthentication();
}

class UserAuthenticationUsecase extends IUserAuthenticationUsercase {
  final IUserAuthenticationRepository _userAuthenticationRepository;

  UserAuthenticationUsecase(this._userAuthenticationRepository);

  @override
  Future<Either<Failure, UserEntity>> userAuthentication() async =>
      await _userAuthenticationRepository.userAuthentication();
}
