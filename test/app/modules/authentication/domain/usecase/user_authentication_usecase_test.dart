import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_authentication_flutter/app/core/errors/failures.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_entity.dart';
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

  setUp(() {
    repository = UserAuthenticationMock();
    authenticationEmailUsecase = AuthenticationEmailUsecase(repository);
  });

  group('User authentication', () {
    test('Should return a user authenticated.', () async {
      // Arrange
      when(() => repository.userAuthentication()).thenAnswer(
        (_) async => Right<Failure, UserEntity>(userAuthenticated),
      );
      // Actual
      final result = await authenticationEmailUsecase.userAuthentication();
      // Assert
      expect(result, Right(userAuthenticated));
      verify(() => repository.userAuthentication()).called(1);
    });

    test('Should return a ServerFailure', () async {
      // Arrange
      when(() => repository.userAuthentication()).thenAnswer(
        (_) async => Left<Failure, UserEntity>(ServerFailure()),
      );
      // Actual
      final result = await authenticationEmailUsecase.userAuthentication();
      // Assert
      expect(result, Left(ServerFailure()));
      verify(() => repository.userAuthentication()).called(1);
    });
  });
}
