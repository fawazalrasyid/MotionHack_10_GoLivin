import 'package:app/utils/validators/form_validator.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../controllers/auth/auth_controller.dart';
import '../../../utils/routes/routes.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authC = AuthController();
  final controller = LoginController();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  bool _securePass = true;

  void toggleObscurePass() {
    setState(() {
      _securePass = !_securePass;
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
              Container(
                child: Image.asset(Assets.appLogoSplash),
                margin: EdgeInsets.all(64),
              ),
              SizedBox(height: 16),
              Text(
                "Let's get\nstarted.",
                style: FontFamily.bold.copyWith(
                  color: AppColors.text,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "find your own house",
                style: FontFamily.regular.copyWith(
                  color: AppColors.greyText,
                  fontSize: 18,
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
                    SizedBox(height: 64),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          backgroundColor: AppColors.buttonActive,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: FontFamily.semiBold.copyWith(
                            color: AppColors.textOnBg,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () => _doLogin(),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: FontFamily.regular.copyWith(
                            color: AppColors.text,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, Routes.register),
                          child: Text(
                            "Register",
                            style: FontFamily.medium.copyWith(
                              color: AppColors.linkText,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
    if (controller.formKey.currentState!.validate()) {
      // dismiss keyboard during async call
      FocusScope.of(context).requestFocus(FocusNode());

      authC.signin(
        context,
        controller.emailC.text,
        controller.passC.text,
      );
    }

    _autoValidate = AutovalidateMode.onUserInteraction;
  }
}
