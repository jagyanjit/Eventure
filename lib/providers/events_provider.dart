import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/event.dart';
import '../services/api_service.dart';

// Events Provider
final eventsProvider = FutureProvider<List<Event>>((ref) async {
  return await ApiService.fetchEvents();
});

// Search Query Provider
final searchQueryProvider = StateProvider<String>((ref) => '');

// Category Filter Provider
final selectedCategoryProvider = StateProvider<String?>((ref) => null);

// Combined Filtered Events Provider (FIXED)
final filteredEventsProvider = Provider<AsyncValue<List<Event>>>((ref) {
  final eventsAsync = ref.watch(eventsProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);

  return eventsAsync.when(
    data: (events) {
      var filtered = events;

      // Apply category filter FIRST
      if (selectedCategory != null && selectedCategory.isNotEmpty) {
        filtered = filtered.where((event) {
          return event.category.toLowerCase() == selectedCategory.toLowerCase();
        }).toList();
      }

      // Then apply search filter
      if (searchQuery.isNotEmpty) {
        filtered = filtered.where((event) {
          return event.title
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()) ||
              event.category
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()) ||
              event.location.toLowerCase().contains(searchQuery.toLowerCase());
        }).toList();
      }

      return AsyncValue.data(filtered);
    },
    loading: () => const AsyncValue.loading(),
    error: (err, stack) => AsyncValue.error(err, stack),
  );
});

// Get unique categories
final categoriesProvider = Provider<List<String>>((ref) {
  final eventsAsync = ref.watch(eventsProvider);
  return eventsAsync.when(
    data: (events) {
      final categories = events.map((e) => e.category).toSet().toList();
      categories.sort();
      return categories;
    },
    loading: () => [],
    error: (_, __) => [],
  );
});
