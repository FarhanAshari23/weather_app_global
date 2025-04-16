import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entity/weather_time.dart';

class WeatherTimeModel extends Equatable {
  final double temp;
  final String main;

  const WeatherTimeModel({required this.temp, required this.main});

  factory WeatherTimeModel.fromJson(Map<String, dynamic> json) {
    return WeatherTimeModel(
      temp: (json['main']['temp'] as num).toDouble(),
      main: json['weather'][0]['main'] as String,
    );
  }

  WeatherTime toEntity() {
    return WeatherTime(temp: temp, main: main);
  }

  @override
  List<Object?> get props => [temp, main];
}
