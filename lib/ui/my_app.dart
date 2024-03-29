import 'package:golivin/ui/splash/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        if (snapshot.connectionState == ConnectionState.active) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
            ),
          );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            themeMode: ThemeMode.light,
            theme: themeData,
            routes: Routes.routes,
            home: SplashScreen(
              userSnapshot: snapshot,
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
