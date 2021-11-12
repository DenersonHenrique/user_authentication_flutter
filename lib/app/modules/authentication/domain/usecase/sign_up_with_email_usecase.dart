import 'package:dartz/dartz.dart';
import '../entity/user_entity.dart';
import '../entity/user_data_entity.dart';
import '../../../../core/errors/failures.dart';
import '../repository/sign_up_with_email_repository.dart';

abstract class ISignUpWithEmailUsecase {
  Future<Either<Failure, UserEntity>> signUpUser(
    UserDataEntity userDataEntity,
    String userAction,
  );
}

class SignUpWithEmailUsecase implements ISignUpWithEmailUsecase {
  final ISignUpWithEmailRepository _signUpWithEmailRepository;

  SignUpWithEmailUsecase(this._signUpWithEmailRepository);

  @override
  Future<Either<Failure, UserEntity>> signUpUser(
    UserDataEntity userDataEntity,
    String userAction,
  ) async =>
      await _signUpWithEmailRepository.signUpUser(
        userDataEntity,
        userAction,
      );
}
