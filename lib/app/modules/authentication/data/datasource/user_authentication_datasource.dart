import 'package:user_authentication_flutter/app/modules/authentication/data/model/user_model.dart';

abstract class IUserAuthenticationDataSource {
  Future<UserModel> authenticate();
}
