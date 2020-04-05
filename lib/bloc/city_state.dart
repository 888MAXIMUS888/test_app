part of 'city_bloc.dart';

abstract class CityState extends Equatable {
  const CityState();
}

class CityInitial extends CityState {
  final City city;

  const CityInitial({this.city});

  @override
  List<Object> get props => [city];
}

class CityLoading extends CityState {
  const CityLoading();

  @override
  List<Object> get props => [];
}

class CityLoaded extends CityState {
  final city;

  const CityLoaded({this.city});

  @override
  List<Object> get props => [city];
}

class CityError extends CityState {
  final String message;

  const CityError({this.message});

  @override
  List<Object> get props => [message];
}
