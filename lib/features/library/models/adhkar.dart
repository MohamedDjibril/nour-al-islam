/// Modèle d'un dhikr (évocation d'Allah)
class Adhkar {
  final String id;
  final String category;
  final String title;
  final String textAr;
  final String textFr;
  final String transliteration;
  final int repetitions;
  final String reference;

  const Adhkar({
    required this.id,
    required this.category,
    required this.title,
    required this.textAr,
    required this.textFr,
    required this.transliteration,
    required this.repetitions,
    required this.reference,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'title': title,
        'textAr': textAr,
        'textFr': textFr,
        'transliteration': transliteration,
        'repetitions': repetitions,
        'reference': reference,
      };

  factory Adhkar.fromJson(Map<String, dynamic> json) => Adhkar(
        id: json['id'] as String,
        category: json['category'] as String,
        title: json['title'] as String,
        textAr: json['textAr'] as String,
        textFr: json['textFr'] as String,
        transliteration: json['transliteration'] as String,
        repetitions: json['repetitions'] as int,
        reference: json['reference'] as String,
      );
}
