import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../controllers/auth/auth_controller.dart';
import '../../../utils/validators/form_validator.dart';
import '../controllers/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final authC = AuthController();
  final controller = RegisterController();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  bool _securePass = true;
  bool _secureConfirmPass = true;

  void toggleObscurePass() {
    setState(() {
      _securePass = !_securePass;
    });
  }

  void toggleObscureConfirmPass() {
    setState(() {
      _secureConfirmPass = !_secureConfirmPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                "Register\nan account.",
                style: FontFamily.bold.copyWith(
                  color: AppColors.text,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 32),
              Form(
                key: controller.formKey,
                autovalidateMode: _autoValidate,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: controller.nameC,
                        validator: (value) => FormValidator.validateName(
                          value.toString(),
                        ),
                        style: FontFamily.regular.copyWith(
                          color: AppColors.text,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.all(14),
                          hintText: "Name",
                          hintStyle: FontFamily.regular.copyWith(
                            color: AppColors.hintText,
                            fontSize: 16,
                          ),
                          hoverColor: AppColors.formOutline,
                          fillColor: AppColors.formOutlineActive,
                        ),
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: controller.phoneNumberC,
                        validator: (value) => FormValidator.validatePhoneNumber(
                          value.toString(),
                        ),
                        style: FontFamily.regular.copyWith(
                          color: AppColors.text,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.all(14),
                          hintText: "Phone Number",
                          hintStyle: FontFamily.regular.copyWith(
                            color: AppColors.hintText,
                            fontSize: 16,
                          ),
                          hoverColor: AppColors.formOutline,
                          fillColor: AppColors.formOutlineActive,
                        ),
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailC,
                        validator: (value) => FormValidator.validateEmail(
                          value.toString(),
                        ),
                        style: FontFamily.regular.copyWith(
                          color: AppColors.text,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.all(14),
                          hintText: "Email",
                          hintStyle: FontFamily.regular.copyWith(
                            color: AppColors.hintText,
                            fontSize: 16,
                          ),
                          hoverColor: AppColors.formOutline,
                          fillColor: AppColors.formOutlineActive,
                        ),
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: controller.passC,
                        obscureText: _securePass,
                        validator: (value) => FormValidator.validatePassword(
                          value.toString(),
                        ),
                        style: FontFamily.regular.copyWith(
                          color: AppColors.text,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.all(14),
                          hintText: "Password",
                          hintStyle: FontFamily.regular.copyWith(
                            color: AppColors.hintText,
                            fontSize: 16,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _securePass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.icon,
                            ),
                            onPressed: toggleObscurePass,
                          ),
                          hoverColor: AppColors.formOutline,
                          fillColor: AppColors.formOutlineActive,
                        ),
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: controller.confirmPassC,
                        obscureText: _secureConfirmPass,
                        validator: (value) => FormValidator.validatePassword(
                          value.toString(),
                        ),
                        style: FontFamily.regular.copyWith(
                          color: AppColors.text,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.all(14),
                          hintText: "Password",
                          hintStyle: FontFamily.regular.copyWith(
                            color: AppColors.hintText,
                            fontSize: 16,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _secureConfirmPass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.icon,
                            ),
                            onPressed: toggleObscureConfirmPass,
                          ),
                          hoverColor: AppColors.formOutline,
                          fillColor: AppColors.formOutlineActive,
                        ),
                      ),
                      SizedBox(height: 64),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            backgroundColor: AppColors.button,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Register",
                            style: FontFamily.semiBold.copyWith(
                              color: AppColors.textOnBg,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () => _doRegister(),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: FontFamily.regular.copyWith(
                              color: AppColors.text,
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Login",
                              style: FontFamily.medium.copyWith(
                                color: AppColors.linkText,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doRegister() async {
    if (controller.formKey.currentState!.validate()) {
      // dismiss keyboard during async call
      FocusScope.of(context).requestFocus(FocusNode());

      authC.signup(
        context,
        controller.nameC.text,
        controller.phoneNumberC.text,
        controller.emailC.text,
        controller.passC.text,
      );
    }

    _autoValidate = AutovalidateMode.onUserInteraction;
  }
}
