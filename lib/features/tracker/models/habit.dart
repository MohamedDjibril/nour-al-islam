/// Modèle d'une habitude spirituelle
class Habit {
  final String id;
  final String name;
  final String description;
  final String iconName; // ex: 'quran', 'dhikr', 'prayer'
  final int target; // objectif quotidien
  final int current; // progression actuelle
  final DateTime lastUpdated;

  const Habit({
    required this.id,
    required this.name,
    required this.description,
    required this.iconName,
    required this.target,
    this.current = 0,
    required this.lastUpdated,
  });

  /// Progression en pourcentage (0.0 à 1.0)
  double get progress => target > 0 ? (current / target).clamp(0.0, 1.0) : 0.0;

  /// Est-ce que l'habitude est complétée aujourd'hui ?
  bool get isCompleted => current >= target;

  Habit copyWith({
    String? id,
    String? name,
    String? description,
    String? iconName,
    int? target,
    int? current,
    DateTime? lastUpdated,
  }) {
    return Habit(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      iconName: iconName ?? this.iconName,
      target: target ?? this.target,
      current: current ?? this.current,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'iconName': iconName,
        'target': target,
        'current': current,
        'lastUpdated': lastUpdated.toIso8601String(),
      };

  factory Habit.fromJson(Map<String, dynamic> json) => Habit(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        iconName: json['iconName'] as String,
        target: json['target'] as int,
        current: json['current'] as int? ?? 0,
        lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      );
}