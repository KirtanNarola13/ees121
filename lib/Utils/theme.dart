import 'package:flutter/material.dart';

mixin AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.deepPurple,
    fontFamily: 'Raleway',
    brightness: Brightness.light,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.deepPurple,
    fontFamily: 'Raleway',
    brightness: Brightness.dark,
  );
}
