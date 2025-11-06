import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  AuthNotifier() : super(const AsyncValue.loading()) {
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    debugPrint('🔄 AUTH: Checking status...');
    try {
      final user = await AuthService.getCurrentUser();
      state = AsyncValue.data(user);
      debugPrint('🔄 AUTH: Status - ${user?.name ?? "No user"}');
    } catch (e, stack) {
      debugPrint('❌ AUTH: Error - $e');
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> login(String email, String password) async {
    debugPrint('🔑 AUTH: Login starting for $email...');
    state = const AsyncValue.loading();
    try {
      final user = await AuthService.login(email, password);
      await AuthService.saveUser(user);
      state = AsyncValue.data(user);
      debugPrint('🔑 AUTH: Login complete - ${user.name}');
    } catch (e, stack) {
      debugPrint('❌ AUTH: Login error - $e');
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> signup(String email, String password) async {
    debugPrint('📝 AUTH: Signup starting for $email...');
    state = const AsyncValue.loading();
    try {
      final user = await AuthService.signup(email, password);
      await AuthService.saveUser(user);
      state = AsyncValue.data(user);
      debugPrint('📝 AUTH: Signup complete - ${user.name}');
    } catch (e, stack) {
      debugPrint('❌ AUTH: Signup error - $e');
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> updateName(String name) async {
    debugPrint('✏️ AUTH: Update name starting - "$name"');
    final currentUser = state.value;

    if (currentUser == null) {
      debugPrint('❌ AUTH: No current user to update!');
      return;
    }

    try {
      final updatedUser = await AuthService.updateUserName(currentUser, name);
      state = AsyncValue.data(updatedUser);
      debugPrint('✏️ AUTH: Update complete - ${updatedUser.name}');
    } catch (e, stack) {
      debugPrint('❌ AUTH: Update error - $e');
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> logout() async {
    debugPrint('🚪 AUTH: Logout starting...');
    await AuthService.logout();
    state = const AsyncValue.data(null);
    debugPrint('🚪 AUTH: Logout complete - state is now null');
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  return AuthNotifier();
});

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authProvider);
  return authState.when(
    data: (user) => user != null,
    loading: () => false,
    error: (_, __) => false,
  );
});
