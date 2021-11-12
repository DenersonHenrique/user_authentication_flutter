import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_authentication_flutter/app/core/errors/failures.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_data_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/usecase/sign_up_with_email_usecase.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/repository/sign_up_with_email_repository.dart';

class SignUpWithEmailRepositoryMock extends Mock
    implements ISignUpWithEmailRepository {}

void main() {
  late SignUpWithEmailRepositoryMock repository;
  late SignUpWithEmailUsecase usecase;
  final _userAuthenticated = UserEntity(
    displayName: '',
    email: '',
    expiresIn: '',
    kind: '',
    localId: '',
    refreshToken: '',
    idToken: '',
    registered: true,
  );

  final UserDataEntity _userDataEntity = UserDataEntity(
    email: '',
    password: '',
  );

  setUp(() {
    repository = SignUpWithEmailRepositoryMock();
    usecase = SignUpWithEmailUsecase(repository);
  });

  group('Usecase implementation, Sign up user with email.', () {
    test('Should return a UserEntity registered.', () async {
      // Arrange
      when(() => repository.signUpUser(_userDataEntity, '')).thenAnswer(
        (_) async => Right(_userAuthenticated),
      );
      // Actual
      final result = await usecase.signUpUser(_userDataEntity, '');
      // Assert
      expect(result, Right(_userAuthenticated));
      verify(
        () => repository.signUpUser(_userDataEntity, ''),
      ).called(1);
    });

    test('Should return a ServerFailure', () async {
      // Arrange
      when(() => repository.signUpUser(_userDataEntity, '')).thenAnswer(
        (_) async => Left(ServerFailure(message: '')),
      );
      // Actual
      final result = await usecase.signUpUser(_userDataEntity, '');
      // Assert
      expect(result, Left(ServerFailure(message: '')));
      verify(
        () => repository.signUpUser(_userDataEntity, ''),
      ).called(1);
    });
  });
}
