import 'dart:async';

import 'package:golivin/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants/assets.dart';
import '../../constants/fonts.dart';
import '../../constants/strings.dart';
import '../../utils/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
    required this.userSnapshot,
  }) : super(key: key);

  final AsyncSnapshot<User?> userSnapshot;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateUser();
    super.initState();
  }

  navigateUser() async {
    final userSnapshot = widget.userSnapshot;

    if (userSnapshot.data != null && userSnapshot.data!.emailVerified) {
      Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.index,
          (Route<dynamic> route) => false,
        ),
      );
    } else if (userSnapshot.data != null) {
      Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.index,
          (Route<dynamic> route) => false,
        ),
      );
    } else {
      Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.login,
          (Route<dynamic> route) => false,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userSnapshot = widget.userSnapshot;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20.0),
          Container(
            child: Image.asset(Assets.appLogoSplash),
            margin: EdgeInsets.symmetric(horizontal: 100),
          ),
          Column(
            children: [
              if (userSnapshot.connectionState == ConnectionState.waiting)
                Container(
                  padding: EdgeInsets.only(bottom: 32),
                  child: CircularProgressIndicator(),
                ),
              Container(
                padding: EdgeInsets.only(bottom: 32),
                child: Text(
                  AppStrings.appVersion,
                  textAlign: TextAlign.center,
                  style: FontFamily.regular.copyWith(
                    color: AppColors.text,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
