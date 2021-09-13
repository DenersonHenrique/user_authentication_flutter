import 'package:flutter/material.dart';

class AppColors {
  //Color App
  static final Color primaryColor = const Color(0xFF0066FF);
  static final Color secondColor = const Color(0xFFCCE0FF);
  static final Color? primaryColorDark = Colors.indigo[800];
  static final Color accentColor = const Color(0xFFCCE0FF);
  static final Color? accentColorDark = Colors.grey[800];

  static final Color? errorColor = Colors.red[900];

  static final MaterialColor materialSwatchColor = const MaterialColor(
    0xFF000000,
    const <int, Color>{
      50: const Color(0xFFE6F0FF),
      100: const Color(0xFFCCE0FF),
      200: const Color(0xFFB3D1FF),
      300: const Color(0xFF99C2FF),
      400: const Color(0xFF80B3FF),
      500: const Color(0xFF66A3FF),
      600: const Color(0xFF4D94FF),
      700: const Color(0xFF3385FF),
      800: const Color(0xFF1A75FF),
      900: const Color(0xFF0066FF),
    },
  );
}
