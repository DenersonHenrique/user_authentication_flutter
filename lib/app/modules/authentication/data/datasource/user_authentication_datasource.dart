import 'dart:convert';
import '../model/user_model.dart';
import '../model/user_data_model.dart';
// import '../../../../utils/mock_utils.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../common/constants/app_keys.dart';
import '../../../../common/constants/app_urls.dart';
import '../../../../core/httpClient/http_client.dart';

abstract class IUserAuthenticationDataSource {
  Future<UserModel> authenticate(
    UserDataModel userDataModel,
    String userAction,
  );
}

class UserAuthenticationDataSource implements IUserAuthenticationDataSource {
  final IHttpClient httpClient;

  UserAuthenticationDataSource({required this.httpClient});

  @override
  Future<UserModel> authenticate(
    UserDataModel userDataModel,
    String userAction,
  ) async {
    // HTTP implementation
    final response = await httpClient.post(
      url: AppUrl.authenticationUrl(userAction, AppKey.AUTH_API_KEY),
      body: {
        "email": userDataModel.email,
        "password": userDataModel.password,
        "returnSecureToken": true,
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException(message: '');
    }

    // MOCK implementation
    // final mockFile = 'user_authenticated';
    // final mockData = await MockUtils.getMock(mockFile);

    // if (mockData != null) {
    //   return UserModel.fromJson(mockData);
    // } else {
    //   throw ServerException(message: 'Error datasource');
    // }
  }
}
