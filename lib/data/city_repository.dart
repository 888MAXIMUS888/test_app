import 'package:test_app/data/city_model.dart';
import 'package:test_app/networking.dart';

class Repository {
  final networking = Networking();

  getCityCollection() => networking.getCitiesList();

  getCity(String city) => networking.getCity(city);

  updateData(String documentID, String city) => networking.updateData(documentID, city);
}
