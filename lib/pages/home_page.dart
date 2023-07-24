import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/bloc/city_bloc/city_bloc.dart';
import 'package:weather_bloc/bloc/city_bloc/city_event.dart';
import 'package:weather_bloc/bloc/city_bloc/city_state.dart';
import 'package:weather_bloc/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_bloc/bloc/weather_bloc/weather_event.dart';
import 'package:weather_bloc/bloc/weather_bloc/weather_state.dart';
import 'package:weather_bloc/models/city_model.dart';
import 'package:weather_bloc/models/weather_model.dart';
import 'package:weather_bloc/services/city/city_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    CityProvider().getCity('Prague');
  }

  @override
  Widget build(BuildContext context) {
    final CityBloc userBloc = BlocProvider.of<CityBloc>(context);
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            onChanged: (name) {
              userBloc.add(GetCityEvent(name: name));
            },
            decoration: const InputDecoration(
              hintText: 'city',
            ),
          ),
          BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              if (state is CityLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ));
              }
              if (state is CitySuccessState) {
                final List<City> cities = state.name;
                return SizedBox(
                  width: 300,
                  height: 600,
                  child: ListView.builder(
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      final City city = cities[index];
                      return GestureDetector(
                        onTap: () {
                          userBloc.add(SaveCityEvent(city: city.name));
                          weatherBloc.add(GetWeatherEvent());
                        },
                        child: Text(
                          city.name,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
            if (state is WeatherLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
            if (state is WeatherSuccessState) {
              final List<Weather> weatherList = state.weatherList;
              return Expanded(
                child: ListView.builder(
                  itemCount: weatherList.length,
                  itemBuilder: (context, index) {
                    final Weather weather = weatherList[index];
                    return ListTile(
                      title: Text('Temperature: ${weather.temp}°C'),
                      subtitle: Text(
                          'Humidity: ${weather.humidity}%, Feels like: ${weather.feelsLike}°C'),
                    );
                  },
                ),
              );
            }
            return const SizedBox();
          })
        ],
      ),
    );
  }
}
