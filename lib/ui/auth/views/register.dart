import 'package:flutter/material.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../controllers/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  final authC = AuthController();
  final controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: controller.nameC,
            decoration: InputDecoration(labelText: "Nama"),
          ),
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
            onPressed: () => authC.signup(
              context,
              controller.emailC.text,
              controller.passC.text,
            ),
            child: Text("Daftar"),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sudah memiliki akun?"),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Signin"),
              )
            ],
          )
        ]),
      ),
    );
  }
}
