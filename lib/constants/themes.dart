import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  // fontFamily: FontFamily.poppins,
  // brightness: Brightness.light,
  // primaryColor: AppColors.mediumGreen,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.accent,
    brightness: Brightness.light,
  ),
);

final ThemeData themeDataDark = ThemeData(
  // fontFamily: FontFamily.poppins,
  // brightness: Brightness.dark,
  // primaryColor: AppColors.mediumGreen,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.mediumGreen,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.mediumGreen,
    secondary: AppColors.green,
    brightness: Brightness.dark,
  ),
);
