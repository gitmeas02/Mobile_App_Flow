import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme {
  static final defaultTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor2,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor2,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
    ),
  );
}
