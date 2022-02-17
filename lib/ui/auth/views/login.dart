import 'package:flutter/material.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../utils/routes/routes.dart';

class LoginScreen extends StatelessWidget {
  // final emailC = TextEditingController(text: "tester@golivin.id");
  // final passC = TextEditingController(text: "123456");

  final authC = AuthController();
  final controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: controller.emailC,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: controller.passC,
            decoration: InputDecoration(labelText: "Password"),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () => authC.signin(
              context,
              controller.emailC.text,
              controller.passC.text,
            ),
            child: Text("Signin"),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Belum memiliki akun?"),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, Routes.register),
                child: Text("Daftar"),
              )
            ],
          )
        ]),
      ),
    );
  }
}
