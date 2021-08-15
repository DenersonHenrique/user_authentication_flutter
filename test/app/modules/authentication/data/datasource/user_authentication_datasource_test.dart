import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_authentication_flutter/app/core/httpClient/http_client.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/datasource/user_authentication_datasource.dart';

class HttpClientMock extends Mock implements IHttpClient {}

void main() {
  late IHttpClient httpClient;
  late IUserAuthenticationDataSource dataSource;

  setUp(() {
    httpClient = HttpClientMock();
    dataSource = UserAuthenticationDataSource(httpClient: httpClient);
  });

  final json = """{
    "kind": "identitytoolkit#VerifyPasswordResponse",
    "localId": "iBQL7KwhqAManreGD4m7nsBrEZ82",
    "email": "denersonh@gmail.com",
    "displayName": "",
    "idToken": "",
    "registered": true,
    "refreshToken": "",
    "expiresIn": "3600"
  }""";

  group('Get user authenticated datasource implementation.', () {
    test('Should return a user authorization model.', () async {
      // Assert
      when(() => httpClient.post(
            url: any(named: 'url'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => HttpResponse(
            statusCode: 200,
            data: json,
          ));
      // Actual
      final result = await dataSource.authenticate();
      // Assert
      expect(result, isA<UserModel>());
    });

    // test('Should call the post method with url', () async {
    //   // Assert
    //   when(() => httpClient.post(
    //         body: any(named: 'body'),
    //         url: any(named: 'url'),
    //       )).thenAnswer((_) async => HttpResponse(
    //         statusCode: 200,
    //         data: json,
    //       ));
    //   // Actual
    //   await dataSource.authenticate();
    //   // Assert
    //   verify(() => httpClient.post(
    //         body: any(named: 'body'),
    //         url: any(named: 'url'),
    //       )).called(1);
    // });
  });
}
