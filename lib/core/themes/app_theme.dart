import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.bg,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0.5,
      titleTextStyle: AppTextStyles.appBarTitle,
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    iconTheme: const IconThemeData(color: Colors.black87),
    cardColor: Colors.white,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
