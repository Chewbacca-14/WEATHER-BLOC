abstract class CityEvent {}

class GetCityEvent extends CityEvent {
  final String name;
  GetCityEvent({required this.name});
}

class SaveCityEvent extends CityEvent {
  String city;

  SaveCityEvent({required this.city});
}

class DeleteCityEvent extends CityEvent {}
