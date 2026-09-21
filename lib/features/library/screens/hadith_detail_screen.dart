import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/theme/theme_extensions.dart';
import '../data/hadiths_data.dart';
import '../models/hadith.dart';
import '../providers/favorites_provider.dart';

class HadithDetailScreen extends ConsumerWidget {
  final String hadithId;

  const HadithDetailScreen({super.key, required this.hadithId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hadith = HadithsData.all.firstWhere(
      (h) => h.id == hadithId,
      orElse: () => HadithsData.all.first,
    );
    final isFav = ref.watch(favoritesProvider).contains(hadith.id);

    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        title: const Text('Hadith'),
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
              ref.read(favoritesProvider.notifier).toggle(hadith.id);
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _share(context, hadith),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.gold.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    hadith.category.toUpperCase(),
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
                hadith.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.gold,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // ===== Citation arabe =====
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: context.appSurface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    left: BorderSide(color: AppColors.gold, width: 6),
                  ),
                ),
                child: Text(
                  hadith.textAr,
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'Amiri',
                    color: AppColors.gold,
                    height: 2.0,
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
              const SizedBox(height: 24),

              // ===== Traduction =====
              _Section(
                icon: Icons.translate,
                title: 'Traduction',
                child: Text(
                  hadith.textFr,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.7,
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
              const SizedBox(height: 20),

              // ===== Narrateur =====
              _Section(
                icon: Icons.person,
                title: 'Rapporteur',
                child: Text(
                  hadith.narrator,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gold,
                      ),
                ),
              ),
              const SizedBox(height: 20),

              // ===== Source =====
              _Section(
                icon: Icons.menu_book,
                title: 'Source',
                child: Text(
                  hadith.reference,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gold,
                      ),
                ),
              ),
              const SizedBox(height: 40),

              // ===== Bouton Copier =====
              ElevatedButton.icon(
                onPressed: () => _copy(context, hadith),
                icon: const Icon(Icons.copy),
                label: const Text('Copier le hadith'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _copy(BuildContext context, Hadith hadith) {
    final text = '''
📜 ${hadith.title}

${hadith.textAr}

${hadith.textFr}

Rapporteur : ${hadith.narrator}
Source : ${hadith.reference}
''';
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Hadith copié 📋'),
        backgroundColor: AppColors.success,
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _share(BuildContext context, Hadith hadith) {
    final text = '''
🌙 ${hadith.title}

${hadith.textAr}

${hadith.textFr}

Rapporteur : ${hadith.narrator}
Source : ${hadith.reference}

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
