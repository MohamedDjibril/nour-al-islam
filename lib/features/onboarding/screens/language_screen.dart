import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/routes/app_router.dart';
import '../providers/onboarding_provider.dart';

class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choisir la langue'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.welcome),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text(
                'Bismillah, choisissez votre langue',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              _LanguageTile(
                flag: '🇫🇷',
                name: 'Français',
                code: 'fr',
                selected: state.language == 'fr',
                onTap: () => ref
                    .read(onboardingProvider.notifier)
                    .setLanguage('fr'),
              ),
              const SizedBox(height: 16),
              _LanguageTile(
                flag: '🇬🇧',
                name: 'English',
                code: 'en',
                selected: state.language == 'en',
                onTap: () => ref
                    .read(onboardingProvider.notifier)
                    .setLanguage('en'),
              ),
              const SizedBox(height: 16),
              _LanguageTile(
                flag: '🇸🇦',
                name: 'العربية',
                code: 'ar',
                selected: state.language == 'ar',
                onTap: () => ref
                    .read(onboardingProvider.notifier)
                    .setLanguage('ar'),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: state.isLanguageSelected
                      ? () => context.go(AppRoutes.notifications)
                      : null,
                  child: const Text('Continuer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final String flag;
  final String name;
  final String code;
  final bool selected;
  final VoidCallback onTap;

  const _LanguageTile({
    required this.flag,
    required this.name,
    required this.code,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selected ? AppColors.goldLight : AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.gold : AppColors.greyLight,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 32)),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            if (selected)
              const Icon(Icons.check_circle, color: AppColors.gold),
          ],
        ),
      ),
    );
  }
}