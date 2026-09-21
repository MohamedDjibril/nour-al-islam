import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/theme/theme_extensions.dart';
import '../../../config/routes/app_router.dart';
import '../providers/sos_provider.dart';

class SosCompleteScreen extends ConsumerWidget {
  const SosCompleteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verse = ref.watch(sosProvider).verse;

    return Scaffold(
      backgroundColor: context.appBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              // ===== Icône succès =====
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.success.withValues(alpha: 0.15),
                ),
                child: const Icon(
                  Icons.check_circle,
                  size: 90,
                  color: AppColors.success,
                ),
              ),
              const SizedBox(height: 32),

              // ===== Message =====
              Text(
                'MashAllah !',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Tu as transformé cette tentation en action spirituelle. Qu\'Allah te récompense.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // ===== Action concrète =====
              if (verse != null)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: AppColors.goldGradient,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gold.withValues(alpha: 0.3),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.lightbulb,
                        color: AppColors.white,
                        size: 32,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Action du moment',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        verse.action,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

              const Spacer(),

              // ===== Bouton retour =====
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(sosProvider.notifier).reset();
                    context.go(AppRoutes.home);
                  },
                  child: const Text('Retour à l\'accueil'),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  ref.read(sosProvider.notifier).loadNewVerse();
                  context.go(AppRoutes.sosSession);
                },
                child: const Text(
                  'Une autre session',
                  style: TextStyle(color: AppColors.gold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}