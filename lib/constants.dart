// في ملف constants.dart
import 'package:flutter/material.dart';

final TextStyle kTextStyleArabic = TextStyle(
  fontFamily: 'Tajawal',
  fontSize: 20,
  fontWeight: FontWeight.w700,
);
final TextStyle kTextStyleEnglish = TextStyle(
  fontFamily: 'Rubik',
  fontSize: 20,
  fontWeight: FontWeight.w700,
);
// padding and radiss

const double kDefaultPadding = 16.0;
const double kDefaultRadius = 12.0;

//themes

ThemeData lighmode = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.cyan.shade100,
    brightness: Brightness.light,
  ),
);

ThemeData darkmode = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.grey.shade300,
    brightness: Brightness.dark,
  ),
);
