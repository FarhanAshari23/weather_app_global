class WeatherModel {
  final String cityName;
  final double temperature;
  final String condition;
  final double precipitationProbability;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.precipitationProbability,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final forecast = json['list'][0];
    return WeatherModel(
      cityName: json['city']['name'],
      temperature: (forecast['main']['temp'] as num).toDouble(),
      condition: forecast['weather'][0]['main'],
      precipitationProbability: (forecast['pop'] as num).toDouble(),
    );
  }
}
