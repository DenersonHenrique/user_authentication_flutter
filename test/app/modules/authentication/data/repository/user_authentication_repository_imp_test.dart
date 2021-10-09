import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_authentication_flutter/app/core/errors/failures.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_data_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/datasource/user_authentication_datasource.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/repository/user_authentication_repository_imp.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_data_entity.dart';

class UserAuthenticationDataSourceMock extends Mock
    implements IUserAuthenticationDataSource {}

void main() {
  late UserAuthenticationRepository repository;
  late UserAuthenticationDataSourceMock dataSource;
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
    email: 'denerson@gmail.com',
    password: '123456',
  );
  final userDataEntity = UserDataEntity(
    email: 'denerson@gmail.com',
    password: '123456',
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
      final result = await repository.userAuthentication(userDataEntity);
      // Assert
      expect(result, Right(userModel));
      verify(() => dataSource.authenticate()).called(1);
    });

    // when(
    //     () => cat.likes('fish', isHungry: any(named: 'isHungry')),
    //   ).thenReturn(true);
    //   expect(cat.likes('fish', isHungry: true), isTrue);

    test('Should return a server failure when call datasource.', () async {
      // Arrange
      when(() => dataSource.authenticate()).thenThrow(Exception());
      // Actual
      final result = await repository.userAuthentication(userDataEntity);
      // Assert
      expect(result, Left(ServerFailure()));
      verify(() => dataSource.authenticate()).called(1);
    });
  });
}
