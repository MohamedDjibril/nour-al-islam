import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/theme/app_theme.dart';
import 'config/theme/app_colors.dart';

void main() {
  runApp(
    const ProviderScope(
      child: NourAlIslamApp(),
    ),
  );
}

class NourAlIslamApp extends StatelessWidget {
  const NourAlIslamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nour al-Islam',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.nightlight_round,
              size: 100,
              color: AppColors.gold,
            ),
            const SizedBox(height: 32),
            Text(
              'Nour al-Islam',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColors.gold,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            const Text(
              'نور الإسلام',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Amiri',
                color: AppColors.gold,
              ),
            ),
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Bismillah – On construit ensemble 🌙',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}