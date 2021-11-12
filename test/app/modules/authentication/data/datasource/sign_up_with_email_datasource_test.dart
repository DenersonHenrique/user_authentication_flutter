import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_authentication_flutter/app/core/httpClient/http_client.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_data_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/datasource/sign_up_with_email_datasource.dart';

class HttpClientMock extends Mock implements IHttpClient {}

void main() {
  late IHttpClient httpClient;
  late ISignUpWithEmailDataSource datasource;
  final UserDataModel _userDataModel = UserDataModel(
    email: '',
    password: '',
  );

  setUp(() {
    httpClient = HttpClientMock();
    datasource = SignUpWithEmailDataSource(httpClient: httpClient);
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
    when(
      () => httpClient.post(
        url: any(named: 'url'),
        body: any(named: 'body'),
      ),
    ).thenAnswer(
      (_) async => HttpResponse(
        statusCode: 200,
        data: json,
      ),
    );
  }

  group('HTTP tests - Datasource implementarion, user sign up.', () {
    test('Should return a registered user model', () async {
      // Arrange
      successMock();
      // Actual
      final result = await datasource.signUp(_userDataModel, 'userAction');
      // Assert
      expect(result, isA<UserModel>());
    });
  });
}
