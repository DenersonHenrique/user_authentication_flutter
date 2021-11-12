import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_authentication_flutter/app/core/errors/failures.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_data_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/domain/entity/user_data_entity.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/datasource/sign_up_with_email_datasource.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/repository/sign_up_with_email_repository_imp.dart';

class SignUpWithEmailDataSourceMock extends Mock
    implements ISignUpWithEmailDataSource {}

void main() {
  late SignUpWithEmailRepository repository;
  late SignUpWithEmailDataSourceMock datasource;
  final _userModel = UserModel(
    kind: 'kind',
    localId: 'localId',
    email: 'email',
    displayName: 'displayName',
    idToken: 'idToken',
    registered: true,
    refreshToken: 'refreshToken',
    expiresIn: 'expiresIn',
  );
  final _userDataModel = UserDataModel(
    email: '',
    password: '',
  );
  final userDataEntity = UserDataEntity(
    email: '',
    password: '',
  );

  setUp(() {
    datasource = SignUpWithEmailDataSourceMock();
    repository = SignUpWithEmailRepository(datasource);
    registerFallbackValue<UserDataModel>(_userDataModel);
  });

  group('Repository implementation, user sign up', () {
    test('Should return a UserEntity value to user registered.', () async {
      // Arrange
      when(
        () => datasource.signUp(any(), ''),
      ).thenAnswer((_) async => _userModel);
      // Actual
      final result = await repository.signUpUser(userDataEntity, '');
      // Assert
      expect(result, Right(_userModel));
      verify(() => datasource.signUp(any(), '')).called(1);
    });

    test('Should return a server failure when call datasource.', () async {
      // Arrange
      when(
        () => datasource.signUp(any(), ''),
      ).thenThrow(ServerFailure(message: ''));
      // Actual
      final result = await repository.signUpUser(userDataEntity, '');
      // Assert
      expect(result, Left(ServerFailure(message: '')));
      verify(() => datasource.signUp(any(), '')).called(1);
    });
  });
}
