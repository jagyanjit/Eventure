import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService {
  static const String _currentUserKey = 'current_user';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _usersPrefix = 'user_'; // Store all users by email

  // Login - Load existing user or create new one
  static Future<User> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    final prefs = await SharedPreferences.getInstance();
    final userKey = '$_usersPrefix${email.toLowerCase()}';
    final existingUserJson = prefs.getString(userKey);

    User user;
    if (existingUserJson != null) {
      // User exists - load their data
      user = User.fromJson(json.decode(existingUserJson));
      debugPrint(
          '🔐 LOGIN: Found existing user - ${user.name} (${user.email})');
    } else {
      // New user - create with default name
      user = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: email,
        name: 'User',
      );
      // Save to users storage
      await prefs.setString(userKey, json.encode(user.toJson()));
      debugPrint('🔐 LOGIN: Created new user - ${user.email}');
    }

    return user;
  }

  // Signup - Same as login (dummy auth)
  static Future<User> signup(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    final prefs = await SharedPreferences.getInstance();
    final userKey = '$_usersPrefix${email.toLowerCase()}';

    // Create new user
    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: 'User',
    );

    // Save to users storage
    await prefs.setString(userKey, json.encode(user.toJson()));
    debugPrint('📝 SIGNUP: Created new user - ${user.email}');

    return user;
  }

  // Update user name
  static Future<User> updateUserName(User user, String name) async {
    final updatedUser = User(
      id: user.id,
      email: user.email,
      name: name,
    );

    // Save to both current user AND users storage
    await saveUser(updatedUser);

    final prefs = await SharedPreferences.getInstance();
    final userKey = '$_usersPrefix${user.email.toLowerCase()}';
    await prefs.setString(userKey, json.encode(updatedUser.toJson()));

    debugPrint('✏️ UPDATE NAME: Saved - $name');
    return updatedUser;
  }

  // Save current logged-in user
  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentUserKey, json.encode(user.toJson()));
    await prefs.setBool(_isLoggedInKey, true);
    debugPrint('💾 SAVE USER: ${user.name} (${user.email})');
  }

  // Get current user
  static Future<User?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_currentUserKey);
    if (userJson != null) {
      return User.fromJson(json.decode(userJson));
    }
    return null;
  }

  // Check if logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentUserKey);
    await prefs.setBool(_isLoggedInKey, false);
    debugPrint('🚪 LOGOUT: User logged out');
  }
}
