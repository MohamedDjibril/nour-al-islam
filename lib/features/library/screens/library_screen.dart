import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/routes/app_router.dart';
import '../providers/library_provider.dart';
import '../providers/favorites_provider.dart';
import '../models/dua.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(libraryProvider);
    final notifier = ref.read(libraryProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        title: const Text('Bibliothèque'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => notifier.search(value),
                decoration: InputDecoration(
                  hintText: 'Rechercher une dua...',
                  prefixIcon: const Icon(Icons.search, color: AppColors.gold),
                  suffixIcon: state.searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            notifier.search('');
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _CategoryChip(
                    label: 'Toutes',
                    selected: state.selectedCategory == null,
                    onTap: () => notifier.selectCategory(null),
                  ),
                  const SizedBox(width: 8),
                  _CategoryChip(
                    label: '🌅 Matin',
                    selected: state.selectedCategory == 'matin',
                    onTap: () => notifier.selectCategory('matin'),
                  ),
                  const SizedBox(width: 8),
                  _CategoryChip(
                    label: '🌙 Soir',
                    selected: state.selectedCategory == 'soir',
                    onTap: () => notifier.selectCategory('soir'),
                  ),
                  const SizedBox(width: 8),
                  _CategoryChip(
                    label: '☀️ Quotidien',
                    selected: state.selectedCategory == 'quotidien',
                    onTap: () => notifier.selectCategory('quotidien'),
                  ),
                  const SizedBox(width: 8),
                  _CategoryChip(
                    label: '🕌 Spirituel',
                    selected: state.selectedCategory == 'spirituel',
                    onTap: () => notifier.selectCategory('spirituel'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: state.filteredDuas.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search_off,
                            size: 60,
                            color: AppColors.grey,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Aucune dua trouvée',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.filteredDuas.length,
                      itemBuilder: (context, index) {
                        final dua = state.filteredDuas[index];
                        return _DuaCard(dua: dua);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.gold : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? AppColors.gold : AppColors.greyLight,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? AppColors.white : AppColors.black,
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

class _DuaCard extends ConsumerWidget {
  final Dua dua;

  const _DuaCard({required this.dua});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFav = ref.watch(favoritesProvider).contains(dua.id);

    return InkWell(
      onTap: () {
        context.push(AppRoutes.duaDetailPath(dua.id));
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
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
                Expanded(
                  child: Text(
                    dua.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.gold,
                        ),
                  ),
                ),
                if (isFav)
                  const Icon(Icons.favorite, color: AppColors.gold, size: 18),
                const SizedBox(width: 6),
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
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.menu_book, size: 14, color: AppColors.grey),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    dua.reference,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const Icon(Icons.arrow_forward_ios,
                    size: 12, color: AppColors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
