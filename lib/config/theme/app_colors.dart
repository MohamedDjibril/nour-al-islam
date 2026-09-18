import 'package:flutter/material.dart';

/// Couleurs officielles de Nour al-Islam
class AppColors {
  AppColors._();

  // ========== COULEURS PRINCIPALES ==========
  static const Color gold = Color(0xFFC9A84C);
  static const Color goldLight = Color(0xFFF5E6A3);
  static const Color goldDark = Color(0xFF8B7332);

  // ========== COULEURS SECONDAIRES ==========
  static const Color green = Color(0xFF1B5E20);
  static const Color greenLight = Color(0xFF4C8C4F);
  static const Color darkBlue = Color(0xFF0D1B2A);
  static const Color darkBlueLight = Color(0xFF1B2A3F);

  // ========== COULEURS NEUTRES ==========
  static const Color cream = Color(0xFFFFF8E7);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF757575);
  static const Color greyLight = Color(0xFFE0E0E0);

  // ========== COULEURS FONCTIONNELLES ==========
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFED6C02);
  static const Color error = Color(0xFFD32F2F);
  static const Color info = Color(0xFF0288D1);

  // ========== GRADIENTS ==========
  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gold, goldDark],
  );

  static const LinearGradient nightGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [darkBlue, darkBlueLight],
  );

  static const LinearGradient peacefulGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [cream, goldLight],
  );
}