import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/habit.dart';

/// État du tracker (habitudes + série de jours)
class TrackerState {
  final List<Habit> habits;
  final int streakDays;
  final DateTime? lastCompletedDate;

  const TrackerState({
    this.habits = const [],
    this.streakDays = 0,
    this.lastCompletedDate,
  });

  TrackerState copyWith({
    List<Habit>? habits,
    int? streakDays,
    DateTime? lastCompletedDate,
  }) {
    return TrackerState(
      habits: habits ?? this.habits,
      streakDays: streakDays ?? this.streakDays,
      lastCompletedDate: lastCompletedDate ?? this.lastCompletedDate,
    );
  }

  /// Nombre d'habitudes complétées aujourd'hui
  int get completedToday => habits.where((h) => h.isCompleted).length;

  /// Progression globale (0.0 à 1.0)
  double get globalProgress {
    if (habits.isEmpty) return 0.0;
    final total = habits.fold<double>(0, (sum, h) => sum + h.progress);
    return total / habits.length;
  }
}

/// Provider du tracker
final trackerProvider =
    StateNotifierProvider<TrackerNotifier, TrackerState>((ref) {
  return TrackerNotifier();
});

class TrackerNotifier extends StateNotifier<TrackerState> {
  TrackerNotifier() : super(const TrackerState()) {
    _loadDefaultHabits();
  }

  /// Charge les habitudes par défaut
  void _loadDefaultHabits() {
    final now = DateTime.now();
    state = TrackerState(
      streakDays: 0,
      habits: [
        Habit(
          id: 'quran',
          name: 'Lecture du Coran',
          description: 'Lire au moins 1 page',
          iconName: 'quran',
          target: 1,
          current: 0,
          lastUpdated: now,
        ),
        Habit(
          id: 'dhikr',
          name: 'Dhikr',
          description: '33x SubhanAllah, 33x Alhamdulillah, 34x Allahu Akbar',
          iconName: 'dhikr',
          target: 1,
          current: 0,
          lastUpdated: now,
        ),
        Habit(
          id: 'prayer',
          name: 'Prières',
          description: 'Les 5 prières quotidiennes',
          iconName: 'prayer',
          target: 5,
          current: 0,
          lastUpdated: now,
        ),
        Habit(
          id: 'dua',
          name: 'Douas du matin/soir',
          description: 'Réciter les adhkar',
          iconName: 'dua',
          target: 1,
          current: 0,
          lastUpdated: now,
        ),
      ],
    );
  }

  /// Incrémente la progression d'une habitude
  void incrementHabit(String habitId) {
    final updated = state.habits.map((habit) {
      if (habit.id == habitId && habit.current < habit.target) {
        return habit.copyWith(
          current: habit.current + 1,
          lastUpdated: DateTime.now(),
        );
      }
      return habit;
    }).toList();

    state = state.copyWith(habits: updated);
  }

  /// Décrémente la progression d'une habitude
  void decrementHabit(String habitId) {
    final updated = state.habits.map((habit) {
      if (habit.id == habitId && habit.current > 0) {
        return habit.copyWith(
          current: habit.current - 1,
          lastUpdated: DateTime.now(),
        );
      }
      return habit;
    }).toList();

    state = state.copyWith(habits: updated);
  }

  /// Réinitialise les habitudes (nouveau jour)
  void resetForNewDay() {
    final now = DateTime.now();
    final updated = state.habits.map((habit) {
      return habit.copyWith(current: 0, lastUpdated: now);
    }).toList();

    state = state.copyWith(habits: updated);
  }
}