import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Colors.green,
    secondary: Colors.black,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.grey,
    ),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    surface: Colors.black,
    primary: Colors.green,
    secondary: Colors.white,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.grey,
    ),
  ),
);
