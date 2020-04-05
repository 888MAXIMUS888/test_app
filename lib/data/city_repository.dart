import 'package:test_app/data/city_model.dart';
import 'package:test_app/networking.dart';

abstract class Repository {
  fetchCities();
}

class CityRepository implements Repository {
  @override
  fetchCities() {
    final cities = Networking().getCitiesList();
    print("cities => $cities");
    return City(cityName: cities);
  }
}
