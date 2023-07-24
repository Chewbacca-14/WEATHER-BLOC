import 'package:weather_bloc/models/weather_model.dart';
import 'package:weather_bloc/services/weather/weather_provider.dart';

class WeatherRepository {
  final WeatherProvider weatherProvider = WeatherProvider();

  Future<Weather> getWeather(String city) =>
      weatherProvider.getWeather(city);
}
