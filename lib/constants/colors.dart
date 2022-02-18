import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  //Accent Color
  static final primary = Color(0xFF3F8DFD); // Primary Color
  static final secondary = Color(0xFF73B2FF); // Accent/Secondary Color
  static final darkPrimary = Color(0xFF16558F); // Primary Dark Color

  // General Color
  static final skyBlue = Color(0xFF73B2FF);
  static final silverCity = Color(0xFFE2E4EA);

  // BottomNavBar Color
  static final bottomNavBgColor = Color(0xFFFFFFFF);

  //Background Color
  static final background = Color(0xFFFFFFFF);
  static final backgroundGradient = [Color(0xFFFFFFFF), Color(0xFFF8F8FD)];

  //Button Color
  static final button = Color(0xFF3F8DFD);
  static final buttonDisable = Color(0xFF3F8DFD);

  //Font Color
  static final text = Color(0xFF202C44);
  static final textOnBg = Color(0xFFFFFFFF);
  static final hintText = Color(0xFF6C7888);
  static final linkText = Color(0xFF3F8DFD);
  static final greyText = Color(0xFF6C7888);
  static final blueText = Color(0xFF3F8DFD);

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
