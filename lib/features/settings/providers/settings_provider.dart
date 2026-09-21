import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// État des paramètres de l'application
class SettingsState {
  final ThemeMode themeMode;
  final String language;
  final bool notificationsEnabled;

  const SettingsState({
    this.themeMode = ThemeMode.system,
    this.language = 'fr',
    this.notificationsEnabled = false,
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    String? language,
    bool? notificationsEnabled,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}

/// Provider des paramètres
final settingsProvider =
    StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier();
});

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier() : super(const SettingsState()) {
    _load();
  }

  static const _keyTheme = 'settings_theme';
  static const _keyLanguage = 'settings_language';
  static const _keyNotifications = 'settings_notifications';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();

    // Thème
    final themeStr = prefs.getString(_keyTheme) ?? 'system';
    final themeMode = switch (themeStr) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };

    // Langue
    final lang = prefs.getString(_keyLanguage) ?? 'fr';

    // Notifications
    final notif = prefs.getBool(_keyNotifications) ?? false;

    state = SettingsState(
      themeMode: themeMode,
      language: lang,
      notificationsEnabled: notif,
    );
  }

  Future<void> setTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    final str = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    await prefs.setString(_keyTheme, str);
    state = state.copyWith(themeMode: mode);
  }

  Future<void> setLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLanguage, lang);
    state = state.copyWith(language: lang);
  }

  Future<void> setNotifications(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyNotifications, enabled);
    state = state.copyWith(notificationsEnabled: enabled);
  }

  /// Supprime toutes les données de l'utilisateur
  Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    state = const SettingsState();
  }
}
