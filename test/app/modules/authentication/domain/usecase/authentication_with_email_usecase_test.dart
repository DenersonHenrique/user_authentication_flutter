import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_authentication_flutter/app/core/errors/failures.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_data_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/usecase/authentication_with_email_usecase.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/repository/user_authentication_repository.dart';

class UserAuthenticationRepositoryMock extends Mock
    implements IUserAuthenticationRepository {}

void main() {
  late UserAuthenticationRepositoryMock repository;
  late AuthenticationEmailUsecase usecase;
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
    repository = UserAuthenticationRepositoryMock();
    usecase = AuthenticationEmailUsecase(repository);
  });

  group('Usecase implementation, user authentication.', () {
    test('Should return a UserEntity authenticated.', () async {
      // Arrange
      when(() => repository.userAuthentication(_userDataEntity, '')).thenAnswer(
        (_) async => Right<Failure, UserEntity>(_userAuthenticated),
      );
      // Actual
      final result = await usecase.userAuthentication(_userDataEntity, '');
      // Assert
      expect(result, Right(_userAuthenticated));
      verify(
        () => repository.userAuthentication(_userDataEntity, ''),
      ).called(1);
    });

    test('Should return a ServerFailure.', () async {
      // Arrange
      when(() => repository.userAuthentication(_userDataEntity, '')).thenAnswer(
        (_) async => Left<Failure, UserEntity>(ServerFailure(message: '')),
      );
      // Actual
      final result = await usecase.userAuthentication(_userDataEntity, '');
      // Assert
      expect(result, Left(ServerFailure(message: '')));
      verify(
        () => repository.userAuthentication(_userDataEntity, ''),
      ).called(1);
    });
  });
}
