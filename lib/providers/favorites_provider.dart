import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/event.dart';
import '../services/storage_service.dart';

class FavoritesNotifier extends StateNotifier<AsyncValue<List<Event>>> {
  FavoritesNotifier() : super(const AsyncValue.loading()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    state = const AsyncValue.loading();
    try {
      final favorites = await StorageService.loadFavorites();
      state = AsyncValue.data(favorites);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> toggleFavorite(Event event) async {
    // Get current list
    final currentList = state.value ?? [];

    // Check if already favorited
    final isFavorited = currentList.any((e) => e.id == event.id);

    // Update optimistically
    if (isFavorited) {
      state =
          AsyncValue.data(currentList.where((e) => e.id != event.id).toList());
    } else {
      state = AsyncValue.data([...currentList, event]);
    }

    // Save to storage
    try {
      await StorageService.toggleFavorite(event);
    } catch (e) {
      // Reload on error
      loadFavorites();
    }
  }

  bool isFavorite(String eventId) {
    return state.when(
      data: (favorites) => favorites.any((e) => e.id == eventId),
      loading: () => false,
      error: (_, __) => false,
    );
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, AsyncValue<List<Event>>>((ref) {
  return FavoritesNotifier();
});

final isFavoriteProvider = Provider.family<bool, String>((ref, eventId) {
  final favoritesAsync = ref.watch(favoritesProvider);
  return favoritesAsync.when(
    data: (favorites) => favorites.any((e) => e.id == eventId),
    loading: () => false,
    error: (_, __) => false,
  );
});
