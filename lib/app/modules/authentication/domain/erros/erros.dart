import 'package:user_authentication_flutter/app/core/errors/failures.dart';

class AuthFailure extends ServerFailure {
  final String message;
  AuthFailure({required this.message}) : super(message: message);
}
