class WeatherEntity {
  final String cityName;
  final double temperature;
  final String condition;
  final double precipitationProbability;
  final DateTime timeNow;

  WeatherEntity({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.precipitationProbability,
    required this.timeNow,
  });
}
