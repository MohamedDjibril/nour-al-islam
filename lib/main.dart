import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/theme/app_theme.dart';
import 'config/routes/app_router.dart';
import 'features/settings/providers/settings_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialiser Supabase avec les clés
  // ⚠️ La clé "publishable" est PUBLIQUE, conçue pour être dans le code client.
  // La sécurité réelle vient des Row Level Security (RLS) côté Supabase.
  await Supabase.initialize(
    url: 'https://wmwwwdoincpobavmuxji.supabase.co',
    anonKey: 'sb_publishable_kzxbmeZ-x7CMETC8sNrrLg_A1WJMcvP',
  );

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
