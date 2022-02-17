import 'package:flutter/material.dart';

import '../../ui/auth/views/login.dart';
import '../../ui/auth/views/register.dart';
import '../../ui/home/views/home.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String register = '/register';
  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    // splash: (BuildContext context) => SplashScreen(),
    register: (BuildContext context) => RegisterScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
  };
}
