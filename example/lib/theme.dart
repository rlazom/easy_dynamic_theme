import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
  primaryColor: Colors.blue,
  textTheme: const TextTheme(
    labelLarge: TextStyle(color: Colors.black54),
  ),
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.blue,
    brightness: Brightness.light,
  ),
);

var darkThemeData = ThemeData(
  primaryColor: Colors.blue,
  textTheme: const TextTheme(
    labelLarge: TextStyle(color: Colors.white70),
  ),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.blue,
    brightness: Brightness.dark,
  ),
);
