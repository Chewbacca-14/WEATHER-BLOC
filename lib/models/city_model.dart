class City {
  final String name;
  final double latitude;
  final double longitude;
  final int population;

  City(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.population});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      population: json['population'] ?? 0,
    );
  }
}
