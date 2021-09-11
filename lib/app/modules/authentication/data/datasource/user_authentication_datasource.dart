import 'package:user_authentication_flutter/app/utils/mock_utils.dart';
import 'package:user_authentication_flutter/app/core/errors/exceptions.dart';
import 'package:user_authentication_flutter/app/core/httpClient/http_client.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_model.dart';

abstract class IUserAuthenticationDataSource {
  Future<UserModel> authenticate();
}

class UserAuthenticationDataSource extends IUserAuthenticationDataSource {
  final IHttpClient httpClient;

  UserAuthenticationDataSource({required this.httpClient});

  @override
  Future<UserModel> authenticate() async {
    final mockFile = 'user_authenticated';
    final mockData = await MockUtils.getMock(mockFile);

    if (mockData != null) {
      return UserModel.fromJson(mockData);
    } else {
      throw ServerException();
    }
  }
}
