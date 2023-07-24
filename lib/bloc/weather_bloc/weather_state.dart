import 'package:weather_bloc/models/weather_model.dart';

abstract class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  List<Weather> weatherList;

  WeatherSuccessState({required this.weatherList});
}

class WeatherErrorState extends WeatherState {}

class WeatherInitialState extends WeatherState {}
