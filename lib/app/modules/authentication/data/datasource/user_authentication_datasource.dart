import 'dart:convert';
import 'package:user_authentication_flutter/app/utils/mock_utils.dart';
import 'package:user_authentication_flutter/app/core/errors/exceptions.dart';
import 'package:user_authentication_flutter/app/common/constants/app_keys.dart';
import 'package:user_authentication_flutter/app/common/constants/app_urls.dart';
import 'package:user_authentication_flutter/app/core/httpClient/http_client.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_model.dart';
import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_data_model.dart';

abstract class IUserAuthenticationDataSource {
  Future<UserModel> authenticate(
      // UserDataModel userDataModel,
      );
}

class UserAuthenticationDataSource implements IUserAuthenticationDataSource {
  final IHttpClient httpClient;

  UserAuthenticationDataSource({required this.httpClient});

  @override
  Future<UserModel> authenticate() async {
    final response = await httpClient.post(
      url: AppUrl.authenticationUrl('urlSegment', AppKey.AUTH_URL),
      body: {},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.data));
      // return UserModel.fromJson(mockData);
    } else {
      throw ServerException();
    }

    // final mockFile = 'user_authenticated';
    // final mockData = await MockUtils.getMock(mockFile);

    // if (mockData != null) {
    //   return UserModel.fromJson(mockData);
    // } else {
    //   throw ServerException();
    // }
  }
}
