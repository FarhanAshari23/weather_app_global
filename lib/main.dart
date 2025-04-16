import 'package:flutter/material.dart';
import 'package:weather_app/core/configs/theme/app_theme.dart';
import 'package:weather_app/presentation/splash/views/splash_view.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme,
      home: SplashView(),
    );
  }
}
