import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/onboarding/providers/onboarding_provider.dart';
import '../../features/onboarding/screens/welcome_screen.dart';
import '../../features/onboarding/screens/language_screen.dart';
import '../../features/onboarding/screens/notifications_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/library/screens/library_screen.dart';
import '../../features/library/screens/dua_detail_screen.dart';
import '../../features/library/screens/favorites_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/sos/screens/sos_start_screen.dart';
import '../../features/sos/screens/sos_session_screen.dart';
import '../../features/sos/screens/sos_complete_screen.dart';

/// Clés de navigation
class AppRoutes {
  static const String welcome = '/welcome';
  static const String language = '/onboarding/language';
  static const String notifications = '/onboarding/notifications';
  static const String home = '/home';
  static const String library = '/library';
  static const String favorites = '/favorites';
  static const String settings = '/settings';
  static const String duaDetail = '/dua/:id';

  // SOS
  static const String sosStart = '/sos/start';
  static const String sosSession = '/sos/session';
  static const String sosComplete = '/sos/complete';

  static String duaDetailPath(String id) => '/dua/$id';
}

/// Provider du routeur (stable, ne dépend pas de l'état onboarding)
final appRouterProvider = Provider<GoRouter>((ref) {
  final onboarding = ref.read(onboardingProvider);

  return GoRouter(
    initialLocation: onboarding.completed
        ? AppRoutes.home
        : AppRoutes.welcome,
    routes: [
      GoRoute(
        path: AppRoutes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.language,
        builder: (context, state) => const LanguageScreen(),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.library,
        builder: (context, state) => const LibraryScreen(),
      ),
      GoRoute(
        path: AppRoutes.favorites,
        builder: (context, state) => const FavoritesScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.duaDetail,
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return DuaDetailScreen(duaId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.sosStart,
        builder: (context, state) => const SosStartScreen(),
      ),
      GoRoute(
        path: AppRoutes.sosSession,
        builder: (context, state) => const SosSessionScreen(),
      ),
      GoRoute(
        path: AppRoutes.sosComplete,
        builder: (context, state) => const SosCompleteScreen(),
      ),
    ],
  );
});
