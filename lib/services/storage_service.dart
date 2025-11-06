import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/event.dart';

class StorageService {
  static const String _bookmarksKey = 'bookmarked_events';
  static const String _favoritesKey = 'favorite_events';

  // BOOKMARKS (Bookmark icon)
  static Future<void> saveBookmarks(List<Event> events) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = events.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(_bookmarksKey, jsonList);
  }

  static Future<List<Event>> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_bookmarksKey) ?? [];
    return jsonList.map((jsonStr) {
      final jsonMap = json.decode(jsonStr);
      return Event.fromJson(jsonMap);
    }).toList();
  }

  static Future<bool> toggleBookmark(Event event) async {
    final bookmarks = await loadBookmarks();
    final index = bookmarks.indexWhere((e) => e.id == event.id);

    if (index >= 0) {
      bookmarks.removeAt(index);
      await saveBookmarks(bookmarks);
      return false;
    } else {
      bookmarks.add(event);
      await saveBookmarks(bookmarks);
      return true;
    }
  }

  // FAVORITES (Heart icon)
  static Future<void> saveFavorites(List<Event> events) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = events.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(_favoritesKey, jsonList);
  }

  static Future<List<Event>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_favoritesKey) ?? [];
    return jsonList.map((jsonStr) {
      final jsonMap = json.decode(jsonStr);
      return Event.fromJson(jsonMap);
    }).toList();
  }

  static Future<bool> toggleFavorite(Event event) async {
    final favorites = await loadFavorites();
    final index = favorites.indexWhere((e) => e.id == event.id);

    if (index >= 0) {
      favorites.removeAt(index);
      await saveFavorites(favorites);
      return false;
    } else {
      favorites.add(event);
      await saveFavorites(favorites);
      return true;
    }
  }
}
