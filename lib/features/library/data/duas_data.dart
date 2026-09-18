import '../models/dua.dart';

/// Base de 20 douas essentielles
///
/// ⚠️ À FAIRE : Faire relire par un enseignant qualifié
/// ⚠️ Translittération simplifiée pour francophones
class DuasData {
  DuasData._();

  static const List<Dua> all = [
    // ========== 🌅 MATIN (5) ==========

    Dua(
      id: 'matin_1',
      category: 'matin',
      title: 'Au réveil',
      textAr: 'الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
      textFr:
          'Louange à Allah qui nous a redonnés la vie après nous l\'avoir ôtée, et c\'est vers Lui que se fera la résurrection.',
      transliteration:
          'Al-hamdu lillahi lladhi ahyana ba\'da ma amatana wa ilayhi n-nushur.',
      reference: 'Bukhari, Muslim',
    ),
    Dua(
      id: 'matin_2',
      category: 'matin',
      title: 'Protection du matin',
      textAr: 'بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهُوَ السَّمِيعُ الْعَلِيمُ',
      textFr:
          'Au nom d\'Allah, Celui dont le Nom protège contre tout mal sur terre et dans les cieux. Il est l\'Audient, l\'Omniscient.',
      transliteration:
          'Bismillahi lladhi la yadurru ma\'a ismihi shay\'un fi l-ardi wa la fi s-sama\'i wa huwa s-sami\'u l-\'alim.',
      reference: 'Abu Dawud, Tirmidhi',
    ),
    Dua(
      id: 'matin_3',
      category: 'matin',
      title: 'Guidance',
      textAr: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ',
      textFr:
          'Ô Allah, guide-moi parmi ceux que Tu as guidés.',
      transliteration: 'Allahumma hdini fiman hadayt.',
      reference: 'Tirmidhi',
    ),
    Dua(
      id: 'matin_4',
      category: 'matin',
      title: 'Gratitude',
      textAr: 'اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا وَرِزْقًا طَيِّبًا وَعَمَلًا مُتَقَبَّلًا',
      textFr:
          'Ô Allah, je Te demande une science utile, une subsistance pure et une œuvre agréée.',
      transliteration:
          'Allahumma inni as\'aluka \'ilman nafi\'an wa rizqan tayyiban wa \'amalan mutaqabbalan.',
      reference: 'Ibn Majah',
    ),
    Dua(
      id: 'matin_5',
      category: 'matin',
      title: 'Force pour la journée',
      textAr: 'حَسْبِيَ اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ عَلَيْهِ تَوَكَّلْتُ وَهُوَ رَبُّ الْعَرْشِ الْعَظِيمِ',
      textFr:
          'Allah me suffit. Pas de divinité à part Lui. En Lui je place ma confiance, et Il est le Seigneur du Trône immense.',
      transliteration:
          'Hasbiyallahu la ilaha illa Huwa \'alayhi tawakkaltu wa Huwa Rabbu l-\'arshi l-\'azim.',
      reference: 'Coran 9:129 – 7 fois le matin',
    ),

    // ========== 🌙 SOIR (5) ==========

    Dua(
      id: 'soir_1',
      category: 'soir',
      title: 'Au coucher',
      textAr: 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
      textFr:
          'En Ton Nom, ô Allah, je meurs et je revis.',
      transliteration: 'Bismika Allahumma amutu wa ahya.',
      reference: 'Bukhari',
    ),
    Dua(
      id: 'soir_2',
      category: 'soir',
      title: 'Protection de la nuit',
      textAr: 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ',
      textFr:
          'Je cherche refuge dans les paroles parfaites d\'Allah contre le mal de ce qu\'Il a créé.',
      transliteration:
          'A\'udhu bikalimati llahi t-tammati min sharri ma khalaq.',
      reference: 'Muslim – 3 fois le soir',
    ),
    Dua(
      id: 'soir_3',
      category: 'soir',
      title: 'Pardon du soir',
      textAr: 'اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَٰهَ إِلَّا أَنْتَ خَلَقْتَنِي وَأَنَا عَبْدُكَ',
      textFr:
          'Ô Allah, Tu es mon Seigneur. Pas de divinité à part Toi. Tu m\'as créé et je suis Ton serviteur.',
      transliteration:
          'Allahumma Anta Rabbi la ilaha illa Anta khalaqtani wa ana \'abduk.',
      reference: 'Sayyid al-Istighfar – Bukhari',
    ),
    Dua(
      id: 'soir_4',
      category: 'soir',
      title: 'Paix du cœur',
      textAr: 'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ',
      textFr:
          'Ô Allah, je Te demande le bien-être dans ce monde et dans l\'au-delà.',
      transliteration:
          'Allahumma inni as\'aluka l-\'afiyata fi d-dunya wa l-akhira.',
      reference: 'Abu Dawud',
    ),
    Dua(
      id: 'soir_5',
      category: 'soir',
      title: 'Gratitude du soir',
      textAr: 'اللَّهُمَّ مَا أَصْبَحَ بِي مِنْ نِعْمَةٍ فَمِنْكَ',
      textFr:
          'Ô Allah, tout bienfait dont je jouis vient de Toi.',
      transliteration:
          'Allahumma ma asbaha bi min ni\'matin fa minka.',
      reference: 'Coran 16:53',
    ),

    // ========== ☀️ QUOTIDIEN (5) ==========

    Dua(
      id: 'quotidien_1',
      category: 'quotidien',
      title: 'Avant de manger',
      textAr: 'بِسْمِ اللَّهِ',
      textFr:
          'Au nom d\'Allah.',
      transliteration: 'Bismillah.',
      reference: 'Bukhari – Si oublié : Bismillahi awwalahu wa akhirahu',
    ),
    Dua(
      id: 'quotidien_2',
      category: 'quotidien',
      title: 'Après manger',
      textAr: 'الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنِي هَذَا وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ',
      textFr:
          'Louange à Allah qui m\'a nourri et accordé ceci sans force ni puissance de ma part.',
      transliteration:
          'Al-hamdu lillahi lladhi at\'amani hadha wa razaqanihi min ghayri hawlin minni wa la quwwa.',
      reference: 'Tirmidhi',
    ),
    Dua(
      id: 'quotidien_3',
      category: 'quotidien',
      title: 'En sortant de chez soi',
      textAr: 'بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
      textFr:
          'Au nom d\'Allah, je place ma confiance en Allah. Il n\'y a de force ni de puissance qu\'en Allah.',
      transliteration:
          'Bismillahi tawakkaltu \'ala llahi wa la hawla wa la quwwata illa billah.',
      reference: 'Abu Dawud, Tirmidhi',
    ),
    Dua(
      id: 'quotidien_4',
      category: 'quotidien',
      title: 'En voyageant',
      textAr: 'سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ',
      textFr:
          'Gloire à Celui qui a mis ceci à notre service, alors que nous n\'aurions pu le faire nous-mêmes.',
      transliteration:
          'Subhana lladhi sakhkhara lana hadha wa ma kunna lahu muqrinin.',
      reference: 'Coran 43:13',
    ),
    Dua(
      id: 'quotidien_5',
      category: 'quotidien',
      title: 'En entrant chez soi',
      textAr: 'اللَّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ الْمَوْلَجِ وَخَيْرَ الْمَخْرَجِ',
      textFr:
          'Ô Allah, je Te demande le meilleur lieu d\'entrée et le meilleur lieu de sortie.',
      transliteration:
          'Allahumma inni as\'aluka khayra l-mawlaji wa khayra l-makhraj.',
      reference: 'Abu Dawud',
    ),

    // ========== 🕌 SPIRITUEL (5) ==========

    Dua(
      id: 'spirituel_1',
      category: 'spirituel',
      title: 'Demande de pardon',
      textAr: 'رَبِّ اغْفِرْ لِي وَتُبْ عَلَيَّ إِنَّكَ أَنْتَ التَّوَّابُ الرَّحِيمُ',
      textFr:
          'Seigneur, pardonne-moi et accepte mon repentir. Tu es Celui qui accueille le repentir, le Très Miséricordieux.',
      transliteration:
          'Rabbi ghfir li wa tub \'alayya innaka Anta t-Tawwabu r-Rahim.',
      reference: 'Tirmidhi, Abu Dawud',
    ),
    Dua(
      id: 'spirituel_2',
      category: 'spirituel',
      title: 'Force face à l\'épreuve',
      textAr: 'لَا إِلَٰهَ إِلَّا اللَّهُ الْعَظِيمُ الْحَلِيمُ',
      textFr:
          'Pas de divinité à part Allah, le Très Grand, le Très Clément.',
      transliteration: 'La ilaha illa llahu l-\'azimu l-halim.',
      reference: 'Bukhari, Muslim',
    ),
    Dua(
      id: 'spirituel_3',
      category: 'spirituel',
      title: 'Patience',
      textAr: 'اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ وَشُكْرِكَ وَحُسْنِ عِبَادَتِكَ',
      textFr:
          'Ô Allah, aide-moi à T\'évoquer, à Te remercier et à T\'adorer de la meilleure façon.',
      transliteration:
          'Allahumma a\'inni \'ala dhikrika wa shukrika wa husni \'ibadatik.',
      reference: 'Abu Dawud, Nasa\'i',
    ),
    Dua(
      id: 'spirituel_4',
      category: 'spirituel',
      title: 'Confiance en Allah',
      textAr: 'حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ',
      textFr:
          'Allah nous suffit, Il est le meilleur Garant.',
      transliteration: 'Hasbuna llahu wa ni\'ma l-wakil.',
      reference: 'Coran 3:173',
    ),
    Dua(
      id: 'spirituel_5',
      category: 'spirituel',
      title: 'Guidance',
      textAr: 'رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا',
      textFr:
          'Seigneur, ne fais pas dévier nos cœurs après nous avoir guidés.',
      transliteration:
          'Rabbana la tuzigh qulubana ba\'da idh hadaytana.',
      reference: 'Coran 3:8',
    ),
  ];

  /// Récupère les douas par catégorie
  static List<Dua> getByCategory(String category) {
    return all.where((d) => d.category == category).toList();
  }

  /// Catégories disponibles
  static const List<String> categories = [
    'matin',
    'soir',
    'quotidien',
    'spirituel',
  ];
}