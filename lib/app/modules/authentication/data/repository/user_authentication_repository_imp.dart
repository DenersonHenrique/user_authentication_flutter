import 'package:dartz/dartz.dart';
import 'package:user_authentication_flutter/app/core/errors/failures.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_data_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/datasource/user_authentication_datasource.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_model.dart';
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
  Future<Either<Failure, bool>> userAuthentication(
    UserDataEntity userDataEntity,
    String userAction,
  ) async {
    try {
      final UserDataModel userDataModel = UserDataModel(
        email: userDataEntity.email,
        password: userDataEntity.password,
      );
      final response = await _datasource.authenticate(
        userDataModel,
        userAction,
      );
      // return Right(response);
      return Right(true);
    } on AuthFailure catch (error) {
      return Left(AuthFailure(message: error.message));
    } on Failure catch (error) {
      return Left(ServerFailure(message: error.message));
    }
  }
}
