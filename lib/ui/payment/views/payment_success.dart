import 'dart:async';

import 'package:app/constants/lottie.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/routes/routes.dart';

class PaymentSuccessScreen extends StatefulWidget {
  @override
  _PaymentSuccessScreenState createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  navigateToHome() async {
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacementNamed(
        Routes.index,
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
