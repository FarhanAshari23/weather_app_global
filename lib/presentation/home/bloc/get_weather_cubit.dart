import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/entity/weather.dart';
import '../../../domain/repository/weather.dart';
import 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  final WeatherRepository weatherRepository;
  GetWeatherCubit({required this.weatherRepository})
      : super(GetWeatherLoading());

  Future<void> fetchWeatherForNow() async {
    emit(GetWeatherLoading());
    try {
      final position = await weatherRepository.getCurrentLocation();
      final weather = await weatherRepository.getCurrentWeather(position);

      emit(
        GetWeatherLoaded(
          weatherEntity: WeatherEntity(
            timeNow: DateTime.now(),
            cityName: weather.cityName,
            temperature: weather.temperature,
            condition: weather.condition,
            precipitationProbability: weather.precipitationProbability,
          ),
        ),
      );
    } catch (e) {
      emit(GetWeatherFailure(message: 'Terjadi kesalahan: $e'));
    }
  }

  Future<void> getWeatherDataThreePM() async {
    emit(GetWeatherLoading());
    try {
      final position = await weatherRepository.getCurrentLocation();
      final weather = await weatherRepository.getWeatherDataThreePM(position);
      if (weather != null) {
        emit(GetWeatherTimeLoaded(weather: weather));
      } else {
        emit(
          GetWeatherFailure(
              message: 'Data cuaca pada jam 15:00 tidak ditemukan.'),
        );
      }
    } catch (e) {
      emit(GetWeatherFailure(message: 'Terjadi kesalahan: $e'));
    }
  }

  Future<void> getWeatherDataNinePM() async {
    emit(GetWeatherLoading());
    try {
      final position = await weatherRepository.getCurrentLocation();
      final weather = await weatherRepository.getWeatherDataNinePM(position);
      if (weather != null) {
        emit(GetWeatherTimeLoaded(weather: weather));
      } else {
        emit(
          GetWeatherFailure(
              message: 'Data cuaca pada jam 21:00 tidak ditemukan.'),
        );
      }
    } catch (e) {
      emit(GetWeatherFailure(message: 'Terjadi kesalahan: $e'));
    }
  }

  Future<void> getWeatherDataNineAM() async {
    emit(GetWeatherLoading());
    try {
      final position = await weatherRepository.getCurrentLocation();
      final weather = await weatherRepository.getWeatherDataNineAM(position);
      if (weather != null) {
        emit(GetWeatherTimeLoaded(weather: weather));
      } else {
        emit(
          GetWeatherFailure(
              message: 'Data cuaca pada jam 09:00 AM tidak ditemukan.'),
        );
      }
    } catch (e) {
      emit(GetWeatherFailure(message: 'Terjadi kesalahan: $e'));
    }
  }
}
