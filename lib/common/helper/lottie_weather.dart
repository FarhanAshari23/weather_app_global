import 'package:weather_app/core/configs/assets/app_lotties.dart';

class LottieWeather {
  String getWeatherAnimation(String? condition) {
    if (condition == null) return AppLotties.sunny;

    switch (condition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return AppLotties.cloud;
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return AppLotties.rain;
      case 'thunderstorm':
        return AppLotties.thunder;
      case 'sunny':
        return AppLotties.sunny;
      default:
        return AppLotties.sunny;
    }
  }
}
