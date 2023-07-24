import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/bloc/city_bloc/city_bloc.dart';
import 'package:weather_bloc/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_bloc/pages/home_page.dart';
import 'package:weather_bloc/services/city/city_repository.dart';
import 'package:weather_bloc/services/weather/weather_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CityBloc>(
          create: (BuildContext context) =>
              CityBloc(cityRepository: CityRepository()),
        ),
        BlocProvider<WeatherBloc>(
          create: (BuildContext context) => WeatherBloc(
              weatherRepository: WeatherRepository(),
              cityRepository: CityRepository()),
        ),
      ],
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
