import '../models/hadith.dart';

/// Base de 10 hadiths authentiques
class HadithsData {
  HadithsData._();

  static const List<Hadith> all = [
    // ========== PATIENCE & ÉPREUVE (3) ==========

    Hadith(
      id: 'hadith_sabr_1',
      category: 'patience',
      title: 'La patience est lumière',
      textAr: 'الصَّبْرُ ضِيَاءٌ',
      textFr: 'La patience est une lumière.',
      narrator: 'Muslim',
      reference: 'Sahih Muslim, hadith n°223',
    ),
    Hadith(
      id: 'hadith_sabr_2',
      category: 'patience',
      title: 'Allah aime les endurants',
      textAr: 'وَاللَّهُ يُحِبُّ الصَّابِرِينَ',
      textFr: 'Et Allah aime les endurants.',
      narrator: 'Coran',
      reference: 'Coran 3:146',
    ),
    Hadith(
      id: 'hadith_sabr_3',
      category: 'patience',
      title: 'Le meilleur est celui qui patiente',
      textAr: 'وَمَنْ يَصْبِرْ يُصَبِّرْهُ اللَّهُ',
      textFr:
          'Quiconque cherche à être patient, Allah le rendra patient.',
      narrator: 'Bukhari',
      reference: 'Sahih Bukhari, hadith n°1469',
    ),

    // ========== GRATITUDE (2) ==========

    Hadith(
      id: 'hadith_shukr_1',
      category: 'gratitude',
      title: 'Qui ne remercie pas les gens...',
      textAr: 'لَا يَشْكُرُ اللَّهَ مَنْ لَا يَشْكُرُ النَّاسَ',
      textFr:
          'Celui qui ne remercie pas les gens ne remercie pas Allah.',
      narrator: 'Abu Dawud',
      reference: 'Sunan Abu Dawud, hadith n°4811',
    ),
    Hadith(
      id: 'hadith_shukr_2',
      category: 'gratitude',
      title: 'Remerciez, Allah vous donnera plus',
      textAr: 'لَئِن شَكَرْتُمْ لَأَزِيدَنَّكُمْ',
      textFr:
          'Si vous êtes reconnaissants, Je vous donnerai davantage.',
      narrator: 'Coran',
      reference: 'Coran 14:7',
    ),

    // ========== PARDON (2) ==========

    Hadith(
      id: 'hadith_pardon_1',
      category: 'pardon',
      title: 'Le meilleur istighfar',
      textAr: 'أَسْتَغْفِرُ اللَّهَ رَبِّي مِنْ كُلِّ ذَنْبٍ وَأَتُوبُ إِلَيْهِ',
      textFr:
          'Je demande pardon à Allah, mon Seigneur, pour tous mes péchés et je reviens à Lui.',
      narrator: 'Tirmidhi',
      reference: 'Sunan Tirmidhi',
    ),
    Hadith(
      id: 'hadith_pardon_2',
      category: 'pardon',
      title: 'Allah se réjouit du repentir',
      textAr: 'لَلَّهُ أَفْرَحُ بِتَوْبَةِ عَبْدِهِ مِنْ أَحَدِكُمْ',
      textFr:
          'Allah se réjouit du repentir de Son serviteur plus que vous ne vous réjouissez de retrouver votre monture perdue.',
      narrator: 'Muslim',
      reference: 'Sahih Muslim, hadith n°2747',
    ),

    // ========== PRIÈRE (2) ==========

    Hadith(
      id: 'hadith_priere_1',
      category: 'priere',
      title: 'La prière efface les péchés',
      textAr: 'الصَّلَوَاتُ الْخَمْسُ كَفَّارَةٌ لِمَا بَيْنَهُنَّ',
      textFr:
          'Les cinq prières effacent les péchés commis entre elles, tant qu\'on ne commet pas de grand péché.',
      narrator: 'Muslim',
      reference: 'Sahih Muslim, hadith n°233',
    ),
    Hadith(
      id: 'hadith_priere_2',
      category: 'priere',
      title: 'La prière est une lumière',
      textAr: 'الصَّلَاةُ نُورٌ',
      textFr: 'La prière est une lumière.',
      narrator: 'Muslim',
      reference: 'Sahih Muslim, hadith n°223',
    ),

    // ========== BON CARACTÈRE (1) ==========

    Hadith(
      id: 'hadith_caractere_1',
      category: 'caractere',
      title: 'Le meilleur croyant',
      textAr: 'أَكْمَلُ الْمُؤْمِنِينَ إِيمَانًا أَحْسَنُهُمْ خُلُقًا',
      textFr:
          'Le croyant dont la foi est la plus parfaite est celui qui a le meilleur caractère.',
      narrator: 'Tirmidhi',
      reference: 'Sunan Tirmidhi, hadith n°1162',
    ),
  ];

  static List<Hadith> getByCategory(String category) {
    return all.where((h) => h.category == category).toList();
  }

  static const List<String> categories = [
    'patience',
    'gratitude',
    'pardon',
    'priere',
    'caractere',
  ];
}
