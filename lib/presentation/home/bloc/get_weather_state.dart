// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entity/weather.dart';

import '../../../domain/entity/weather_time.dart';

abstract class GetWeatherState extends Equatable {}

class GetWeatherInitial extends GetWeatherState {
  @override
  List<Object?> get props => [];
}

class GetWeatherLoading extends GetWeatherState {
  @override
  List<Object?> get props => [];
}

class GetWeatherLoaded extends GetWeatherState {
  WeatherEntity weatherEntity;
  GetWeatherLoaded({
    required this.weatherEntity,
  });
  @override
  List<Object?> get props => [weatherEntity];
}

class GetWeatherTimeLoaded extends GetWeatherState {
  final WeatherTime weather;

  GetWeatherTimeLoaded({required this.weather});
  @override
  List<Object?> get props => [weather];
}

class GetWeatherFailure extends GetWeatherState {
  final String message;

  GetWeatherFailure({required this.message});
  @override
  List<Object?> get props => [message];
}
