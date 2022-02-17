import 'package:flutter/material.dart';

import '../../../controllers/auth/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authC = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
