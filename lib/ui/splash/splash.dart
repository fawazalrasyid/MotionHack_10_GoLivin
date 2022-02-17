import 'dart:async';

import 'package:flutter/material.dart';
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
            // child: Image.asset('assets/images/rise.png'),
            width: 150,
            height: 150,
            color: Colors.amber,
            margin: EdgeInsets.symmetric(horizontal: 120),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              "0.1.1-beta",
              textAlign: TextAlign.center,
              // style: styleRegular.copyWith(color: kOnBackground, fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
