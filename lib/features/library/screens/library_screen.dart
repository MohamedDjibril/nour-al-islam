import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/theme/theme_extensions.dart';
import '../../../config/routes/app_router.dart';
import '../providers/library_provider.dart';
import '../providers/favorites_provider.dart';
import '../models/dua.dart';
import '../models/adhkar.dart';
import '../models/hadith.dart';

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
      backgroundColor: context.appBackground,
      appBar: AppBar(
        title: const Text('Bibliothèque'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: context.appSurface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  _TypeTab(
                    label: 'Duas',
                    selected: state.contentType == LibraryContentType.duas,
                    onTap: () =>
                        notifier.setContentType(LibraryContentType.duas),
                  ),
                  _TypeTab(
                    label: 'Adhkar',
                    selected: state.contentType == LibraryContentType.adhkar,
                    onTap: () =>
                        notifier.setContentType(LibraryContentType.adhkar),
                  ),
                  _TypeTab(
                    label: 'Hadiths',
                    selected: state.contentType == LibraryContentType.hadiths,
                    onTap: () =>
                        notifier.setContentType(LibraryContentType.hadiths),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => notifier.search(value),
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
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
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: _buildCategoryChips(state, notifier, context),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: state.isEmpty
                  ? const _EmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.totalCount,
                      itemBuilder: (context, index) {
                        return _buildCard(context, ref, state, index);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChips(
      LibraryState state, LibraryNotifier notifier, BuildContext context) {
    List<String> categories;
    switch (state.contentType) {
      case LibraryContentType.duas:
        categories = ['matin', 'soir', 'quotidien', 'spirituel'];
        break;
      case LibraryContentType.adhkar:
        categories = ['apres_priere', 'matin_soir', 'libre'];
        break;
      case LibraryContentType.hadiths:
        categories = ['patience', 'gratitude', 'pardon', 'priere', 'caractere'];
        break;
    }

    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _CategoryChip(
          label: 'Toutes',
          selected: state.selectedCategory == null,
          onTap: () => notifier.selectCategory(null),
        ),
        const SizedBox(width: 8),
        ...categories.map((cat) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _CategoryChip(
                label: _categoryLabel(cat),
                selected: state.selectedCategory == cat,
                onTap: () => notifier.selectCategory(cat),
              ),
            )),
      ],
    );
  }

  String _categoryLabel(String cat) {
    switch (cat) {
      case 'matin':
        return 'Matin';
      case 'soir':
        return 'Soir';
      case 'quotidien':
        return 'Quotidien';
      case 'spirituel':
        return 'Spirituel';
      case 'apres_priere':
        return 'Après prière';
      case 'matin_soir':
        return 'Matin/Soir';
      case 'libre':
        return 'Libre';
      case 'patience':
        return 'Patience';
      case 'gratitude':
        return 'Gratitude';
      case 'pardon':
        return 'Pardon';
      case 'priere':
        return 'Prière';
      case 'caractere':
        return 'Caractère';
      default:
        return cat;
    }
  }

  Widget _buildCard(
      BuildContext context, WidgetRef ref, LibraryState state, int index) {
    switch (state.contentType) {
      case LibraryContentType.duas:
        return _DuaCard(dua: state.filteredDuas[index]);
      case LibraryContentType.adhkar:
        return _AdhkarCard(adhkar: state.filteredAdhkar[index]);
      case LibraryContentType.hadiths:
        return _HadithCard(hadith: state.filteredHadiths[index]);
    }
  }
}

class _TypeTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TypeTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? AppColors.gold : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: selected
                    ? AppColors.white
                    : (context.isDark ? AppColors.greyLight : AppColors.grey),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
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
          color: selected ? AppColors.gold : context.appSurface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? AppColors.gold : context.appBorder,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? AppColors.white : context.appTextPrimary,
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              fontSize: 13,
            ),
          ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 60, color: context.appTextSecondary),
          const SizedBox(height: 16),
          Text(
            'Aucun résultat',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
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
      onTap: () => context.push(AppRoutes.duaDetailPath(dua.id)),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
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
                Text(dua.category,
                    style: Theme.of(context).textTheme.bodySmall),
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
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(height: 1.6),
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

class _AdhkarCard extends StatelessWidget {
  final Adhkar adhkar;

  const _AdhkarCard({required this.adhkar});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
              Expanded(
                child: Text(
                  adhkar.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gold,
                      ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.goldLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'x${adhkar.repetitions}',
                  style: const TextStyle(
                    color: AppColors.gold,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            adhkar.textAr,
            style: const TextStyle(
              fontSize: 22,
              fontFamily: 'Amiri',
              height: 1.8,
              color: AppColors.gold,
            ),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 16),
          Text(
            adhkar.textFr,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
          ),
          const SizedBox(height: 12),
          Text(
            adhkar.transliteration,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
          const SizedBox(height: 12),
          Divider(color: context.appBorder),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.menu_book,
                  size: 14, color: context.appTextSecondary),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  adhkar.reference,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HadithCard extends StatelessWidget {
  final Hadith hadith;

  const _HadithCard({required this.hadith});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
              Expanded(
                child: Text(
                  hadith.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gold,
                      ),
                ),
              ),
              Text(hadith.category,
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.appSurfaceVariant,
              border: const Border(
                left: BorderSide(color: AppColors.gold, width: 4),
              ),
            ),
            child: Text(
              hadith.textAr,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Amiri',
                height: 1.8,
                color: AppColors.gold,
              ),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            hadith.textFr,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                  fontStyle: FontStyle.italic,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.person, size: 14, color: context.appTextSecondary),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  '${hadith.narrator} – ${hadith.reference}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
