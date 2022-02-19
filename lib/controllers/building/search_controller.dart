import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/building.dart';

class SearchController {
  final nearbyRef = FirebaseFirestore.instance
      .collection('buildings')
      .withConverter<Building>(
        fromFirestore: (snapshot, _) => Building.fromJson(snapshot.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );

  Future<List<Building>> getBuilding() async {
    List<Building> nearbyData = await nearbyRef
        .get()
        .then((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
    ;

    return nearbyData;
  }
}
