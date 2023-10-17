import 'package:flutter/material.dart';
import 'package:unlee/config/theme/dark_theme.dart';
import 'package:unlee/config/theme/light_theme.dart';

enum AppTheme {
  greenLight,
  blueLight,
  pinkLight,
  greenDark,
  blueDark,
  pinkDark,
}

final appThemeData = {
  // LIGHT
  AppTheme.greenLight: lightTheme.copyWith(
    appBarTheme: const AppBarTheme().copyWith(
      color: Colors.green,
    ),
  ),
  AppTheme.blueLight: lightTheme.copyWith(
    appBarTheme: const AppBarTheme().copyWith(
      color: Colors.blue,
    ),
  ),
  AppTheme.pinkLight: lightTheme.copyWith(
    appBarTheme: const AppBarTheme().copyWith(
      color: Colors.pink,
    ),
  ),

  // DARK
  AppTheme.greenDark: darkTheme.copyWith(
    appBarTheme: const AppBarTheme().copyWith(
      color: Colors.green[800],
    ),
  ),
  AppTheme.blueDark: darkTheme.copyWith(
    appBarTheme: const AppBarTheme().copyWith(
      color: Colors.blue[800],
    ),
  ),
  AppTheme.pinkDark: darkTheme.copyWith(
    appBarTheme: const AppBarTheme().copyWith(
      color: Colors.pink[800],
    ),
  ),
};
