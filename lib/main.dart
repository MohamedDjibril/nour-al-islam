import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC9A84C),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC9A84C),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
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
              size: 80,
              color: Color(0xFFC9A84C),
            ),
            const SizedBox(height: 24),
            Text(
              'Nour al-Islam',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFC9A84C),
                  ),
            ),
            const SizedBox(height: 8),
            const Text(
              'نور الإسلام',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            Text(
              'Bismillah – On construit ensemble 🌙',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
