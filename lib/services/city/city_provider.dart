import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_bloc/models/city_model.dart';

class CityProvider {
  

  Future<List<City>> getCity(String name) async {
    final response = await http.get(
        Uri.parse('https://api.api-ninjas.com/v1/city?name=$name&limit=30'),
        headers: {'X-Api-Key': 'wSZZmn1PemmgC6Rky4SNQA==TSWSj4bKdlaxF7Tn'});

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((json) => City.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
