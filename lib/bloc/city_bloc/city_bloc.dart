import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/bloc/city_bloc/city_event.dart';
import 'package:weather_bloc/bloc/city_bloc/city_state.dart';

import 'package:weather_bloc/models/city_model.dart';
import 'package:weather_bloc/services/city/city_repository.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final CityRepository cityRepository; // Make it final and required

  CityBloc({required this.cityRepository}) : super(CityInitialState()) {
    on<GetCityEvent>((event, emit) async {
      print('added');
      emit(CityLoadingState());
      print('loading');

      try {
        cityRepository.getCity(event.name);
        print(event.name);
        final List<City> cities = await cityRepository.getCity(event.name);

        emit(CitySuccessState(name: cities));
      } catch (_) {
        emit(CityErrorState());
      }
    });
    on<SaveCityEvent>((event, emit) {
      cityRepository.savedCities.add(event.city);
      print(cityRepository.savedCities.toString());
    });
  }
}
