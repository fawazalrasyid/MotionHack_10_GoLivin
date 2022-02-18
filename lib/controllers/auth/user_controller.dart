import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user.dart';

class UserController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final usersRef =
      FirebaseFirestore.instance.collection('users').withConverter<UserM>(
            fromFirestore: (snapshot, _) => UserM.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );

  Future<UserM> getCurrentUser() async {
    final User? user = auth.currentUser;

    UserM userData = await usersRef
        .doc(user?.uid)
        .get()
        .then((snapshot) => snapshot.data()!);

    return userData;
  }
}
