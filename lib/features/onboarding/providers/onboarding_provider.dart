import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/onboarding_state.dart';

/// Provider de l'état d'onboarding
final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
  return OnboardingNotifier();
});

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier() : super(const OnboardingState()) {
    _loadSavedState();
  }

  static const _keyLanguage = 'onboarding_language';
  static const _keyNotifications = 'onboarding_notifications';
  static const _keyCompleted = 'onboarding_completed';

  /// Charge l'état sauvegardé au démarrage
  Future<void> _loadSavedState() async {
    final prefs = await SharedPreferences.getInstance();
    state = OnboardingState(
      language: prefs.getString(_keyLanguage),
      notificationsEnabled: prefs.getBool(_keyNotifications) ?? false,
      completed: prefs.getBool(_keyCompleted) ?? false,
    );
  }

  /// Sauvegarde la langue choisie
  Future<void> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLanguage, language);
    state = state.copyWith(language: language);
  }

  /// Sauvegarde le choix des notifications
  Future<void> setNotifications(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyNotifications, enabled);
    state = state.copyWith(notificationsEnabled: enabled);
  }

  /// Marque l'onboarding comme terminé
  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyCompleted, true);
    state = state.copyWith(completed: true);
  }

  /// Réinitialise l'onboarding (pour tests)
  Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    state = const OnboardingState();
  }
}