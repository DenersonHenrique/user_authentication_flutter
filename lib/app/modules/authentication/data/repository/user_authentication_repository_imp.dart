import 'package:dartz/dartz.dart';
import 'package:user_authentication_flutter/app/core/errors/failures.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_data_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_data_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/datasource/user_authentication_datasource.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/repository/user_authentication_repository.dart';

class UserAuthenticationRepository implements IUserAuthenticationRepository {
  final IUserAuthenticationDataSource _dataSource;

  UserAuthenticationRepository(
    this._dataSource,
  );

  @override
  Future<Either<Failure, UserEntity>> userAuthentication(
    UserDataEntity userDataEntity,
  ) async {
    UserDataModel userDataModel = UserDataModel(
      email: userDataEntity.email,
      password: userDataEntity.password,
    );
    try {
      final response = await _dataSource.authenticate();
      return Right(response);
    } on ServerFailure catch (error) {
      return Left(error);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
