import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_authentication_flutter/app/core/errors/failures.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/datasource/user_authentication_datasource.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/repository/user_authentication_repository_imp.dart';

class UserAuthenticationDataSourceMock extends Mock
    implements IUserAuthenticationDataSource {}

void main() {
  late UserAuthenticationRepository repository;
  late UserAuthenticationDataSourceMock dataSource;
  final userModel = UserModel(
    'kind',
    'localId',
    'email',
    'displayName',
    'idToken',
    true,
    'refreshToken',
    'expiresIn',
  );

  setUp(() {
    dataSource = UserAuthenticationDataSourceMock();
    repository = UserAuthenticationRepository(dataSource);
  });

  group('Get user authenticated repository implementation.', () {
    test('Should return user authenticated model.', () async {
      // Arrange
      when(() => dataSource.authenticate()).thenAnswer((_) async => userModel);
      // Actual
      final result = await repository.userAuthentication();
      // Assert
      expect(result, Right(userModel));
      verify(() => dataSource.authenticate()).called(1);
    });

    test('Should return a server failure when call datasource.', () async {
      // Arrange
      when(() => dataSource.authenticate()).thenThrow(Exception());
      // Actual
      final result = await repository.userAuthentication();
      // Assert
      expect(result, Left(ServerFailure()));
      verify(() => dataSource.authenticate()).called(1);
    });
  });
}
