import 'package:geolocator/geolocator.dart';
import 'package:weather_app/domain/entity/weather.dart';

import '../entity/weather_time.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getCurrentWeather(Position position);
  Future<WeatherTime?> getWeatherDataNinePM(Position position);
  Future<WeatherTime?> getWeatherDataThreePM(Position position);
  Future<WeatherTime?> getWeatherDataNineAM(Position position);
  Future<Position> getCurrentLocation();
}
