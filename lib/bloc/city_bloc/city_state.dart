import 'package:weather_bloc/models/city_model.dart';

abstract class CityState {}

class CityInitialState extends CityState {}

class CitySuccessState extends CityState {
  final List<City> name;

  CitySuccessState({required this.name});
}

class CityLoadingState extends CityState {}

class CityErrorState extends CityState {}
