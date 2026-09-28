import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/theme/app_theme.dart';
import 'config/routes/app_router.dart';
import 'features/settings/providers/settings_provider.dart';

// ============================================
// CONFIGURATION SUPABASE
// ============================================
// Valeurs par défaut (utilisées si le .env n'est pas disponible,
// notamment sur Flutter Web)
const String _defaultSupabaseUrl =
    'https://wmwwwdoincpobavmuxji.supabase.co';
const String _defaultSupabaseAnonKey =
    'sb_publishable_kzxbmeZ-x7CMETC8sNrLg_A1WJMcvP';

// ============================================
// INITIALISATION SUPABASE (arrière-plan, non-bloquant)
// ============================================
Future<void> _initSupabase() async {
  String supabaseUrl = _defaultSupabaseUrl;
  String supabaseAnonKey = _defaultSupabaseAnonKey;

  // Essaie de charger le .env (fonctionne sur mobile/desktop)
  try {
    await dotenv.load(fileName: '.env');
    supabaseUrl = dotenv.env['SUPABASE_URL'] ?? _defaultSupabaseUrl;
    supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? _defaultSupabaseAnonKey;
  } catch (e) {
    // Sur Flutter Web, le .env n'est pas accessible → on utilise les valeurs par défaut
    debugPrint('⚠️ .env non chargé, utilisation des valeurs par défaut : $e');
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

  // ⚡ Initialiser Supabase en arrière-plan (ne bloque PAS le démarrage)
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
    final router = ref.watch(appRouterProvider);
    final settings = ref.watch(settingsProvider);

    return MaterialApp.router(
      title: 'Nour al-Islam',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.themeMode,
      locale: Locale(settings.language),
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