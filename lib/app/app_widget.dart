import 'package:flutter/material.dart';
import 'package:user_authentication_flutter/app/modules/home/ui/home_page.dart';
import 'common/constants/app_colors.dart';
import 'modules/authentication/ui/authentication/authentication_page.dart';
import 'package:user_authentication_flutter/app/common/constants/app_routes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Authentication Demo',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.secondColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.HOME: (ctx) => HomePage(),
        AppRoutes.AUTH_HOME: (ctx) => AuthenticationPage(),
      },
    );
  }
}
