import 'package:dartz/dartz.dart';
import 'package:user_authentication_flutter/app/core/errors/failures.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_data_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/datasource/user_authentication_datasource.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/erros/erros.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_data_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/repository/user_authentication_repository.dart';

class UserAuthenticationRepository implements IUserAuthenticationRepository {
  final IUserAuthenticationDataSource _datasource;

  UserAuthenticationRepository(
    this._datasource,
  );

  @override
  Future<Either<Failure, UserEntity>> userAuthentication(
    UserDataEntity userDataEntity,
    String userAction,
  ) async {
    final UserDataModel userDataModel = UserDataModel(
      email: userDataEntity.email,
      password: userDataEntity.password,
    );
    try {
      final response = await _datasource.authenticate(
        userDataModel,
        userAction,
      );
      return Right(response);
    } on AuthFailure catch (error) {
      return Left(AuthFailure(message: error.message));
    } catch (error) {
      return Left(ServerFailure(message: ''));
    }
  }
}
