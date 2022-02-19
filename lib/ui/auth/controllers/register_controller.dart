import 'package:flutter/material.dart';

class RegisterController {
  final formKey = GlobalKey<FormState>();

  // final nameC = TextEditingController();
  // final phoneNumberC = TextEditingController();
  // final emailC = TextEditingController();
  // final passC = TextEditingController();
  // final confirmPassC = TextEditingController();

  final nameC = TextEditingController(text: "Tester");
  final phoneNumberC = TextEditingController(text: "0853343434434");
  final emailC = TextEditingController(text: "tester@golivin.id");
  final passC = TextEditingController(text: "123456");
  final confirmPassC = TextEditingController(text: "123456");
}
