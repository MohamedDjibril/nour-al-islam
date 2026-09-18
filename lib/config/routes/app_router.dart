import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/onboarding/providers/onboarding_provider.dart';
import '../../features/onboarding/screens/welcome_screen.dart';
import '../../features/onboarding/screens/language_screen.dart';
import '../../features/onboarding/screens/notifications_screen.dart';
import '../../features/home/screens/home_screen.dart';

/// Clés de navigation
class AppRoutes {
  static const String welcome = '/welcome';
  static const String language = '/onboarding/language';
  static const String notifications = '/onboarding/notifications';
  static const String home = '/home';
}

/// Provider du routeur (dépend de l'état onboarding)
final appRouterProvider = Provider<GoRouter>((ref) {
  final onboarding = ref.watch(onboardingProvider);

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
    ],
  );
});