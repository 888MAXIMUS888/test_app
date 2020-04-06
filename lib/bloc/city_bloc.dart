import 'package:rxdart/rxdart.dart';
import 'package:test_app/data/city_repository.dart';

class CityBloc {
  final cityCollection = BehaviorSubject();
  final places = BehaviorSubject();
  final _repository = Repository();

  List<String> cities;

  Observable get outCityCollection => cityCollection.stream;
  Observable get outPlaces => places.stream;

  getCityCollection() async {
    cities = await _repository.getCityCollection();
    cityCollection.add(cities);
  }

  getCity(String city) => _repository.getCity(city);

  updateData(String documentID, String city) =>
      _repository.updateData(documentID, city);

  seachCity(String query) {
    List<String> filter;
    filter = cities
        .where((value) => value.toLowerCase().contains(query.toLowerCase()))
        .toList();
    cityCollection.add(filter);
  }

  dispose() {
    cityCollection.close();
    places.close();
  }
}
