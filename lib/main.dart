import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/theme/app_theme.dart';
import 'config/routes/app_router.dart';
import 'features/settings/providers/settings_provider.dart';

// ============================================
// INITIALISATION SUPABASE (arrière-plan, non-bloquant)
// ============================================
Future<void> _initSupabase() async {
  // Charge les variables d'environnement depuis le fichier .env
  await dotenv.load(fileName: '.env');

  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

  // Vérification de sécurité : s'assurer que les clés sont présentes
  if (supabaseUrl == null || supabaseAnonKey == null) {
    throw Exception(
      '❌ SUPABASE_URL ou SUPABASE_ANON_KEY manquant dans le fichier .env',
    );
  }

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
}

// ============================================
// POINT D'ENTRÉE
// ============================================
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

// ============================================
// APPLICATION
// ============================================
class NourAlIslamApp extends ConsumerWidget {
  const NourAlIslamApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return MaterialApp.router(
      title: 'Nour al-Islam',
      debugShowCheckedModeBanner: false,

      // Thème
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.themeMode,

      // Localisation
      locale: settings.locale,
      supportedLocales: const [
        Locale('fr'),
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // Router
      routerConfig: AppRouter.router,
    );
  }
}
