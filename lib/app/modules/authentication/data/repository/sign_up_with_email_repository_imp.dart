import 'package:dartz/dartz.dart';
import '../model/user_data_model.dart';
import '../../domain/entity/user_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entity/user_data_entity.dart';
import '../datasource/sign_up_with_email_datasource.dart';
import '../../domain/repository/sign_up_with_email_repository.dart';

class SignUpWithEmailRepository implements ISignUpWithEmailRepository {
  final ISignUpWithEmailDataSource _datasource;

  SignUpWithEmailRepository(this._datasource);

  @override
  Future<Either<Failure, UserEntity>> signUpUser(
    UserDataEntity userDataEntity,
  ) async {
    UserDataModel userDataModel = UserDataModel(
      email: userDataEntity.email,
      password: userDataEntity.password,
    );
    try {
      final response = await _datasource.signUp(userDataModel);
      return Right(response);
    } on ServerFailure catch (error) {
      return Left(error);
    } catch (error) {
      return Left(ServerFailure(message: ''));
    }
  }
}
