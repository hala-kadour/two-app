import 'package:flutter/material.dart';
import 'package:two_client_app/config/constants/sizes_config.dart';
import 'package:two_client_app/config/theme/text_style.dart';

import 'color.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      primaryColor: AppColors.mainColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
        backgroundColor: AppColors.mainColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(
            SizesConfig.buttonWidth,
            SizesConfig.buttonHeight,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizesConfig.buttonRadius),
          ),
          textStyle: AppTextStyle.buttonStyle(color: AppColors.white),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          // ignore: deprecated_member_use
          AppColors.mainColor.value,
          const {
            50: AppColors.mainColor,
            100: AppColors.mainColor,
            200: AppColors.mainColor,
            300: AppColors.mainColor,
            400: AppColors.mainColor,
            500: AppColors.mainColor,
            600: AppColors.mainColor,
            700: AppColors.mainColor,
            800: AppColors.mainColor,
            900: AppColors.mainColor,
          },
        ),
      ).copyWith(secondary: AppColors.secondaryColor),
    );
  }
}
