/// Modèle d'un verset du Coran avec réflexion et action
class Verse {
  final String id;
  final int surah;
  final int verseNumber;
  final String textAr;
  final String textFr;
  final String reference;
  final String theme; // patience, repentance, espoir, gratitude
  final String reflection; // question de réflexion
  final String action; // action concrète à faire

  const Verse({
    required this.id,
    required this.surah,
    required this.verseNumber,
    required this.textAr,
    required this.textFr,
    required this.reference,
    required this.theme,
    required this.reflection,
    required this.action,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'surah': surah,
        'verseNumber': verseNumber,
        'textAr': textAr,
        'textFr': textFr,
        'reference': reference,
        'theme': theme,
        'reflection': reflection,
        'action': action,
      };

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json['id'] as String,
        surah: json['surah'] as int,
        verseNumber: json['verseNumber'] as int,
        textAr: json['textAr'] as String,
        textFr: json['textFr'] as String,
        reference: json['reference'] as String,
        theme: json['theme'] as String,
        reflection: json['reflection'] as String,
        action: json['action'] as String,
      );
}