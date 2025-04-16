import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final mainTheme = ThemeData(
    popupMenuTheme: const PopupMenuThemeData(
      color: AppColors.primary,
    ),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 36, horizontal: 24),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(
          color: AppColors.inversePrimary,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(
          color: AppColors.inversePrimary,
          width: 2,
        ),
      ),
      filled: true,
      fillColor: AppColors.background,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      hintStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.inversePrimary,
      ),
    ),
  );
}
