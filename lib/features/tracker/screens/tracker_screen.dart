import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/theme/theme_extensions.dart';
import '../providers/tracker_provider.dart';
import '../widgets/weekly_chart.dart';

class TrackerScreen extends ConsumerWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trackerProvider);

    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        title: const Text('Tracker'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ===== Carte de série (streak) =====
              _StreakHeroCard(streakDays: state.streakDays),
              const SizedBox(height: 20),

              // ===== Graphique hebdomadaire =====
              WeeklyChart(stats: state.weeklyStats),
              const SizedBox(height: 20),

              // ===== Statistiques rapides =====
              _StatsGrid(
                weeklyAverage: (state.weeklyAverage * 100).toStringAsFixed(0),
                perfectDays: state.perfectDaysThisWeek,
                sosSessions: state.totalSosSessions,
                totalHabits: state.habits.length,
              ),
              const SizedBox(height: 20),

              // ===== Habitudes du jour (récap) =====
              Text(
                'Récap du jour',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              ...state.habits.map((habit) => _HabitRow(
                    name: habit.name,
                    current: habit.current,
                    target: habit.target,
                    isCompleted: habit.isCompleted,
                  )),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

// ========== CARTE DE SÉRIE (HERO) ==========
class _StreakHeroCard extends StatelessWidget {
  final int streakDays;

  const _StreakHeroCard({required this.streakDays});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.goldGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.gold.withValues(alpha: 0.3),
            blurRadius: 20,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.local_fire_department,
              color: AppColors.white,
              size: 48,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$streakDays jour${streakDays > 1 ? 's' : ''}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Série actuelle',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  streakDays == 0
                      ? 'Commencez aujourd\'hui !'
                      : 'Continuez comme ça, MashAllah !',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.white.withValues(alpha: 0.95),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ========== GRILLE DE STATS ==========
class _StatsGrid extends StatelessWidget {
  final String weeklyAverage;
  final int perfectDays;
  final int sosSessions;
  final int totalHabits;

  const _StatsGrid({
    required this.weeklyAverage,
    required this.perfectDays,
    required this.sosSessions,
    required this.totalHabits,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistiques',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.trending_up,
                label: 'Moyenne',
                value: '$weeklyAverage%',
                color: AppColors.gold,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.star,
                label: 'Jours parfaits',
                value: '$perfectDays',
                color: AppColors.success,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.shield_moon,
                label: 'Sessions SOS',
                value: '$sosSessions',
                color: AppColors.info,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.track_changes,
                label: 'Habitudes',
                value: '$totalHabits',
                color: AppColors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.appSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.appBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

// ========== LIGNE D'HABITUDE ==========
class _HabitRow extends StatelessWidget {
  final String name;
  final int current;
  final int target;
  final bool isCompleted;

  const _HabitRow({
    required this.name,
    required this.current,
    required this.target,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: context.appSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCompleted ? AppColors.success : context.appBorder,
          width: isCompleted ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isCompleted
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            color: isCompleted ? AppColors.success : context.appTextSecondary,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Text(
            '$current / $target',
            style: TextStyle(
              color: isCompleted ? AppColors.success : context.appTextSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
