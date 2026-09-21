import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/theme/theme_extensions.dart';
import '../../../config/routes/app_router.dart';
import '../data/duas_data.dart';
import '../models/dua.dart';
import '../providers/favorites_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final favoriteDuas =
        DuasData.all.where((dua) => favorites.contains(dua.id)).toList();

    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        title: const Text('Mes Favoris'),
      ),
      body: SafeArea(
        child: favoriteDuas.isEmpty
            ? const _EmptyState()
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: favoriteDuas.length,
                itemBuilder: (context, index) {
                  return _FavoriteDuaCard(dua: favoriteDuas[index]);
                },
              ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.gold.withValues(alpha: 0.15),
              ),
              child: const Icon(
                Icons.favorite_border,
                size: 60,
                color: AppColors.gold,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Aucun favori pour l\'instant',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Explorez la bibliothèque et appuyez sur le cœur ❤️ pour ajouter vos duas préférées ici.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.6,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.go(AppRoutes.library),
              icon: const Icon(Icons.menu_book),
              label: const Text('Explorer la bibliothèque'),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteDuaCard extends ConsumerWidget {
  final Dua dua;

  const _FavoriteDuaCard({required this.dua});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        context.push(AppRoutes.duaDetailPath(dua.id));
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: context.appSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.goldLight, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    dua.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.gold,
                        ),
                  ),
                ),
                const Icon(Icons.favorite, color: AppColors.gold, size: 20),
                const SizedBox(width: 8),
                Text(
                  dua.category,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              dua.textAr,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Amiri',
                height: 1.8,
                color: AppColors.gold,
              ),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 16),
            Text(
              dua.textFr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.6,
                  ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.menu_book,
                    size: 14, color: context.appTextSecondary),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    dua.reference,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 12, color: context.appTextSecondary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
