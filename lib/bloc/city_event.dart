part of 'city_bloc.dart';

abstract class CityEvent extends Equatable {
  const CityEvent();
}

class GetCity extends CityEvent{
  final List<String> citiesName;
  // final List<String> citiesName;

  const GetCity({this.citiesName});

  @override
  List<Object> get props => [citiesName];
}