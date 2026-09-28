// Versets du jour — sélection de versets inspirants
// Chaque verset change quotidiennement.

class DailyVerse {
  final String arabic;
  final String french;
  final String reference;
  final String theme;

  const DailyVerse({
    required this.arabic,
    required this.french,
    required this.reference,
    required this.theme,
  });
}

const List<DailyVerse> dailyVerses = [
  DailyVerse(
    arabic: 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا',
    french: 'Certes, avec la difficulté il y a une facilité.',
    reference: 'Coran 94:6',
    theme: 'Patience',
  ),
  DailyVerse(
    arabic: 'وَاصْبِرْ إِنَّ اللَّهَ لَا يُضِيعُ أَجْرَ الْمُحْسِنِينَ',
    french: 'Sois patient, car Allah ne fait pas perdre la récompense des bienfaisants.',
    reference: 'Coran 11:115',
    theme: 'Patience',
  ),
  DailyVerse(
    arabic: 'إِنَّ اللَّهَ مَعَ الصَّابِرِينَ',
    french: 'Certes, Allah est avec les endurants.',
    reference: 'Coran 2:153',
    theme: 'Patience',
  ),
  DailyVerse(
    arabic: 'وَمَن يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ',
    french: 'Et quiconque place sa confiance en Allah, Il lui suffit.',
    reference: 'Coran 65:3',
    theme: 'Confiance',
  ),
  DailyVerse(
    arabic: 'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
    french: 'N\'est-ce point par l\'évocation d\'Allah que les cœurs se tranquillisent ?',
    reference: 'Coran 13:28',
    theme: 'Dhikr',
  ),
  DailyVerse(
    arabic: 'وَقُل رَّبِّ زِدْنِي عِلْمًا',
    french: 'Et dis : « Seigneur, accrois mes connaissances ! »',
    reference: 'Coran 20:114',
    theme: 'Savoir',
  ),
  DailyVerse(
    arabic: 'إِنَّ اللَّهَ لَا يُغَيِّرُ مَا بِقَوْمٍ حَتَّى يُغَيِّرُوا مَا بِأَنفُسِهِمْ',
    french: 'Allah ne change pas l\'état d\'un peuple tant qu\'ils ne changent pas ce qui est en eux-mêmes.',
    reference: 'Coran 13:11',
    theme: 'Changement',
  ),
  DailyVerse(
    arabic: 'وَهُوَ مَعَكُمْ أَيْنَ مَا كُنتُمْ',
    french: 'Et Il est avec vous où que vous soyez.',
    reference: 'Coran 57:4',
    theme: 'Présence divine',
  ),
  DailyVerse(
    arabic: 'فَاذْكُرُونِي أَذْكُرْكُمْ',
    french: 'Souvenez-vous de Moi, Je Me souviendrai de vous.',
    reference: 'Coran 2:152',
    theme: 'Dhikr',
  ),
  DailyVerse(
    arabic: 'وَعَسَى أَن تَكْرَهُوا شَيْئًا وَهُوَ خَيْرٌ لَّكُمْ',
    french: 'Il se peut que vous détestiez une chose alors qu\'elle est un bien pour vous.',
    reference: 'Coran 2:216',
    theme: 'Confiance',
  ),
];