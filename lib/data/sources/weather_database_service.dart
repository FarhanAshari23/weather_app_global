import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/weather.dart';
import '../models/weather_time.dart';

abstract class WeatherDatabaseService {
  Future<WeatherModel> getCurrentWeather(double latitude, double longitude);
  Future<WeatherTimeModel?> getWeatherDataThreePM(
      double latitude, double longitude);
  Future<WeatherTimeModel?> getWeatherDataNinePM(
      double latitude, double longitude);
  Future<WeatherTimeModel?> getWeatherDataNineAM(
      double latitude, double longitude);
}

class WeatherDatabaseServiceImpl extends WeatherDatabaseService {
  final http.Client client;
  final String apiKey = '2fb36ed5458c6fae053ca1a1ad42019b';

  WeatherDatabaseServiceImpl({
    required this.client,
  });
  @override
  Future<WeatherModel> getCurrentWeather(
      double latitude, double longitude) async {
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric&cnt=1';
    final response = await client.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = json.decode(response.body);
      return WeatherModel.fromJson(decodedJson);
    } else {
      throw Exception('Failed to load current weather');
    }
  }

  @override
  Future<WeatherTimeModel?> getWeatherDataThreePM(
      double latitude, double longitude) async {
    final apiUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    final response = await client.get(apiUrl);

    DateTime now = DateTime.now();
    String year = now.year.toString();
    String month = now.month.toString().padLeft(2, '0');
    String day = now.day.toString().padLeft(2, '0');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> forecastList = data['list'];

      // Cari data pada jam 18:00
      for (var forecast in forecastList) {
        if (forecast['dt_txt']
            .toString()
            .endsWith('$year-$month-$day 15:00:00')) {
          return WeatherTimeModel.fromJson(forecast);
        }
      }
      return null; // Tidak ada data pada jam 18:00
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Future<WeatherTimeModel?> getWeatherDataNinePM(
      double latitude, double longitude) async {
    final apiUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    final response = await client.get(apiUrl);

    DateTime now = DateTime.now();
    String year = now.year.toString();
    String month = now.month.toString().padLeft(2, '0');
    String day = now.day.toString().padLeft(2, '0');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> forecastList = data['list'];

      // Cari data pada jam 18:00
      for (var forecast in forecastList) {
        if (forecast['dt_txt']
            .toString()
            .endsWith('$year-$month-$day 21:00:00')) {
          return WeatherTimeModel.fromJson(forecast);
        }
      }
      return null; // Tidak ada data pada jam 18:00
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Future<WeatherTimeModel?> getWeatherDataNineAM(
      double latitude, double longitude) async {
    final apiUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    final response = await client.get(apiUrl);

    DateTime now = DateTime.now();
    String year = now.year.toString();
    String month = now.month.toString().padLeft(2, '0');
    String day = now.day.toString().padLeft(2, '0');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> forecastList = data['list'];

      // Cari data pada jam 18:00
      for (var forecast in forecastList) {
        if (forecast['dt_txt']
            .toString()
            .endsWith('$year-$month-$day 09:00:00')) {
          return WeatherTimeModel.fromJson(forecast);
        }
      }
      return null; // Tidak ada data pada jam 18:00
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
