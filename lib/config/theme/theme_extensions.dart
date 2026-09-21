import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Extension pour accéder aux couleurs selon le thème (clair/sombre)
extension ThemeColors on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  /// Fond principal de l'app
  Color get appBackground =>
      isDark ? const Color(0xFF0A1520) : AppColors.cream;

  /// Surface (cartes, containers)
  Color get appSurface =>
      isDark ? const Color(0xFF1A2A3A) : AppColors.white;

  /// Surface secondaire (sections imbriquées)
  Color get appSurfaceVariant =>
      isDark ? const Color(0xFF243447) : AppColors.cream;

  /// Texte principal
  Color get appTextPrimary =>
      isDark ? AppColors.white : AppColors.black;

  /// Texte secondaire
  Color get appTextSecondary =>
      isDark ? const Color(0xFFB0B8C0) : AppColors.grey;

  /// Bordure
  Color get appBorder =>
      isDark ? const Color(0xFF2A3A4A) : AppColors.greyLight;
}
