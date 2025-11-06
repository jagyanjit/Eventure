import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/name_input_screen.dart';
import 'theme/app_theme.dart';
import 'providers/theme_provider.dart';
import 'providers/auth_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final authState = ref.watch(authProvider);

    return MaterialApp(
      title: 'Eventure',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: authState.when(
        data: (user) {
          debugPrint('🏠 APP: Building - user = ${user?.name ?? "null"}');

          if (user == null) {
            debugPrint('🏠 APP: Showing LoginScreen (no user)');
            return const LoginScreen();
          } else if (user.name == 'User') {
            debugPrint('🏠 APP: Showing NameInputScreen (default name)');
            return const NameInputScreen();
          } else {
            debugPrint('🏠 APP: Showing HomeScreen (${user.name})');
            return const HomeScreen();
          }
        },
        loading: () {
          debugPrint('🏠 APP: Loading...');
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
        error: (error, stack) {
          debugPrint('🏠 APP: Error - $error');
          return const LoginScreen();
        },
      ),
    );
  }
}
