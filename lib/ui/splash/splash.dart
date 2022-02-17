import 'dart:async';

import 'package:app/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../constants/assets.dart';
import '../../constants/fonts.dart';
import '../../utils/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
    required this.userSnapshot,
  }) : super(key: key);

  final userSnapshot;

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
          Routes.home,
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20.0),
          Container(
            child: Image.asset(Assets.appLogoSplash),
            margin: EdgeInsets.symmetric(horizontal: 100),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 32),
            child: Text(
              "0.0.1-beta",
              textAlign: TextAlign.center,
              style: FontFamily.regular.copyWith(
                color: AppColors.text,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
