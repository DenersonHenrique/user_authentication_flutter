import 'package:user_authentication_flutter/app/common/constants/app_string.dart';

class AuthUtils {
  static String authAction(bool isAuthenticated) =>
      isAuthenticated ? AppString.authenticationAction : AppString.signUpAction;
}
