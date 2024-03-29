import 'package:golivin/constants/fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/routes/routes.dart';

class AuthController {
  final emailC = TextEditingController();
  final passC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> streamAuthStatus() {
    return auth.userChanges();
  }

  void signup(
    BuildContext context,
    String name,
    String phoneNumber,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        await user.updateDisplayName(name);

        await user.sendEmailVerification();

        // save current userData to firestore
        _saveUserDataToFirestore(user, name, phoneNumber);
      }

      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.register_succes,
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _showDialog(context, 'The account already exists for that email');

        print('The account already exists for that email.');
      } else if (e.code == 'weak-password') {
        _showDialog(context, 'The password provided is too weak');

        print('The password provided is too weak.');
      }
    } catch (e) {
      print(e);
    }
  }

  void _saveUserDataToFirestore(
    User currentUser,
    String name,
    String phoneNumber,
  ) {
    final User? user = currentUser;

    final CollectionReference<Map<String, dynamic>> usersRef =
        FirebaseFirestore.instance.collection('users');
    usersRef.doc(user?.uid).set({
      'id': user?.uid,
      'displayName': name,
      'phoneNumber': phoneNumber,
      'email': user?.email,
      'createdAt': user?.metadata.creationTime,
    });
  }

  void signin(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null && user.emailVerified) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.index,
          (Route<dynamic> route) => false,
        );
      } else if (user != null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.index,
          (Route<dynamic> route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _showDialog(context, 'No user found');

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _showDialog(context, 'Wrong password provided');

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

  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Oops...',
            style: FontFamily.semiBold.copyWith(
              color: AppColors.text,
              fontSize: 18,
            ),
          ),
          content: Text(
            message,
            style: FontFamily.regular.copyWith(
              color: AppColors.text,
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
                style: FontFamily.semiBold.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
