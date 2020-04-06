import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class City {
  List cityName;
  final List places;
  final String timestamp;
  final DocumentReference reference;

  City({@required this.cityName, this.timestamp, this.places, this.reference});

  City.fromMap(Map<String, dynamic> data) 
      : this(cityName: new List<String>.from(data['Cities']),
      );


    City.fromMap2(Map<String, dynamic> map, {this.reference})
     : assert(map['places'] != null),
       assert(map['timestamp'] != null),
       places = map['places'],
       timestamp = map['timestamp'];

 City.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap2(snapshot.data, reference: snapshot.reference);
}
