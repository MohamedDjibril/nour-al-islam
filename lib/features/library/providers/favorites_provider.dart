import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider des favoris (IDs des douas favorites)
final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, Set<String>>((ref) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<Set<String>> {
  FavoritesNotifier() : super({}) {
    _load();
  }

  static const _keyFavorites = 'library_favorites';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_keyFavorites) ?? [];
    state = list.toSet();
  }

  Future<void> toggle(String duaId) async {
    final newSet = Set<String>.from(state);
    if (newSet.contains(duaId)) {
      newSet.remove(duaId);
    } else {
      newSet.add(duaId);
    }
    state = newSet;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_keyFavorites, newSet.toList());
  }

  bool isFavorite(String duaId) => state.contains(duaId);
}