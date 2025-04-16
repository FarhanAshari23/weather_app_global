import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/sources/weather_database_service.dart';
import 'package:weather_app/domain/entity/weather.dart';
import 'package:weather_app/domain/entity/weather_time.dart';
import 'package:weather_app/domain/repository/weather.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherDatabaseService weatherDatabaseService;

  WeatherRepositoryImpl({
    required this.weatherDatabaseService,
  });
  @override
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<WeatherEntity> getCurrentWeather(Position position) async {
    final weatherModel = await weatherDatabaseService.getCurrentWeather(
      position.latitude,
      position.longitude,
    );
    return WeatherEntity(
      timeNow: DateTime.now(),
      cityName: weatherModel.cityName,
      temperature: weatherModel.temperature,
      condition: weatherModel.condition,
      precipitationProbability: weatherModel.precipitationProbability,
    );
  }

  @override
  Future<WeatherTime?> getWeatherDataThreePM(Position position) async {
    try {
      final weatherModel = await weatherDatabaseService.getWeatherDataThreePM(
          position.latitude, position.longitude);
      return weatherModel?.toEntity();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<WeatherTime?> getWeatherDataNinePM(Position position) async {
    try {
      final weatherModel = await weatherDatabaseService.getWeatherDataNinePM(
          position.latitude, position.longitude);
      return weatherModel?.toEntity();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<WeatherTime?> getWeatherDataNineAM(Position position) async {
    try {
      final weatherModel = await weatherDatabaseService.getWeatherDataNineAM(
          position.latitude, position.longitude);
      return weatherModel?.toEntity();
    } catch (e) {
      return null;
    }
  }
}
