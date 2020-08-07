import 'package:flutter/material.dart';

class MolekolaColors {
  static const MaterialColor indigo =
      MaterialColor(_indigoPrimaryValue, <int, Color>{
    50: Color(0xFFE7ECF5),
    100: Color(0xFFC4D0E6),
    200: Color(0xFF9DB0D5),
    300: Color(0xFF7590C4),
    400: Color(0xFF5879B8),
    500: Color(_indigoPrimaryValue),
    600: Color(0xFF3459A4),
    700: Color(0xFF2C4F9A),
    800: Color(0xFF254591),
    900: Color(0xFF183380),
  });
  static const int _indigoPrimaryValue = 0xFF3A61AB;

  static const MaterialColor indigoAccent =
      MaterialColor(_indigoAccentValue, <int, Color>{
    100: Color(0xFFB8C8FF),
    200: Color(_indigoAccentValue),
    400: Color(0xFF527AFF),
    700: Color(0xFF3966FF),
  });
  static const int _indigoAccentValue = 0xFF85A1FF;
}
