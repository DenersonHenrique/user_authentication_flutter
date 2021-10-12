import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_authentication_flutter/app/core/errors/failures.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_data_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_data_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/datasource/user_authentication_datasource.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/repository/user_authentication_repository_imp.dart';

class UserAuthenticationDataSourceMock extends Mock
    implements IUserAuthenticationDataSource {}

void main() {
  late UserAuthenticationRepository repository;
  late UserAuthenticationDataSourceMock datasource;
  final userModel = UserModel(
    kind: 'kind',
    localId: 'localId',
    email: 'email',
    displayName: 'displayName',
    idToken: 'idToken',
    registered: true,
    refreshToken: 'refreshToken',
    expiresIn: 'expiresIn',
  );
  final userDataModel = UserDataModel(
    email: '',
    password: '',
  );
  final userDataEntity = UserDataEntity(
    email: '',
    password: '',
  );

  setUp(() {
    datasource = UserAuthenticationDataSourceMock();
    repository = UserAuthenticationRepository(datasource);
  });

  group('Get user authenticated repository implementation.', () {
    test('Should return user authenticated model.', () async {
      // Arrange
      when(() => datasource.authenticate(userDataModel, ''))
          .thenAnswer((_) async => userModel);
      // Actual
      final result = await repository.userAuthentication(userDataEntity, '');
      // Assert
      expect(result, Right(userModel));
      verify(() => datasource.authenticate(userDataModel, '')).called(1);
    });

    test('Should return a server failure when call datasource.', () async {
      // Arrange
      when(() => datasource.authenticate(userDataModel, ''))
          .thenThrow(Exception());
      // Actual
      final result = await repository.userAuthentication(userDataEntity, '');
      // Assert
      expect(result, Left(ServerFailure(message: '')));
      verify(() => datasource.authenticate(userDataModel, '')).called(1);
    });
  });
}
