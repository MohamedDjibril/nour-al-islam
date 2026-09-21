import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/theme/theme_extensions.dart';
import '../data/adhkar_data.dart';
import '../models/adhkar.dart';
import '../providers/favorites_provider.dart';
import '../../tracker/providers/tracker_provider.dart';

class AdhkarDetailScreen extends ConsumerStatefulWidget {
  final String adhkarId;

  const AdhkarDetailScreen({super.key, required this.adhkarId});

  @override
  ConsumerState<AdhkarDetailScreen> createState() =>
      _AdhkarDetailScreenState();
}

class _AdhkarDetailScreenState extends ConsumerState<AdhkarDetailScreen> {
  int _counter = 0;
  bool _alreadyRecorded = false;

  @override
  Widget build(BuildContext context) {
    final adhkar = AdhkarData.all.firstWhere(
      (a) => a.id == widget.adhkarId,
      orElse: () => AdhkarData.all.first,
    );
    final isFav = ref.watch(favoritesProvider).contains(adhkar.id);

    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        title: const Text('Adhkar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? AppColors.gold : null,
            ),
            onPressed: () {
              ref.read(favoritesProvider.notifier).toggle(adhkar.id);
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _share(context, adhkar),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.gold.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    adhkar.category.toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.gold,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                adhkar.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.gold,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // ===== Compteur interactif =====
              Center(
                child: GestureDetector(
                  onTap: () => _increment(adhkar),
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: _counter >= adhkar.repetitions
                          ? const LinearGradient(
                              colors: [AppColors.success, AppColors.success],
                            )
                          : AppColors.goldGradient,
                      boxShadow: [
                        BoxShadow(
                          color: (_counter >= adhkar.repetitions
                                  ? AppColors.success
                                  : AppColors.gold)
                              .withValues(alpha: 0.3),
                          blurRadius: 20,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$_counter',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          '/ ${adhkar.repetitions}',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.white.withValues(alpha: 0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: TextButton.icon(
                  onPressed: () => setState(() {
                    _counter = 0;
                    _alreadyRecorded = false;
                  }),
                  icon: const Icon(Icons.refresh, color: AppColors.grey),
                  label: const Text(
                    'Réinitialiser',
                    style: TextStyle(color: AppColors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // ===== Texte arabe =====
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: context.appSurface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.goldLight,
                    width: 2,
                  ),
                ),
                child: Text(
                  adhkar.textAr,
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'Amiri',
                    color: AppColors.gold,
                    height: 2.0,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
              const SizedBox(height: 24),
              _Section(
                icon: Icons.translate,
                title: 'Traduction',
                child: Text(
                  adhkar.textFr,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.7,
                        fontSize: 17,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              _Section(
                icon: Icons.record_voice_over,
                title: 'Prononciation',
                child: Text(
                  adhkar.transliteration,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                        height: 1.6,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              _Section(
                icon: Icons.menu_book,
                title: 'Source',
                child: Text(
                  adhkar.reference,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gold,
                      ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () => _copy(context, adhkar),
                icon: const Icon(Icons.copy),
                label: const Text('Copier'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Incrémente le compteur et enregistre quand atteint
  void _increment(Adhkar adhkar) {
    if (_counter >= adhkar.repetitions) return;

    setState(() => _counter++);
    HapticFeedback.lightImpact();

    // Enregistrer dans le tracker quand on atteint le max
    if (_counter >= adhkar.repetitions && !_alreadyRecorded) {
      _alreadyRecorded = true;
      ref.read(trackerProvider.notifier).recordDhikr();
    }
  }

  void _copy(BuildContext context, Adhkar adhkar) {
    final text = '''
${adhkar.title}

${adhkar.textAr}

${adhkar.textFr}

${adhkar.transliteration}

Répétitions : ${adhkar.repetitions}x
Source : ${adhkar.reference}
''';
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Adhkar copié 📋'),
        backgroundColor: AppColors.success,
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _share(BuildContext context, Adhkar adhkar) {
    final text = '''
🌙 ${adhkar.title}

${adhkar.textAr}

${adhkar.textFr}

${adhkar.transliteration}

Répétitions : ${adhkar.repetitions}x
Source : ${adhkar.reference}

— Via Nour al-Islam
''';
    Share.share(text);
  }
}

class _Section extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _Section({
    required this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.appSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.appBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: AppColors.gold),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.gold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
