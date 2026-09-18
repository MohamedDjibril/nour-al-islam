/// Modèle d'une dua (invocation)
class Dua {
  final String id;
  final String category; // matin, soir, quotidien, spirituel
  final String title;
  final String textAr;
  final String textFr;
  final String transliteration;
  final String reference;

  const Dua({
    required this.id,
    required this.category,
    required this.title,
    required this.textAr,
    required this.textFr,
    required this.transliteration,
    required this.reference,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'title': title,
        'textAr': textAr,
        'textFr': textFr,
        'transliteration': transliteration,
        'reference': reference,
      };

  factory Dua.fromJson(Map<String, dynamic> json) => Dua(
        id: json['id'] as String,
        category: json['category'] as String,
        title: json['title'] as String,
        textAr: json['textAr'] as String,
        textFr: json['textFr'] as String,
        transliteration: json['transliteration'] as String,
        reference: json['reference'] as String,
      );
}