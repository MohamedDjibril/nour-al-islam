import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/routes/app_router.dart';
import '../providers/sos_provider.dart';

class SosStartScreen extends ConsumerWidget {
  const SosStartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        title: const Text('SOS – Besoin d\'aide'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(sosProvider.notifier).reset();
            context.go(AppRoutes.home);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Icon(
                Icons.shield_moon,
                size: 80,
                color: AppColors.gold,
              ),
              const SizedBox(height: 24),
              Text(
                'Bismillah, tu n\'es pas seul',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Choisis la durée de ta pause spirituelle. On va transformer cette pulsion en action utile.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.grey,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              _DurationCard(
                minutes: 2,
                title: 'Pause rapide',
                subtitle: 'Une respiration, un verset',
                icon: Icons.timer_outlined,
                onTap: () {
                  ref
                      .read(sosProvider.notifier)
                      .startSession(minutes: 2);
                  context.go(AppRoutes.sosSession);
                },
              ),
              const SizedBox(height: 16),
              _DurationCard(
                minutes: 5,
                title: 'Re-centrage',
                subtitle: 'Le temps de se poser',
                icon: Icons.self_improvement,
                onTap: () {
                  ref
                      .read(sosProvider.notifier)
                      .startSession(minutes: 5);
                  context.go(AppRoutes.sosSession);
                },
              ),
              const SizedBox(height: 16),
              _DurationCard(
                minutes: 10,
                title: 'Session profonde',
                subtitle: 'Méditation et réflexion',
                icon: Icons.nightlight_round,
                onTap: () {
                  ref
                      .read(sosProvider.notifier)
                      .startSession(minutes: 10);
                  context.go(AppRoutes.sosSession);
                },
              ),
              const Spacer(),
              Text(
                '« Allah est avec ceux qui sont endurants »',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: AppColors.gold,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DurationCard extends StatelessWidget {
  final int minutes;
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _DurationCard({
    required this.minutes,
    required this.title,
    required this.subtitle,
    required this.icon,
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
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.greyLight),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.gold.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.gold, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$minutes min – $title',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}