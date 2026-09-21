/// Statistiques journalières pour le tracker
class DailyStats {
  final DateTime date;
  final int habitsCompleted;
  final int totalHabits;
  final int sosSessionsCount;
  final int quranPages;
  final int dhikrCount;

  const DailyStats({
    required this.date,
    required this.habitsCompleted,
    required this.totalHabits,
    this.sosSessionsCount = 0,
    this.quranPages = 0,
    this.dhikrCount = 0,
  });

  /// Taux de complétion (0.0 à 1.0)
  double get completionRate =>
      totalHabits > 0 ? habitsCompleted / totalHabits : 0.0;

  /// Est-ce que tous les habits sont complétés ?
  bool get isPerfectDay =>
      totalHabits > 0 && habitsCompleted >= totalHabits;

  /// Jour abrégé (Lun, Mar, Mer...)
  String get dayLabel {
    const days = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
    return days[date.weekday - 1];
  }

  DailyStats copyWith({
    DateTime? date,
    int? habitsCompleted,
    int? totalHabits,
    int? sosSessionsCount,
    int? quranPages,
    int? dhikrCount,
  }) {
    return DailyStats(
      date: date ?? this.date,
      habitsCompleted: habitsCompleted ?? this.habitsCompleted,
      totalHabits: totalHabits ?? this.totalHabits,
      sosSessionsCount: sosSessionsCount ?? this.sosSessionsCount,
      quranPages: quranPages ?? this.quranPages,
      dhikrCount: dhikrCount ?? this.dhikrCount,
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'habitsCompleted': habitsCompleted,
        'totalHabits': totalHabits,
        'sosSessionsCount': sosSessionsCount,
        'quranPages': quranPages,
        'dhikrCount': dhikrCount,
      };

  factory DailyStats.fromJson(Map<String, dynamic> json) => DailyStats(
        date: DateTime.parse(json['date'] as String),
        habitsCompleted: json['habitsCompleted'] as int,
        totalHabits: json['totalHabits'] as int,
        sosSessionsCount: json['sosSessionsCount'] as int? ?? 0,
        quranPages: json['quranPages'] as int? ?? 0,
        dhikrCount: json['dhikrCount'] as int? ?? 0,
      );
}
