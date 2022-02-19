import 'dart:async';

import 'package:golivin/constants/lottie.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/routes/routes.dart';

class RegisterSuccessScreen extends StatefulWidget {
  @override
  _RegisterSuccessScreenState createState() => _RegisterSuccessScreenState();
}

class _RegisterSuccessScreenState extends State<RegisterSuccessScreen> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  navigateToHome() async {
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacementNamed(
        Routes.login,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 100),
        child: Center(
          child: Lottie.asset(AppLottie.payment_success),
        ),
      ),
    );
  }
}
