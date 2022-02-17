import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes.dart';

class AuthController {
  final emailC = TextEditingController();
  final passC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> streamAuthStatus() {
    return auth.userChanges();
  }

  void signup(BuildContext context, String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      user!.updateDisplayName("Fawaz");

      // User? user = FirebaseAuth.instance.currentUser;

      // if (user != null && !user.emailVerified) {
      //   await user.sendEmailVerification();
      // }

      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.login,
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void signin(BuildContext context, String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      if (user != null && user.emailVerified) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home,
          (Route<dynamic> route) => false,
        );
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home,
          (Route<dynamic> route) => false,
        );

        if (user != null && !user.emailVerified) {
          result.user!.sendEmailVerification();
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void signout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.login,
      (Route<dynamic> route) => false,
    );
  }
}
