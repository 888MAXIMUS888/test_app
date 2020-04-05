import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class City extends Equatable {
  // final List<String> cityName;
  final cityName;

  City({@required this.cityName});

  factory City.fromFirestore(DocumentSnapshot doc){
    return City(cityName: doc.data['cities']);
  }

  @override
  List<Object> get props => [cityName];

  // @override
  // List<Object> get props => [cityName];
}
