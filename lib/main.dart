import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/theme/app_theme.dart';
import 'config/routes/app_router.dart';
import 'features/settings/providers/settings_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: NourAlIslamApp(),
    ),
  );
}

class NourAlIslamApp extends ConsumerWidget {
  const NourAlIslamApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final settings = ref.watch(settingsProvider);

    return MaterialApp.router(
      title: 'Nour al-Islam',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.themeMode,
      routerConfig: router,
    );
  }
}
