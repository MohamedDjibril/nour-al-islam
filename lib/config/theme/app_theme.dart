import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Thème Material 3 personnalisé pour Nour al-Islam
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.gold,
      brightness: Brightness.light,
      primary: AppColors.gold,
      onPrimary: AppColors.white,
      secondary: AppColors.green,
      onSecondary: AppColors.white,
      surface: AppColors.cream,
      onSurface: AppColors.black,
      error: AppColors.error,
      onError: AppColors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.cream,
      textTheme: _textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.cream,
        foregroundColor: AppColors.black,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.gold,
      brightness: Brightness.dark,
      primary: AppColors.gold,
      onPrimary: AppColors.black,
      secondary: AppColors.greenLight,
      onSecondary: AppColors.white,
      surface: AppColors.darkBlue,
      onSurface: AppColors.white,
      error: AppColors.error,
      onError: AppColors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.darkBlue,
      textTheme: _textThemeDark,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBlue,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: AppColors.black,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkBlueLight,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(fontSize: 57, fontWeight: FontWeight.w400, color: AppColors.black),
    displayMedium: GoogleFonts.poppins(fontSize: 45, fontWeight: FontWeight.w400, color: AppColors.black),
    displaySmall: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.w400, color: AppColors.black),
    headlineLarge: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w600, color: AppColors.black),
    headlineMedium: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.black),
    headlineSmall: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.black),
    titleLarge: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.black),
    titleMedium: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black),
    titleSmall: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.black),
    bodyLarge: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.black),
    bodyMedium: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.black),
    bodySmall: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey),
    labelLarge: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.black),
    labelMedium: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black),
    labelSmall: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.grey),
  );

  static final TextTheme _textThemeDark = TextTheme(
    displayLarge: GoogleFonts.poppins(fontSize: 57, fontWeight: FontWeight.w400, color: AppColors.white),
    displayMedium: GoogleFonts.poppins(fontSize: 45, fontWeight: FontWeight.w400, color: AppColors.white),
    displaySmall: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.w400, color: AppColors.white),
    headlineLarge: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w600, color: AppColors.white),
    headlineMedium: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.white),
    headlineSmall: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.white),
    titleLarge: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.white),
    titleMedium: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.white),
    titleSmall: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.white),
    bodyLarge: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.white),
    bodyMedium: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.white),
    bodySmall: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.greyLight),
    labelLarge: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.white),
    labelMedium: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.white),
    labelSmall: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.greyLight),
  );
}