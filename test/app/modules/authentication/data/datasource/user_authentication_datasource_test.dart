import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_authentication_flutter/app/core/errors/exceptions.dart';
import 'package:user_authentication_flutter/app/core/httpClient/http_client.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_data_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/datasource/user_authentication_datasource.dart';

class HttpClientMock extends Mock implements IHttpClient {}

void main() {
  late IHttpClient httpClient;
  late IUserAuthenticationDataSource datasource;
  final UserDataModel _userDataModel = UserDataModel(
    email: '',
    password: '',
  );

  setUp(() {
    httpClient = HttpClientMock();
    datasource = UserAuthenticationDataSource(httpClient: httpClient);
  });

  final json =
      """{
    "kind": "identitytoolkit#VerifyPasswordResponse",
    "localId": "iBQL7KwhqAManreGD4m7nsBrEZ82",
    "email": "denersonh@gmail.com",
    "displayName": "",
    "idToken": "",
    "registered": true,
    "refreshToken": "",
    "expiresIn": "3600"
  }""";

  successMock() {
    when(() => httpClient.post(
          body: any(named: 'body'),
          url: any(named: 'url'),
        )).thenAnswer((_) async => HttpResponse(
          statusCode: 200,
          data: json,
        ));
  }

  group('Get user authenticated datasource implementation.', () {
    test('Should return a user authorization model.', () async {
      // Assert
      successMock();
      // Actual
      final result = await datasource.authenticate();
      // Assert
      expect(result, isA<UserModel>());
    });

    test('Should throw a ServerException when the call is unsuccessful',
        () async {
      // Arrange
      when(() => httpClient.post(
            body: any(named: 'body'),
            url: any(named: 'url'),
          )).thenAnswer(
        (_) async => HttpResponse(
          statusCode: 400,
          data: 'Something error message',
        ),
      );
      // Actual
      final result = datasource.authenticate();
      // Assert
      expect(() => result, throwsA(ServerException()));
    });

    test('Should call the post method with url', () async {
      // Assert
      successMock();
      // Actual
      await datasource.authenticate();
      // Assert
      verify(() => httpClient.post(
            body: any(named: 'body'),
            url: any(named: 'url'),
          )).called(1);
    });
  });
}
