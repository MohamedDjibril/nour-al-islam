/// Modèle d'un hadith (parole du Prophète ﷺ)
class Hadith {
  final String id;
  final String category;
  final String title;
  final String textAr;
  final String textFr;
  final String narrator; // rapporteur (ex: Bukhari, Muslim)
  final String reference;

  const Hadith({
    required this.id,
    required this.category,
    required this.title,
    required this.textAr,
    required this.textFr,
    required this.narrator,
    required this.reference,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'title': title,
        'textAr': textAr,
        'textFr': textFr,
        'narrator': narrator,
        'reference': reference,
      };

  factory Hadith.fromJson(Map<String, dynamic> json) => Hadith(
        id: json['id'] as String,
        category: json['category'] as String,
        title: json['title'] as String,
        textAr: json['textAr'] as String,
        textFr: json['textFr'] as String,
        narrator: json['narrator'] as String,
        reference: json['reference'] as String,
      );
}
