import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/duas_data.dart';
import '../data/adhkar_data.dart';
import '../data/hadiths_data.dart';
import '../models/dua.dart';
import '../models/adhkar.dart';
import '../models/hadith.dart';

/// Type de contenu dans la bibliothèque
enum LibraryContentType { duas, adhkar, hadiths }

/// État de la bibliothèque
class LibraryState {
  final LibraryContentType contentType;
  final String? selectedCategory;
  final String searchQuery;

  final List<Dua> filteredDuas;
  final List<Adhkar> filteredAdhkar;
  final List<Hadith> filteredHadiths;

  const LibraryState({
    this.contentType = LibraryContentType.duas,
    this.selectedCategory,
    this.searchQuery = '',
    this.filteredDuas = const [],
    this.filteredAdhkar = const [],
    this.filteredHadiths = const [],
  });

  LibraryState copyWith({
    LibraryContentType? contentType,
    String? selectedCategory,
    String? searchQuery,
    List<Dua>? filteredDuas,
    List<Adhkar>? filteredAdhkar,
    List<Hadith>? filteredHadiths,
    bool clearCategory = false,
  }) {
    return LibraryState(
      contentType: contentType ?? this.contentType,
      selectedCategory:
          clearCategory ? null : (selectedCategory ?? this.selectedCategory),
      searchQuery: searchQuery ?? this.searchQuery,
      filteredDuas: filteredDuas ?? this.filteredDuas,
      filteredAdhkar: filteredAdhkar ?? this.filteredAdhkar,
      filteredHadiths: filteredHadiths ?? this.filteredHadiths,
    );
  }

  int get totalCount => switch (contentType) {
        LibraryContentType.duas => filteredDuas.length,
        LibraryContentType.adhkar => filteredAdhkar.length,
        LibraryContentType.hadiths => filteredHadiths.length,
      };

  bool get isEmpty => totalCount == 0;
}

final libraryProvider =
    StateNotifierProvider<LibraryNotifier, LibraryState>((ref) {
  return LibraryNotifier();
});

class LibraryNotifier extends StateNotifier<LibraryState> {
  LibraryNotifier() : super(const LibraryState()) {
    _loadAll();
  }

  void _loadAll() {
    state = state.copyWith(
      filteredDuas: DuasData.all,
      filteredAdhkar: AdhkarData.all,
      filteredHadiths: HadithsData.all,
    );
  }

  void setContentType(LibraryContentType type) {
    state = state.copyWith(
      contentType: type,
      clearCategory: true,
      searchQuery: '',
    );
    _loadAll();
  }

  void selectCategory(String? category) {
    if (category == null) {
      state = state.copyWith(clearCategory: true);
      _loadAll();
      return;
    }

    switch (state.contentType) {
      case LibraryContentType.duas:
        state = state.copyWith(
          selectedCategory: category,
          filteredDuas: DuasData.getByCategory(category),
        );
        break;
      case LibraryContentType.adhkar:
        state = state.copyWith(
          selectedCategory: category,
          filteredAdhkar: AdhkarData.getByCategory(category),
        );
        break;
      case LibraryContentType.hadiths:
        state = state.copyWith(
          selectedCategory: category,
          filteredHadiths: HadithsData.getByCategory(category),
        );
        break;
    }
  }

  void search(String query) {
    final q = query.toLowerCase();

    if (q.isEmpty) {
      _loadAll();
      state = state.copyWith(searchQuery: '');
      return;
    }

    switch (state.contentType) {
      case LibraryContentType.duas:
        final base = state.selectedCategory == null
            ? DuasData.all
            : DuasData.getByCategory(state.selectedCategory!);
        state = state.copyWith(
          searchQuery: query,
          filteredDuas: base
              .where((d) =>
                  d.title.toLowerCase().contains(q) ||
                  d.textFr.toLowerCase().contains(q) ||
                  d.transliteration.toLowerCase().contains(q))
              .toList(),
        );
        break;
      case LibraryContentType.adhkar:
        final base = state.selectedCategory == null
            ? AdhkarData.all
            : AdhkarData.getByCategory(state.selectedCategory!);
        state = state.copyWith(
          searchQuery: query,
          filteredAdhkar: base
              .where((a) =>
                  a.title.toLowerCase().contains(q) ||
                  a.textFr.toLowerCase().contains(q) ||
                  a.transliteration.toLowerCase().contains(q))
              .toList(),
        );
        break;
      case LibraryContentType.hadiths:
        final base = state.selectedCategory == null
            ? HadithsData.all
            : HadithsData.getByCategory(state.selectedCategory!);
        state = state.copyWith(
          searchQuery: query,
          filteredHadiths: base
              .where((h) =>
                  h.title.toLowerCase().contains(q) ||
                  h.textFr.toLowerCase().contains(q) ||
                  h.narrator.toLowerCase().contains(q))
              .toList(),
        );
        break;
    }
  }

  void reset() {
    state = const LibraryState();
    _loadAll();
  }
}
