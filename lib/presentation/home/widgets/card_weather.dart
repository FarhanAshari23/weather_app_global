import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CardWeather extends StatelessWidget {
  final String lottieWeather, time, degree;
  const CardWeather({
    super.key,
    required this.degree,
    required this.lottieWeather,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.25,
      height: height * 0.15,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: width * 0.14,
              height: height * 0.065,
              child: LottieBuilder.asset(lottieWeather),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white54,
              ),
            ),
            Text(
              degree,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
