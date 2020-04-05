import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/data/city_model.dart';
import 'package:test_app/data/city_repository.dart';
import 'package:test_app/networking.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final Repository repository;
  CityBloc(this.repository);

  List<String> asdad = ["asd", 'asd'];
  @override
  CityState get initialState => CityInitial(city: City(cityName: asdad));

  @override
  Stream<CityState> mapEventToState(
    CityEvent event,
  ) async* {
    yield CityLoading();
    if(event is GetCity){
      print("GetCity");
      try{
        // final cities = await repository.fetchCities();
        final cities =Networking().getCitiesList();
        print("cities => $cities");
        yield CityLoaded(city: cities);
      } on NetworkError {
        print("Error");
      }
    }
  }
}

class NetworkError extends Error {}
