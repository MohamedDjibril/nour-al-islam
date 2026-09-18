import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../config/theme/app_colors.dart';
import '../data/duas_data.dart';
import '../models/dua.dart';
import '../providers/favorites_provider.dart';

class DuaDetailScreen extends ConsumerWidget {
  final String duaId;

  const DuaDetailScreen({super.key, required this.duaId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dua = DuasData.all.firstWhere(
      (d) => d.id == duaId,
      orElse: () => DuasData.all.first,
    );

    final isFav = ref.watch(favoritesProvider).contains(dua.id);

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        title: const Text('Dua'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          // Favoris
          IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? AppColors.gold : null,
            ),
            onPressed: () {
              ref.read(favoritesProvider.notifier).toggle(dua.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFav
                        ? 'Retiré des favoris'
                        : 'Ajouté aux favoris ⭐',
                  ),
                  backgroundColor: AppColors.gold,
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
          // Partager
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareDua(context, dua),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ===== Catégorie =====
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.gold.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    dua.category.toUpperCase(),
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

              // ===== Titre =====
              Text(
                dua.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.gold,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // ===== Texte arabe (grand) =====
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.goldLight,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gold.withValues(alpha: 0.1),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Text(
                  dua.textAr,
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
              const SizedBox(height: 32),

              // ===== Traduction =====
              _Section(
                icon: Icons.translate,
                title: 'Traduction',
                child: Text(
                  dua.textFr,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.7,
                        fontSize: 17,
                      ),
                ),
              ),
              const SizedBox(height: 20),

              // ===== Translittération =====
              _Section(
                icon: Icons.record_voice_over,
                title: 'Prononciation',
                child: Text(
                  dua.transliteration,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                        height: 1.6,
                        color: AppColors.grey,
                      ),
                ),
              ),
              const SizedBox(height: 20),

              // ===== Référence =====
              _Section(
                icon: Icons.menu_book,
                title: 'Source',
                child: Text(
                  dua.reference,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gold,
                      ),
                ),
              ),
              const SizedBox(height: 40),

              // ===== Bouton Copier =====
              ElevatedButton.icon(
                onPressed: () {
                  _copyDua(context, dua);
                },
                icon: const Icon(Icons.copy),
                label: const Text('Copier la dua'),
              ),
              const SizedBox(height: 12),

              // ===== Bouton Audio (placeholder) =====
              OutlinedButton.icon(
                onPressed: null, // Désactivé pour l'instant
                icon: const Icon(Icons.volume_up),
                label: const Text('Écouter (bientôt)'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: AppColors.greyLight),
                  foregroundColor: AppColors.grey,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _copyDua(BuildContext context, Dua dua) {
    final text = '''
${dua.title}

${dua.textAr}

${dua.textFr}

${dua.transliteration}

Source : ${dua.reference}
''';

    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Dua copiée 📋'),
        backgroundColor: AppColors.success,
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _shareDua(BuildContext context, Dua dua) {
    final text = '''
🌙 ${dua.title}

${dua.textAr}

${dua.textFr}

${dua.transliteration}

Source : ${dua.reference}

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
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.greyLight),
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