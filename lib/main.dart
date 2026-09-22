import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/theme/app_theme.dart';
import 'config/routes/app_router.dart';
import 'features/settings/providers/settings_provider.dart';

/// Initialisation Supabase en arrière-plan (non-bloquant)
Future<void> _initSupabase() async {
  await Supabase.initialize(
    url: 'https://wmwwwdoincpobavmuxji.supabase.co',
    anonKey: 'sb_publishable_kzxbmeZ-x7CMETC8sNrrLg_A1WJMcvP',
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ⚡ Initialiser Supabase EN ARRIÈRE-PLAN (ne bloque PAS le démarrage)
  // L'app démarre immédiatement, Supabase se connecte en parallèle
  _initSupabase();

  // L'app démarre IMMÉDIATEMENT (sans attendre Supabase)
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
