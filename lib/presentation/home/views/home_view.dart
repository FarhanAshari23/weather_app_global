// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/common/helper/lottie_weather.dart';
import 'package:weather_app/data/sources/weather_database_service.dart';
import 'package:weather_app/presentation/home/bloc/get_weather_cubit.dart';
import 'package:weather_app/presentation/home/bloc/get_weather_state.dart';
import 'package:weather_app/presentation/home/widgets/show_weather.dart';

import '../../../core/configs/assets/app_lotties.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../data/repository/weather_repository_impl.dart';
import '../../../domain/repository/weather.dart';
import '../bloc/bar_navigation_cubit.dart';
import '../widgets/card_weather.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<String> appIcon = [
      AppVectors.homeIcon,
      AppVectors.searchIcon,
      AppVectors.compasIcon,
      AppVectors.userIcon
    ];
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BarNavigationCubit(),
          ),
          BlocProvider(
            create: (context) {
              final WeatherDatabaseService weatherDatabaseService =
                  WeatherDatabaseServiceImpl(client: http.Client());
              final WeatherRepository weatherRepository = WeatherRepositoryImpl(
                  weatherDatabaseService: weatherDatabaseService);
              return GetWeatherCubit(weatherRepository: weatherRepository)
                ..fetchWeatherForNow();
            },
          ),
        ],
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 40,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: height * 0.075,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * 0.15,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff70A2A9),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppVectors.moreGrid,
                            width: width * 0.055,
                            height: height * 0.03,
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.15,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.tertiary,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppVectors.settingIcon,
                            width: width * 0.055,
                            height: height * 0.045,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                BlocBuilder<GetWeatherCubit, GetWeatherState>(
                  builder: (context, state) {
                    if (state is GetWeatherLoading) {
                      return ShowWeather(
                        city: 'Just a minute',
                        degree: 0,
                        mainWidget: CircularProgressIndicator(),
                        precipitationProbability: 0,
                      );
                    }
                    if (state is GetWeatherLoaded) {
                      String appLottie = LottieWeather()
                          .getWeatherAnimation(state.weatherEntity.condition);
                      return ShowWeather(
                        city: state.weatherEntity.cityName,
                        degree: state.weatherEntity.temperature,
                        mainWidget: LottieBuilder.asset(appLottie),
                        precipitationProbability:
                            state.weatherEntity.precipitationProbability,
                      );
                    }
                    if (state is GetWeatherFailure) {
                      return Text(state.message);
                    }
                    return Container();
                  },
                ),
                SizedBox(height: height * 0.02),
                SizedBox(
                  width: double.infinity,
                  height: height * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocProvider(
                        create: (context) {
                          final WeatherDatabaseService weatherDatabaseService =
                              WeatherDatabaseServiceImpl(client: http.Client());
                          final WeatherRepository weatherRepository =
                              WeatherRepositoryImpl(
                                  weatherDatabaseService:
                                      weatherDatabaseService);
                          return GetWeatherCubit(
                              weatherRepository: weatherRepository)
                            ..getWeatherDataNineAM();
                        },
                        child: BlocBuilder<GetWeatherCubit, GetWeatherState>(
                          builder: (context, state) {
                            if (state is GetWeatherLoading) {
                              return CardWeather(
                                degree: '...',
                                time: "09:00 AM",
                                lottieWeather: AppLotties.sunny,
                              );
                            }
                            if (state is GetWeatherTimeLoaded) {
                              String appLottie = LottieWeather()
                                  .getWeatherAnimation(state.weather.main);
                              return CardWeather(
                                degree: '${state.weather.temp.toInt()}°',
                                time: "09:00 AM",
                                lottieWeather: appLottie,
                              );
                            }
                            if (state is GetWeatherFailure) {
                              return Text('Error: ${state.message}');
                            }
                            return Container();
                          },
                        ),
                      ),
                      BlocProvider(
                        create: (context) {
                          final WeatherDatabaseService weatherDatabaseService =
                              WeatherDatabaseServiceImpl(client: http.Client());
                          final WeatherRepository weatherRepository =
                              WeatherRepositoryImpl(
                                  weatherDatabaseService:
                                      weatherDatabaseService);
                          return GetWeatherCubit(
                              weatherRepository: weatherRepository)
                            ..getWeatherDataThreePM();
                        },
                        child: BlocBuilder<GetWeatherCubit, GetWeatherState>(
                          builder: (context, state) {
                            if (state is GetWeatherLoading) {
                              return CardWeather(
                                degree: '...',
                                time: "03:00 PM",
                                lottieWeather: AppLotties.sunny,
                              );
                            }
                            if (state is GetWeatherTimeLoaded) {
                              String appLottie = LottieWeather()
                                  .getWeatherAnimation(state.weather.main);
                              return CardWeather(
                                degree: '${state.weather.temp.toInt()}°',
                                time: "03:00 PM",
                                lottieWeather: appLottie,
                              );
                            }
                            if (state is GetWeatherFailure) {
                              return Text('error');
                            }
                            return Container();
                          },
                        ),
                      ),
                      BlocProvider(
                        create: (context) {
                          final WeatherDatabaseService weatherDatabaseService =
                              WeatherDatabaseServiceImpl(client: http.Client());
                          final WeatherRepository weatherRepository =
                              WeatherRepositoryImpl(
                                  weatherDatabaseService:
                                      weatherDatabaseService);
                          return GetWeatherCubit(
                              weatherRepository: weatherRepository)
                            ..getWeatherDataNinePM();
                        },
                        child: BlocBuilder<GetWeatherCubit, GetWeatherState>(
                          builder: (context, state) {
                            if (state is GetWeatherLoading) {
                              return CardWeather(
                                degree: '...',
                                time: "21:00 PM",
                                lottieWeather: AppLotties.sunny,
                              );
                            }
                            if (state is GetWeatherTimeLoaded) {
                              String appLottie = LottieWeather()
                                  .getWeatherAnimation(state.weather.main);
                              return CardWeather(
                                degree: '${state.weather.temp.toInt()}°',
                                time: "21:00 PM",
                                lottieWeather: appLottie,
                              );
                            }
                            if (state is GetWeatherFailure) {
                              return Text('error');
                            }
                            return Container();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.05),
                Container(
                  width: double.infinity,
                  height: height * 0.135,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColors.tertiary,
                  ),
                  child: Center(
                      child: SizedBox(
                    height: height * 0.085,
                    width: width * 0.7,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<BarNavigationCubit>()
                                .changeColor(index);
                          },
                          child: Container(
                            width: width * 0.175,
                            height: height * 0.085,
                            color: AppColors.tertiary,
                            child: Center(
                              child: SvgPicture.asset(
                                appIcon[index],
                                color:
                                    context.watch<BarNavigationCubit>().state ==
                                            index
                                        ? Color(0xffE9B94F)
                                        : AppColors.inversePrimary,
                                width: width * 0.1,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
