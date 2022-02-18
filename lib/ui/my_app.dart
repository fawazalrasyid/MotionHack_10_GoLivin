import 'package:app/ui/splash/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../constants/themes.dart';
import '../controllers/auth/auth_controller.dart';
import '../utils/routes/routes.dart';

class MyApp extends StatelessWidget {
  final authC = AuthController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus(),
      builder: (context, snapshot) {
        // print(snapshot.data);
        // if (snapshot.connectionState == ConnectionState.active) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          themeMode: ThemeMode.light,
          theme: themeData,
          darkTheme: themeDataDark,
          routes: Routes.routes,
          home: SplashScreen(
            userSnapshot: snapshot,
          ),
        );
        // }
        // return CircularProgressIndicator();
      },
    );
  }
}
