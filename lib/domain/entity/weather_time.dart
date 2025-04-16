import 'package:equatable/equatable.dart';

class WeatherTime extends Equatable {
  final double temp;
  final String main;

  const WeatherTime({
    required this.temp,
    required this.main,
  });

  @override
  List<Object?> get props => [temp, main];
}
