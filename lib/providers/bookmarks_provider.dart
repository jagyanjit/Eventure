import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/event.dart';
import '../services/storage_service.dart';

class BookmarksNotifier extends StateNotifier<AsyncValue<List<Event>>> {
  BookmarksNotifier() : super(const AsyncValue.loading()) {
    loadBookmarks();
  }

  Future<void> loadBookmarks() async {
    state = const AsyncValue.loading();
    try {
      final bookmarks = await StorageService.loadBookmarks();
      state = AsyncValue.data(bookmarks);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> toggleBookmark(Event event) async {
    // Get current list
    final currentList = state.value ?? [];

    // Check if already bookmarked
    final isBookmarked = currentList.any((e) => e.id == event.id);

    // Update optimistically
    if (isBookmarked) {
      state =
          AsyncValue.data(currentList.where((e) => e.id != event.id).toList());
    } else {
      state = AsyncValue.data([...currentList, event]);
    }

    // Save to storage
    try {
      await StorageService.toggleBookmark(event);
    } catch (e) {
      // Reload on error
      loadBookmarks();
    }
  }

  bool isBookmarked(String eventId) {
    return state.when(
      data: (bookmarks) => bookmarks.any((e) => e.id == eventId),
      loading: () => false,
      error: (_, __) => false,
    );
  }
}

final bookmarksProvider =
    StateNotifierProvider<BookmarksNotifier, AsyncValue<List<Event>>>((ref) {
  return BookmarksNotifier();
});

final isBookmarkedProvider = Provider.family<bool, String>((ref, eventId) {
  final bookmarksAsync = ref.watch(bookmarksProvider);
  return bookmarksAsync.when(
    data: (bookmarks) => bookmarks.any((e) => e.id == eventId),
    loading: () => false,
    error: (_, __) => false,
  );
});
