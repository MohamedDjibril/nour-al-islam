import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/duas_data.dart';
import '../models/dua.dart';

/// État de la bibliothèque
class LibraryState {
  final String? selectedCategory;
  final List<Dua> filteredDuas;
  final String searchQuery;

  const LibraryState({
    this.selectedCategory,
    this.filteredDuas = const [],
    this.searchQuery = '',
  });

  LibraryState copyWith({
    String? selectedCategory,
    List<Dua>? filteredDuas,
    String? searchQuery,
  }) {
    return LibraryState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      filteredDuas: filteredDuas ?? this.filteredDuas,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

/// Provider de la bibliothèque
final libraryProvider =
    StateNotifierProvider<LibraryNotifier, LibraryState>((ref) {
  return LibraryNotifier();
});

class LibraryNotifier extends StateNotifier<LibraryState> {
  LibraryNotifier() : super(const LibraryState()) {
    _loadAll();
  }

  void _loadAll() {
    state = state.copyWith(filteredDuas: DuasData.all);
  }

  void selectCategory(String? category) {
    if (category == null) {
      state = state.copyWith(
        selectedCategory: null,
        filteredDuas: DuasData.all,
      );
      return;
    }

    final filtered = DuasData.getByCategory(category);
    state = state.copyWith(
      selectedCategory: category,
      filteredDuas: filtered,
    );
  }

  void search(String query) {
    if (query.isEmpty) {
      if (state.selectedCategory == null) {
        state = state.copyWith(
          searchQuery: '',
          filteredDuas: DuasData.all,
        );
      } else {
        state = state.copyWith(
          searchQuery: '',
          filteredDuas: DuasData.getByCategory(state.selectedCategory!),
        );
      }
      return;
    }

    final base = state.selectedCategory == null
        ? DuasData.all
        : DuasData.getByCategory(state.selectedCategory!);

    final filtered = base.where((dua) {
      final q = query.toLowerCase();
      return dua.title.toLowerCase().contains(q) ||
          dua.textFr.toLowerCase().contains(q) ||
          dua.transliteration.toLowerCase().contains(q);
    }).toList();

    state = state.copyWith(
      searchQuery: query,
      filteredDuas: filtered,
    );
  }

  void reset() {
    state = const LibraryState();
    _loadAll();
  }
}