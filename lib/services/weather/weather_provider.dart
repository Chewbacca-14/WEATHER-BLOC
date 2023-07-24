import 'dart:convert';

import 'package:weather_bloc/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherProvider {
  Future<Weather> getWeather(String city) async {
    final response = await http.get(
        Uri.parse('https://api.api-ninjas.com/v1/weather?city=$city'),
        headers: {'X-Api-Key': 'wSZZmn1PemmgC6Rky4SNQA==TSWSj4bKdlaxF7Tn'});

    if (response.statusCode == 200) {
      print(response.body);

      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
