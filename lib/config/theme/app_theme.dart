import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Thème Material 3 personnalisé pour Nour al-Islam
/// Utilise Poppins en local (au lieu de Google Fonts)
class AppTheme {
  AppTheme._();

  // ========== COULEURS DYNAMIQUES ==========
  static const _darkBackground = Color(0xFF0A1520);
  static const _darkSurface = Color(0xFF1A2A3A);
  static const _darkSurfaceVariant = Color(0xFF243447);
  static const _darkBorder = Color(0xFF2A3A4A);
  static const _darkTextSecondary = Color(0xFFB0B8C0);

  // ========== THÈME CLAIR ==========
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.gold,
      brightness: Brightness.light,
      primary: AppColors.gold,
      onPrimary: AppColors.white,
      secondary: AppColors.green,
      onSecondary: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.black,
      error: AppColors.error,
      onError: AppColors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.cream,
      fontFamily: 'Poppins', // ← Poppins en local !
      textTheme: _textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.cream,
        foregroundColor: AppColors.black,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
          fontFamily: 'Poppins',
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
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
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
      dividerColor: AppColors.greyLight,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ========== THÈME SOMBRE ==========
  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.gold,
      brightness: Brightness.dark,
      primary: AppColors.gold,
      onPrimary: AppColors.black,
      secondary: AppColors.greenLight,
      onSecondary: AppColors.white,
      surface: _darkSurface,
      onSurface: AppColors.white,
      error: AppColors.error,
      onError: AppColors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _darkBackground,
      fontFamily: 'Poppins',
      textTheme: _textThemeDark,
      appBarTheme: AppBarTheme(
        backgroundColor: _darkBackground,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
          fontFamily: 'Poppins',
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
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: _darkSurface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      dividerColor: _darkBorder,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _darkSurfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ========== TYPOGRAPHIE CLAIRE ==========
  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, color: AppColors.black, fontFamily: 'Poppins'),
    displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, color: AppColors.black, fontFamily: 'Poppins'),
    displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: AppColors.black, fontFamily: 'Poppins'),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: AppColors.black, fontFamily: 'Poppins'),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.black, fontFamily: 'Poppins'),
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.black, fontFamily: 'Poppins'),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.black, fontFamily: 'Poppins'),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black, fontFamily: 'Poppins'),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.black, fontFamily: 'Poppins'),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.black, fontFamily: 'Poppins'),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.black, fontFamily: 'Poppins'),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey, fontFamily: 'Poppins'),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.black, fontFamily: 'Poppins'),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black, fontFamily: 'Poppins'),
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.grey, fontFamily: 'Poppins'),
  );

  // ========== TYPOGRAPHIE SOMBRE ==========
  static const TextTheme _textThemeDark = TextTheme(
    displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, color: AppColors.white, fontFamily: 'Poppins'),
    displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, color: AppColors.white, fontFamily: 'Poppins'),
    displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: AppColors.white, fontFamily: 'Poppins'),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: AppColors.white, fontFamily: 'Poppins'),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.white, fontFamily: 'Poppins'),
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.white, fontFamily: 'Poppins'),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.white, fontFamily: 'Poppins'),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.white, fontFamily: 'Poppins'),
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.white, fontFamily: 'Poppins'),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.white, fontFamily: 'Poppins'),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.white, fontFamily: 'Poppins'),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: _darkTextSecondary, fontFamily: 'Poppins'),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.white, fontFamily: 'Poppins'),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.white, fontFamily: 'Poppins'),
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: _darkTextSecondary, fontFamily: 'Poppins'),
  );
}
