import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static final green = Color(0xFF3F803E); //Accent Color
  static final mediumGreen = Color(0xFF33683F); //Primary Color
  static final darkGreen = Color(0xFF2B5740); //PrimaryDark Color
  static final grey = Color(0xFFE2E4EA);

  // BottomNavBar Color
  static final selectedItem = Color(0xFF346A3F);
  static final unselectedItem = Color(0xFF99A6C0);
  static final bottomNavBgColor = Color(0xFFFFFFFF);

  //Background Color
  static final background = Color(0xFFFFFFFF);
  static final backgroundGradient = [Color(0xFFFFFFFF), Color(0xFFF8F8FD)];

  //Font Color
  static final text = Color(0xFF202C44);
  static final bodyText = Color(0xFF818181);

  //Icon Color
  static final icon = Color(0xFFA197A1);
}
