import 'package:flutter/material.dart';

import '../../ui/auth/views/login.dart';
import '../../ui/auth/views/register.dart';
import '../../ui/auth/views/register_success.dart';
import '../../ui/index.dart';

class Routes {
  Routes._();

  static const String register = '/register';
  static const String register_succes = '/register-succes';
  static const String login = '/login';
  static const String index = '/index';
  // static const String detail = '/detail';

  static final routes = <String, WidgetBuilder>{
    register: (BuildContext context) => RegisterScreen(),
    register_succes: (BuildContext context) => RegisterSuccessScreen(),
    index: (BuildContext context) => IndexScreen(),
    login: (BuildContext context) => LoginScreen(),
    // detail: (BuildContext context) => DetailScreen(buildingData: arguments),
  };
}
