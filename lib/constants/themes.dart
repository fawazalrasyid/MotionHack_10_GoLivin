import 'package:app/constants/colors.dart';
import 'package:app/constants/fonts.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  fontFamily: FontFamily.productSans,
  // brightness: Brightness.light,
  // primaryColor: AppColors.mediumGreen,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.mediumGreen,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.mediumGreen,
    secondary: AppColors.green,
    brightness: Brightness.light,
  ),
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.productSans,
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
