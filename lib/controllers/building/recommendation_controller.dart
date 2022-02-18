import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/building.dart';

class RecommendationController {
  final recommendationRef = FirebaseFirestore.instance
      .collection('recommendation')
      .withConverter<Building>(
        fromFirestore: (snapshot, _) => Building.fromJson(snapshot.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );

  Future<List<Building>> getRecommendationBuilding() async {
    List<Building> recommendationData = await recommendationRef
        .get()
        .then((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
    ;

    return recommendationData;
  }
}
