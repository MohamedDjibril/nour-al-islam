import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  _initSupabase();

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

    // Convertir la langue sauvegardée (String) en Locale
    final Locale currentLocale = Locale(settings.language);

    return MaterialApp.router(
      title: 'Nour al-Islam',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.themeMode,

      // 🌍 Configuration de la traduction
      locale: currentLocale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      routerConfig: router,
    );
  }
}
