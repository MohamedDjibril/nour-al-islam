import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/habit.dart';
import '../models/daily_stats.dart';

/// État du tracker (habitudes + série + historique stats)
class TrackerState {
  final List<Habit> habits;
  final int streakDays;
  final DateTime? lastCompletedDate;
  final List<DailyStats> weeklyStats;
  final int totalSosSessions;
  final int totalDhikr;

  const TrackerState({
    this.habits = const [],
    this.streakDays = 0,
    this.lastCompletedDate,
    this.weeklyStats = const [],
    this.totalSosSessions = 0,
    this.totalDhikr = 0,
  });

  TrackerState copyWith({
    List<Habit>? habits,
    int? streakDays,
    DateTime? lastCompletedDate,
    List<DailyStats>? weeklyStats,
    int? totalSosSessions,
    int? totalDhikr,
  }) {
    return TrackerState(
      habits: habits ?? this.habits,
      streakDays: streakDays ?? this.streakDays,
      lastCompletedDate: lastCompletedDate ?? this.lastCompletedDate,
      weeklyStats: weeklyStats ?? this.weeklyStats,
      totalSosSessions: totalSosSessions ?? this.totalSosSessions,
      totalDhikr: totalDhikr ?? this.totalDhikr,
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

  /// Moyenne de complétion sur 7 jours
  double get weeklyAverage {
    if (weeklyStats.isEmpty) return 0.0;
    final total =
        weeklyStats.fold<double>(0, (sum, s) => sum + s.completionRate);
    return total / weeklyStats.length;
  }

  /// Jours parfaits cette semaine
  int get perfectDaysThisWeek =>
      weeklyStats.where((s) => s.isPerfectDay).length;
}

/// Provider du tracker
final trackerProvider =
    StateNotifierProvider<TrackerNotifier, TrackerState>((ref) {
  return TrackerNotifier();
});

class TrackerNotifier extends StateNotifier<TrackerState> {
  TrackerNotifier() : super(const TrackerState()) {
    _init();
  }

  static const _keyHabits = 'tracker_habits';
  static const _keyStreak = 'tracker_streak';
  static const _keyLastDate = 'tracker_last_date';
  static const _keyWeeklyStats = 'tracker_weekly_stats';
  static const _keySosTotal = 'tracker_sos_total';

  Future<void> _init() async {
    await _loadAll();
  }

  Future<void> _loadAll() async {
    final prefs = await SharedPreferences.getInstance();

    // Charger habitudes
    final habitsJson = prefs.getString(_keyHabits);
    List<Habit> habits;
    if (habitsJson != null) {
      final list = jsonDecode(habitsJson) as List;
      habits = list.map((j) => Habit.fromJson(j as Map<String, dynamic>)).toList();
    } else {
      habits = _defaultHabits();
    }

    // Charger streak
    final streak = prefs.getInt(_keyStreak) ?? 0;
    final lastDateStr = prefs.getString(_keyLastDate);
    final lastDate = lastDateStr != null ? DateTime.parse(lastDateStr) : null;

    // Charger stats hebdo
    final statsJson = prefs.getString(_keyWeeklyStats);
    List<DailyStats> weeklyStats = [];
    if (statsJson != null) {
      final list = jsonDecode(statsJson) as List;
      weeklyStats =
          list.map((j) => DailyStats.fromJson(j as Map<String, dynamic>)).toList();
    } else {
      weeklyStats = _generateDefaultWeek();
    }

    // Charge total SOS
    final sosTotal = prefs.getInt(_keySosTotal) ?? 0;

    state = TrackerState(
      habits: habits,
      streakDays: streak,
      lastCompletedDate: lastDate,
      weeklyStats: weeklyStats,
      totalSosSessions: sosTotal,
    );
  }

  List<Habit> _defaultHabits() {
    final now = DateTime.now();
    return [
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
    ];
  }

  /// Génère une semaine vide par défaut (7 derniers jours)
  List<DailyStats> _generateDefaultWeek() {
    final now = DateTime.now();
    return List.generate(7, (i) {
      final date = now.subtract(Duration(days: 6 - i));
      return DailyStats(
        date: DateTime(date.year, date.month, date.day),
        habitsCompleted: 0,
        totalHabits: 4,
      );
    });
  }

  Future<void> _saveHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(state.habits.map((h) => h.toJson()).toList());
    await prefs.setString(_keyHabits, json);
  }

  Future<void> _saveStats() async {
    final prefs = await SharedPreferences.getInstance();
    final json =
        jsonEncode(state.weeklyStats.map((s) => s.toJson()).toList());
    await prefs.setString(_keyWeeklyStats, json);
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
    _saveHabits();
    _updateTodayStats();
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
    _saveHabits();
    _updateTodayStats();
  }

  /// Met à jour les stats du jour
  void _updateTodayStats() {
    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);
    final completed = state.habits.where((h) => h.isCompleted).length;

    final updatedStats = state.weeklyStats.map((s) {
      if (s.date.year == todayKey.year &&
          s.date.month == todayKey.month &&
          s.date.day == todayKey.day) {
        return s.copyWith(
          habitsCompleted: completed,
          totalHabits: state.habits.length,
        );
      }
      return s;
    }).toList();

    // Si le jour n'existe pas dans la semaine, on l'ajoute
    final hasToday = updatedStats.any((s) =>
        s.date.year == todayKey.year &&
        s.date.month == todayKey.month &&
        s.date.day == todayKey.day);

    if (!hasToday) {
      updatedStats.add(DailyStats(
        date: todayKey,
        habitsCompleted: completed,
        totalHabits: state.habits.length,
      ));
    }

    state = state.copyWith(weeklyStats: updatedStats);
    _saveStats();
  }

  /// Enregistre une session SOS
  Future<void> recordSosSession() async {
    final prefs = await SharedPreferences.getInstance();
    final newTotal = state.totalSosSessions + 1;
    await prefs.setInt(_keySosTotal, newTotal);

    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);

    final updatedStats = state.weeklyStats.map((s) {
      if (s.date.year == todayKey.year &&
          s.date.month == todayKey.month &&
          s.date.day == todayKey.day) {
        return s.copyWith(sosSessionsCount: s.sosSessionsCount + 1);
      }
      return s;
    }).toList();

    state = state.copyWith(
      totalSosSessions: newTotal,
      weeklyStats: updatedStats,
    );
    _saveStats();
  }

  /// Enregistre un dhikr complété
  Future<void> recordDhikr() async {
    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);

    final updatedStats = state.weeklyStats.map((s) {
      if (s.date.year == todayKey.year &&
          s.date.month == todayKey.month &&
          s.date.day == todayKey.day) {
        return s.copyWith(dhikrCount: s.dhikrCount + 1);
      }
      return s;
    }).toList();

    state = state.copyWith(
      weeklyStats: updatedStats,
      totalDhikr: state.totalDhikr + 1,
    );
    _saveStats();
  }

  /// Réinitialise les habitudes (nouveau jour)
  void resetForNewDay() {
    final now = DateTime.now();
    final updated = state.habits.map((habit) {
      return habit.copyWith(current: 0, lastUpdated: now);
    }).toList();

    state = state.copyWith(habits: updated);
    _saveHabits();
    _updateTodayStats();
  }
}
