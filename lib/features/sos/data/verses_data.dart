import '../models/verse.dart';

/// Base de versets vérifiés pour le module SOS
///
/// ⚠️ À FAIRE : Faire relire par un enseignant qualifié
/// ⚠️ Les traductions sont inspirées de Muhammad Hamidullah
class VersesData {
  VersesData._();

  static const List<Verse> all = [
    // ===== PATIENCE (Sabr) =====
    Verse(
      id: 'sabr_1',
      surah: 2,
      verseNumber: 153,
      textAr: 'يَا أَيُّهَا الَّذِينَ آمَنُوا اسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ إِنَّ اللَّهَ مَعَ الصَّابِرِينَ',
      textFr:
          'Ô les croyants ! Cherchez secours dans l\'endurance et la prière. Car Allah est avec ceux qui sont endurants.',
      reference: 'Al-Baqara, 2:153',
      theme: 'patience',
      reflection:
          'Qu\'est-ce qui te pousse à fuir cette épreuve ? Allah est avec toi.',
      action:
          'Fais 2 rak\'at de prière et demande à Allah la force de résister.',
    ),
    Verse(
      id: 'sabr_2',
      surah: 39,
      verseNumber: 10,
      textAr: 'إِنَّمَا يُوَفَّى الصَّابِرُونَ أَجْرَهُم بِغَيْرِ حِسَابٍ',
      textFr:
          'Les endurants auront leur pleine récompense sans compter.',
      reference: 'Az-Zumar, 39:10',
      theme: 'patience',
      reflection:
          'Ta patience d\'aujourd\'hui sera récompensée au-delà de ce que tu imagines.',
      action:
          'Écris une chose pour laquelle tu es reconnaissant en ce moment.',
    ),

    // ===== REPENTANCE (Tawba) =====
    Verse(
      id: 'tawba_1',
      surah: 39,
      verseNumber: 53,
      textAr: 'قُلْ يَا عِبَادِيَ الَّذِينَ أَسْرَفُوا عَلَىٰ أَنفُسِهِمْ لَا تَقْنَطُوا مِن رَّحْمَةِ اللَّهِ ۚ إِنَّ اللَّهَ يَغْفِرُ الذُّنُوبَ جَمِيعًا',
      textFr:
          'Dis : Ô Mes serviteurs qui avez commis des excès à votre propre détriment, ne désespérez pas de la miséricorde d\'Allah. Car Allah pardonne tous les péchés.',
      reference: 'Az-Zumar, 39:53',
      theme: 'repentance',
      reflection:
          'Allah t\'attend, peu importe ce que tu as fait. Ne désespère jamais.',
      action:
          'Fais une dua de pardon sincère et engage-toi à recommencer.',
    ),
    Verse(
      id: 'tawba_2',
      surah: 25,
      verseNumber: 70,
      textAr: 'إِلَّا مَن تَابَ وَآمَنَ وَعَمِلَ عَمَلًا صَالِحًا فَأُولَٰئِكَ يُبَدِّلُ اللَّهُ سَيِّئَاتِهِمْ حَسَنَاتٍ',
      textFr:
          'Sauf celui qui se repent, croit et accomplit de bonnes œuvres. À ceux-là, Allah changera leurs mauvaises actions en bonnes.',
      reference: 'Al-Furqan, 25:70',
      theme: 'repentance',
      reflection:
          'Allah peut transformer ta chute en une élévation. Repens-toi maintenant.',
      action:
          'Fais 3 istighfar (Astaghfirullah) et recommence avec un cœur purifié.',
    ),

    // ===== ESPOIR (Raja) =====
    Verse(
      id: 'raja_1',
      surah: 94,
      verseNumber: 5,
      textAr: 'فَإِنَّ مَعَ الْعُسْرِ يُسْرًا',
      textFr:
          'À côté de la difficulté est, certes, une facilité.',
      reference: 'Ash-Sharh, 94:5',
      theme: 'espoir',
      reflection:
          'Après chaque épreuve, il y a une délivrance. Allah ne t\'oublie pas.',
      action:
          'Prends 3 respirations profondes et dis : Hasbunallah wa ni\'mal wakil.',
    ),
    Verse(
      id: 'raja_2',
      surah: 65,
      verseNumber: 3,
      textAr: 'وَمَن يَتَوَكَّلْ عَلَى اللَّهِ فَهُوَ حَسْبُهُ',
      textFr:
          'Et quiconque place sa confiance en Allah, Il lui suffit.',
      reference: 'At-Talaq, 65:3',
      theme: 'espoir',
      reflection:
          'Remets ton fardeau à Allah. Il s\'occupe de tout.',
      action:
          'Dis 3 fois : Hasbiyallahu la ilaha illa Huwa.',
    ),

    // ===== GRATITUDE (Shukr) =====
    Verse(
      id: 'shukr_1',
      surah: 14,
      verseNumber: 7,
      textAr: 'لَئِن شَكَرْتُمْ لَأَزِيدَنَّكُمْ',
      textFr:
          'Si vous êtes reconnaissants, Je vous donnerai davantage.',
      reference: 'Ibrahim, 14:7',
      theme: 'gratitude',
      reflection:
          'Remercie Allah pour ce que tu as, et Il t\'en donnera plus.',
      action:
          'Dis 3 fois : Alhamdulillahi rabbil alamin.',
    ),
    Verse(
      id: 'shukr_2',
      surah: 2,
      verseNumber: 152,
      textAr: 'فَاذْكُرُونِي أَذْكُرْكُمْ وَاشْكُرُوا لِي وَلَا تَكْفُرُونِ',
      textFr:
          'Souvenez-vous de Moi donc. Je me souviendrai de vous. Remerciez-Moi et ne soyez pas ingrats.',
      reference: 'Al-Baqara, 2:152',
      theme: 'gratitude',
      reflection:
          'Quand tu te souviens d\'Allah, Il se souvient de toi.',
      action:
          'Fais une liste mentale de 3 bienfaits d\'Allah dans ta journée.',
    ),

    // ===== PROTECTION (Hifz) =====
    Verse(
      id: 'hifz_1',
      surah: 23,
      verseNumber: 97,
      textAr: 'وَقُل رَّبِّ أَعُوذُ بِكَ مِنْ هَمَزَاتِ الشَّيَاطِينِ',
      textFr:
          'Et dis : Seigneur, je cherche Ta protection contre les suggestions des démons.',
      reference: 'Al-Mu\'minun, 23:97',
      theme: 'protection',
      reflection:
          'Demande à Allah de te protéger. Il est le meilleur protecteur.',
      action:
          'Dis : A\'udhu billahi min ash-shaytani r-rajim.',
    ),
    Verse(
      id: 'hifz_2',
      surah: 7,
      verseNumber: 200,
      textAr: 'وَإِمَّا يَنزَغَنَّكَ مِنَ الشَّيْطَانِ نَزْغٌ فَاسْتَعِذْ بِاللَّهِ ۖ إِنَّهُ سَمِيعٌ عَلِيمٌ',
      textFr:
          'Et si une suggestion du diable te tourmente, cherche refuge auprès d\'Allah. Il est certes Audient et Omniscient.',
      reference: 'Al-A\'raf, 7:200',
      theme: 'protection',
      reflection:
          'Le Shaytan te tente, mais Allah est plus proche de toi que tu ne penses.',
      action:
          'Fais tes ablutions (wudu) et change de position (debout → assis).',
    ),
  ];

  /// Récupère un verset aléatoire par thème
  static Verse getRandomByTheme(String theme) {
    final filtered = all.where((v) => v.theme == theme).toList();
    if (filtered.isEmpty) {
      return all[DateTime.now().millisecondsSinceEpoch % all.length];
    }
    return filtered[DateTime.now().millisecondsSinceEpoch % filtered.length];
  }

  /// Liste des thèmes disponibles
  static const List<String> themes = [
    'patience',
    'repentance',
    'espoir',
    'gratitude',
    'protection',
  ];
}