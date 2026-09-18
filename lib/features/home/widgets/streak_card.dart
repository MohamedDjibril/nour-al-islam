import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';

class StreakCard extends StatelessWidget {
  final int streakDays;
  final int completedToday;
  final int totalHabits;

  const StreakCard({
    super.key,
    required this.streakDays,
    required this.completedToday,
    required this.totalHabits,
  });

  @override
  Widget build(BuildContext context) {
    final progress = totalHabits > 0 ? completedToday / totalHabits : 0.0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.goldGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.gold.withValues(alpha: 0.2),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.local_fire_department,
                color: AppColors.white,
                size: 28,
              ),
              const SizedBox(width: 8),
              Text(
                '$streakDays jour${streakDays > 1 ? 's' : ''}',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '$completedToday / $totalHabits',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.white.withValues(alpha: 0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.white),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            progress >= 1.0
                ? 'MashAllah ! Toutes vos habitudes sont complétées.'
                : 'Continuez, vous y êtes presque !',
            style: TextStyle(
              color: AppColors.white.withValues(alpha: 0.95),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}