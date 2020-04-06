import 'package:cloud_firestore/cloud_firestore.dart';

class Networking {
  final CollectionReference cityCollection =
      Firestore.instance.collection('cities');

  Future<List<String>> getCitiesList() async {
    DocumentSnapshot querySnapshot = await Firestore.instance
        .collection('cities')
        .document("TFYQonabboBEubruoD2V")
        .get();
    if (querySnapshot.exists &&
        querySnapshot.data.containsKey('Cities') &&
        querySnapshot.data['Cities'] is List) {
      return List<String>.from(querySnapshot.data['Cities']);
    }
    return [];
  }

  getCity(String city) {
    return Firestore.instance
        .collection('cities')
        .document("TFYQonabboBEubruoD2V")
        .collection(city)
        .snapshots();
  }

  updateData(documentID, city) {
    final DocumentReference postRef = Firestore.instance
        .document('cities/' + 'TFYQonabboBEubruoD2V/' + '$city/' + documentID);
    Firestore.instance.runTransaction((Transaction tx) async {
      DocumentSnapshot postSnapshot = await tx.get(postRef);
      if (postSnapshot.exists) {
        await tx.update(postRef, <String, dynamic>{
          'timestamp':
              Timestamp.now().toDate().millisecondsSinceEpoch.toString(),
        });
      }
    });
  }
}
