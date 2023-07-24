class Weather {
  final int temp;
  final int humidity;
  final int feelsLike;

  Weather(
      {required this.temp, required this.humidity, required this.feelsLike});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['temp'],
      humidity: json['humidity'],
      feelsLike: json['feels_like'],
    );
  }
}
