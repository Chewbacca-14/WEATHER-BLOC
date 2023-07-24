import 'package:weather_bloc/models/city_model.dart';
import 'package:weather_bloc/services/city/city_provider.dart';

class CityRepository {
  final CityProvider _cityProvider = CityProvider();
  List<String> savedCities = [];
  Future<List<City>> getCity(String name) => _cityProvider.getCity(name);
}
