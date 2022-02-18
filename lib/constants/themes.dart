import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    brightness: Brightness.light,
  ),
);

final ThemeData themeDataDark = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    brightness: Brightness.dark,
  ),
);
