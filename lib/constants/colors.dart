import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static final accent = Color(0xFFB8E3FF); //Accent Color
  static final primary = Color(0xFF3F8DFD); //Primary Color
  static final darkPrimary = Color(0xFF16558F); //

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

  //Button Color
  static final buttonActive = Color(0xFF3F8DFD);

  //Font Color
  static final text = Color(0xFF202C44);
  static final textOnBg = Color(0xFFFFFFFF);
  static final greyText = Color(0xFF6C7888);
  static final blueText = Color(0xFF3F8DFD);
  static final hintText = Color(0xFF6C7888);
  static final linkText = Color(0xFF3F8DFD);

  //Form Color
  static final formOutline = Color(0xFFD8D8D8);
  static final formOutlineActive = Color(0xFFD8D8D8);

  //Icon Color
  static final icon = Color(0xFF130F26);
  static final iconActive = Color(0xFF3F8DFD);
  static final iconGrey = Color(0xFF6C7888);
  static final iconYellow = Color(0xFFFFA235);
  static final iconWhite = Color(0xFFFFFFFF);
}
