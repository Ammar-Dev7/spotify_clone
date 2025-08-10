import 'package:flutter/material.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class AppTheme {

  static final lightTheme = ThemeData(

    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: ColorScheme.light().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.lightText,
      surface: AppColors.lightBackground,
      tertiary: AppColors.lightMainText,
      brightness: Brightness.light,
      onPrimary: AppColors.lightGreyText,// light theme has light brightness, dark theme has dark brightness, and soon
      onSurface: AppColors.lightplayBG,
    ),



  );

  static final darkTheme = ThemeData(

    primaryColor: AppColors.primary,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: ColorScheme.dark().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.darkText,
      surface: AppColors.darkBackground,
      tertiary: AppColors.darkMainText,
      brightness: Brightness.dark,
      onPrimary: AppColors.darkGreyText,
        onSurface: AppColors.darkplayBG,

    ),

  );
}