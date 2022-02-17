import 'package:flutter/material.dart';

import '../../../controllers/auth/auth_controller.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final authC = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Home"),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => authC.signout(context),
              child: Text("Sign out"),
            )
          ],
        ),
      ),
    );
  }
}
