import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/verses_data.dart';
import '../models/verse.dart';

/// État d'une session SOS
class SosState {
  final int? durationMinutes; // 2, 5 ou 10
  final Verse? verse;
  final String? selectedTheme;
  final bool sessionStarted;
  final bool sessionCompleted;
  final DateTime? startTime;

  const SosState({
    this.durationMinutes,
    this.verse,
    this.selectedTheme,
    this.sessionStarted = false,
    this.sessionCompleted = false,
    this.startTime,
  });

  SosState copyWith({
    int? durationMinutes,
    Verse? verse,
    String? selectedTheme,
    bool? sessionStarted,
    bool? sessionCompleted,
    DateTime? startTime,
  }) {
    return SosState(
      durationMinutes: durationMinutes ?? this.durationMinutes,
      verse: verse ?? this.verse,
      selectedTheme: selectedTheme ?? this.selectedTheme,
      sessionStarted: sessionStarted ?? this.sessionStarted,
      sessionCompleted: sessionCompleted ?? this.sessionCompleted,
      startTime: startTime ?? this.startTime,
    );
  }

  bool get isReady => durationMinutes != null && verse != null;
}

/// Provider SOS
final sosProvider = StateNotifierProvider<SosNotifier, SosState>((ref) {
  return SosNotifier();
});

class SosNotifier extends StateNotifier<SosState> {
  SosNotifier() : super(const SosState());

  /// Choisit la durée et démarre la session
  void startSession({required int minutes, String? theme}) {
    final selectedTheme = theme ?? _getDefaultTheme();
    final verse = VersesData.getRandomByTheme(selectedTheme);

    state = state.copyWith(
      durationMinutes: minutes,
      verse: verse,
      selectedTheme: selectedTheme,
      sessionStarted: true,
      sessionCompleted: false,
      startTime: DateTime.now(),
    );
  }

  /// Charge un nouveau verset (sans changer la durée)
  void loadNewVerse() {
    if (state.selectedTheme == null) return;
    final verse = VersesData.getRandomByTheme(state.selectedTheme!);
    state = state.copyWith(verse: verse);
  }

  /// Marque la session comme terminée
  void completeSession() {
    state = state.copyWith(sessionCompleted: true);
  }

  /// Réinitialise complètement
  void reset() {
    state = const SosState();
  }

  /// Thème par défaut (rotation selon l'heure)
  String _getDefaultTheme() {
    final hour = DateTime.now().hour;
    // Le matin : gratitude / espoir
    if (hour < 12) return 'espoir';
    // L'après-midi : patience
    if (hour < 18) return 'patience';
    // Le soir : repentance / protection
    if (hour < 22) return 'repentance';
    // La nuit : protection
    return 'protection';
  }
}