import 'package:flutter/material.dart';

import 'common/constants/app_colors.dart';
import 'modules/authentication/ui/authentication/authentication_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication Demo',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.secondColor,
        ),
      ),
      home: AuthenticationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
