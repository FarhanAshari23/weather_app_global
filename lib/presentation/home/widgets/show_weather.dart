import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';

class ShowWeather extends StatelessWidget {
  final String city;
  final double degree;
  final Widget mainWidget;
  final double precipitationProbability;
  const ShowWeather({
    super.key,
    required this.city,
    required this.degree,
    required this.mainWidget,
    required this.precipitationProbability,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: width * 0.7,
          height: height * 0.115,
          child: Column(
            children: [
              Text(
                city,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: AppColors.inversePrimary,
                ),
              ),
              SizedBox(height: height * 0.005),
              Text(
                'Chance of rain: $precipitationProbability%',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.inversePrimary,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        SizedBox(
          width: width * 0.55,
          height: height * 0.275,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.15),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white10,
                        Colors.white,
                      ],
                      stops: const [
                        0.6,
                        1.0
                      ], // Transisi linear dari awal hingga akhir
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstOut,
                  child: Text(
                    '${degree.toInt()}°',
                    style: TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      color: AppColors.inversePrimary,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.06),
                child: SizedBox(
                  width: width * 0.5,
                  height: height * 0.175,
                  child: mainWidget,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
