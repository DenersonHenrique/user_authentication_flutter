import 'package:flutter/material.dart';

class AppColors {
  //Color App
  static final Color primaryColor = const Color(0xFF0066FF);
  static final Color secondColor = const Color(0xFFCCE0FF);
  static final Color? primaryColorDark = Colors.indigo[800];
  static final Color accentColor = const Color(0xFFCCE0FF);
  static final Color? accentColorDark = Colors.grey[800];

  static final Color? errorColor = Colors.red[900];

  static final Color? snackBarSuccessLight = Colors.green[700];
  static final Color? snackBarSuccessDark = Colors.green[900];

  static final Color? snackBarWarningLight = Colors.yellow[700];
  static final Color? snackBarWarningDark = Colors.yellow[900];

  static final Color? snackBarErrorLight = Colors.red[600];
  static final Color? snackBarErrorDark = Colors.red[900];

  static final MaterialColor materialSwatchColor = const MaterialColor(
    0xFF000000,
    const <int, Color>{
      50: const Color(0xFF4A5BF6),
      100: const Color(0xFF4A5BF6),
      200: const Color(0xFF4A5BF6),
      300: const Color(0xFF4A5BF6),
      400: const Color(0xFF4A5BF6),
      500: const Color(0xFF4A5BF6),
      600: const Color(0xFF4A5BF6),
      700: const Color(0xFF4A5BF6),
      800: const Color(0xFF4A5BF6),
      900: const Color(0xFF4A5BF6),
    },
  );
}
