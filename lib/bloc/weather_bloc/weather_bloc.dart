import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/bloc/weather_bloc/weather_event.dart';
import 'package:weather_bloc/bloc/weather_bloc/weather_state.dart';
import 'package:weather_bloc/models/weather_model.dart';
import 'package:weather_bloc/services/city/city_repository.dart';
import 'package:weather_bloc/services/weather/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository weatherRepository = WeatherRepository();
  final CityRepository cityRepository; // Make it final and required

  WeatherBloc({required this.weatherRepository, required this.cityRepository})
      : super(WeatherInitialState()) {
    on<GetWeatherEvent>((event, emit) async {
      if (cityRepository.savedCities.isEmpty) {
        print('empty');
      } else {
        List<Weather> weatherList = [];
        for (int i = 0; i < cityRepository.savedCities.length; i++) {
          try {
            Weather weather = await weatherRepository
                .getWeather(cityRepository.savedCities[i]);
            weatherList.add(weather);
          } catch (_) {
            // Обработка ошибок API вызовов для каждого города
            weatherList.add(Weather(
                temp: 0,
                humidity: 0,
                feelsLike:
                    0)); // Здесь можно добавить дополнительные обработки ошибок
          }
        }
        emit(WeatherSuccessState(weatherList: weatherList),);
      }
    });
  }
}
