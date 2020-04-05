import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/data/city_model.dart';

class Networking {
  final CollectionReference cityCollection =
      Firestore.instance.collection('cities');

   Stream<QuerySnapshot> getCitiesList() {
    return Firestore.instance.collection("cities").limit(100).snapshots();
  }
}
