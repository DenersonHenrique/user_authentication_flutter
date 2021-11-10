import 'package:dartz/dartz.dart';
import 'package:user_authentication_flutter/app/core/errors/failures.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_data_entity.dart';

abstract class IUserAuthenticationRepository {
  Future<Either<Failure, bool>> userAuthentication(
    UserDataEntity userDataEntity,
    String userAction,
  );
}
