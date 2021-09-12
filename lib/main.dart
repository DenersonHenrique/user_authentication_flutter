import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app/app_widget.dart';
import 'package:user_authentication_flutter/app/common/di.dart';

void main() {
  GetIt getIt = GetIt.instance;
  final appInjection = AppInjection();
  appInjection.call(getIt);
  runApp(AppWidget());
}
