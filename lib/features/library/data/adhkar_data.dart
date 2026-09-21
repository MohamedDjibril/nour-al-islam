import '../models/adhkar.dart';

/// Base de 15 adhkar (évocations d'Allah)
class AdhkarData {
  AdhkarData._();

  static const List<Adhkar> all = [
    // ========== APRÈS PRIÈRE (5) ==========
    Adhkar(
      id: 'priere_1',
      category: 'apres_priere',
      title: 'SubhanAllah',
      textAr: 'سُبْحَانَ اللَّهِ',
      textFr: 'Gloire à Allah.',
      transliteration: 'SubhanAllah.',
      repetitions: 33,
      reference: 'Bukhari, Muslim',
    ),
    Adhkar(
      id: 'priere_2',
      category: 'apres_priere',
      title: 'Alhamdulillah',
      textAr: 'الْحَمْدُ لِلَّهِ',
      textFr: 'Louange à Allah.',
      transliteration: 'Alhamdulillah.',
      repetitions: 33,
      reference: 'Bukhari, Muslim',
    ),
    Adhkar(
      id: 'priere_3',
      category: 'apres_priere',
      title: 'Allahu Akbar',
      textAr: 'اللَّهُ أَكْبَرُ',
      textFr: 'Allah est le plus Grand.',
      transliteration: 'Allahu Akbar.',
      repetitions: 33,
      reference: 'Bukhari, Muslim',
    ),
    Adhkar(
      id: 'priere_4',
      category: 'apres_priere',
      title: 'Tahlil (Unicité)',
      textAr: 'لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ',
      textFr: 'Il n\'y a de divinité qu\'Allah, Seul, sans associé. À Lui la royauté et la louange. Il est capable de toute chose.',
      transliteration: 'La ilaha illa Allah wahdahu la sharika lah, lahu l-mulku wa lahu l-hamdu wa huwa \'ala kulli shay\'in qadir.',
      repetitions: 1,
      reference: 'Bukhari, Muslim',
    ),
    Adhkar(
      id: 'priere_5',
      category: 'apres_priere',
      title: 'Ayat al-Kursi',
      textAr: 'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ',
      textFr: 'Allah ! Pas de divinité à part Lui, le Vivant, Celui qui subsiste par Lui-même.',
      transliteration: 'Allahu la ilaha illa Huwa l-Hayyu l-Qayyum.',
      repetitions: 1,
      reference: 'Coran 2:255',
    ),

    // ========== MATIN / SOIR (5) ==========
    Adhkar(
      id: 'matinsoir_1',
      category: 'matin_soir',
      title: 'Al-Ikhlas',
      textAr: 'قُلْ هُوَ اللَّهُ أَحَدٌ',
      textFr: 'Dis : Il est Allah, l\'Unique.',
      transliteration: 'Qul Huwa Allahu Ahad.',
      repetitions: 3,
      reference: 'Coran 112',
    ),
    Adhkar(
      id: 'matinsoir_2',
      category: 'matin_soir',
      title: 'Al-Falaq',
      textAr: 'قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ',
      textFr: 'Dis : Je cherche protection auprès du Seigneur de l\'aube naissante.',
      transliteration: 'Qul a\'udhu bi Rabbi l-falaq.',
      repetitions: 3,
      reference: 'Coran 113',
    ),
    Adhkar(
      id: 'matinsoir_3',
      category: 'matin_soir',
      title: 'An-Nas',
      textAr: 'قُلْ أَعُوذُ بِرَبِّ النَّاسِ',
      textFr: 'Dis : Je cherche protection auprès du Seigneur des hommes.',
      transliteration: 'Qul a\'udhu bi Rabbi n-nas.',
      repetitions: 3,
      reference: 'Coran 114',
    ),
    Adhkar(
      id: 'matinsoir_4',
      category: 'matin_soir',
      title: 'Sayyid al-Istighfar',
      textAr: 'اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَٰهَ إِلَّا أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ',
      textFr: 'Ô Allah, Tu es mon Seigneur, pas de divinité à part Toi. Tu m\'as créé et je suis Ton serviteur.',
      transliteration: 'Allahumma Anta Rabbi la ilaha illa Anta khalaqtani wa ana \'abduk.',
      repetitions: 1,
      reference: 'Bukhari',
    ),
    Adhkar(
      id: 'matinsoir_5',
      category: 'matin_soir',
      title: 'Protection',
      textAr: 'بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ',
      textFr: 'Au nom d\'Allah, Celui dont le Nom protège contre tout mal sur terre et dans les cieux.',
      transliteration: 'Bismillahi lladhi la yadurru ma\'a ismihi shay\'un fi l-ardi wa la fi s-sama\'.',
      repetitions: 3,
      reference: 'Abu Dawud, Tirmidhi',
    ),

    // ========== LIBRE (5) ==========
    Adhkar(
      id: 'libre_1',
      category: 'libre',
      title: 'SubhanAllahi wa bihamdih',
      textAr: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
      textFr: 'Gloire à Allah et louange à Lui.',
      transliteration: 'SubhanAllahi wa bihamdih.',
      repetitions: 100,
      reference: 'Bukhari',
    ),
    Adhkar(
      id: 'libre_2',
      category: 'libre',
      title: 'La hawla wa la quwwata',
      textAr: 'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
      textFr: 'Il n\'y a de force ni de puissance qu\'en Allah.',
      transliteration: 'La hawla wa la quwwata illa billah.',
      repetitions: 1,
      reference: 'Bukhari, Muslim',
    ),
    Adhkar(
      id: 'libre_3',
      category: 'libre',
      title: 'Salawat',
      textAr: 'اللَّهُمَّ صَلِّ عَلَىٰ مُحَمَّدٍ وَعَلَىٰ آلِ مُحَمَّدٍ',
      textFr: 'Ô Allah, prie sur Muhammad et sur la famille de Muhammad.',
      transliteration: 'Allahumma salli \'ala Muhammad wa \'ala ali Muhammad.',
      repetitions: 10,
      reference: 'Muslim',
    ),
    Adhkar(
      id: 'libre_4',
      category: 'libre',
      title: 'Hasbiyallahu',
      textAr: 'حَسْبِيَ اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ عَلَيْهِ تَوَكَّلْتُ',
      textFr: 'Allah me suffit. Pas de divinité à part Lui. En Lui je place ma confiance.',
      transliteration: 'Hasbiyallahu la ilaha illa Huwa \'alayhi tawakkaltu.',
      repetitions: 7,
      reference: 'Coran 9:129',
    ),
    Adhkar(
      id: 'libre_5',
      category: 'libre',
      title: 'Istighfar',
      textAr: 'أَسْتَغْفِرُ اللَّهَ',
      textFr: 'Je demande pardon à Allah.',
      transliteration: 'Astaghfirullah.',
      repetitions: 100,
      reference: 'Muslim',
    ),
  ];

  static List<Adhkar> getByCategory(String category) {
    return all.where((a) => a.category == category).toList();
  }

  static const List<String> categories = [
    'apres_priere',
    'matin_soir',
    'libre',
  ];
}
