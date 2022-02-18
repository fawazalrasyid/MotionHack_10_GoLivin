import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/building.dart';

class NearbyController {
  final nearbyRef =
      FirebaseFirestore.instance.collection('nearby').withConverter<Building>(
            fromFirestore: (snapshot, _) => Building.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );

  Future<List<Building>> getNearbyBuilding() async {
    List<Building> nearbyData = await nearbyRef
        .get()
        .then((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
    ;

    return nearbyData;
  }
}
