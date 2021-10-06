import 'package:dartz/dartz.dart';
import '../entity/user_entity.dart';
import '../entity/user_data_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class ISignUpWithEmailRepository {
  Future<Either<Failure, UserEntity>> signUpUser(
    UserDataEntity userDataEntity,
  );
}
