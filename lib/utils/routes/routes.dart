import 'package:flutter/material.dart';

import '../../ui/auth/views/login.dart';
import '../../ui/auth/views/register.dart';
import '../../ui/index.dart';

class Routes {
  Routes._();

  static const String register = '/register';
  static const String login = '/login';
  static const String index = '/index';
  // static const String detail = '/detail';

  static final routes = <String, WidgetBuilder>{
    register: (BuildContext context) => RegisterScreen(),
    login: (BuildContext context) => LoginScreen(),
    index: (BuildContext context) => IndexScreen(),
    // detail: (BuildContext context) => DetailScreen(buildingData: arguments),
  };
}
