import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_authentication_flutter/app/core/errors/failures.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_data_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/usecase/authentication_with_email_usecase.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/repository/user_authentication_repository.dart';

class UserAuthenticationMock extends Mock
    implements IUserAuthenticationRepository {}

void main() {
  late UserAuthenticationMock repository;
  late AuthenticationEmailUsecase authenticationEmailUsecase;
  final userAuthenticated = UserEntity(
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
    repository = UserAuthenticationMock();
    authenticationEmailUsecase = AuthenticationEmailUsecase(repository);
  });

  group('Usecase implementation, user authentication.', () {
    test('Should return a UserEntity authenticated.', () async {
      // Arrange
      when(() => repository.userAuthentication(_userDataEntity, '')).thenAnswer(
        (_) async => Right<Failure, UserEntity>(userAuthenticated),
      );
      // Actual
      final result = await authenticationEmailUsecase.userAuthentication(
          _userDataEntity, '');
      // Assert
      expect(result, Right(userAuthenticated));
      verify(() => repository.userAuthentication(_userDataEntity, ''))
          .called(1);
    });

    test('Should return a ServerFailure.', () async {
      // Arrange
      when(() => repository.userAuthentication(_userDataEntity, '')).thenAnswer(
        (_) async => Left<Failure, UserEntity>(ServerFailure(message: '')),
      );
      // Actual
      final result = await authenticationEmailUsecase.userAuthentication(
          _userDataEntity, '');
      // Assert
      expect(result, Left(ServerFailure(message: '')));
      verify(() => repository.userAuthentication(_userDataEntity, ''))
          .called(1);
    });
  });
}
