import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';
import '../../tracker/models/habit.dart';

class HabitTile extends StatelessWidget {
  final Habit habit;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const HabitTile({
    super.key,
    required this.habit,
    required this.onIncrement,
    required this.onDecrement,
  });

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'quran':
        return Icons.menu_book;
      case 'dhikr':
        return Icons.auto_awesome;
      case 'prayer':
        return Icons.mosque;
      case 'dua':
        return Icons.favorite;
      default:
        return Icons.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCompleted = habit.isCompleted;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCompleted ? AppColors.success : AppColors.greyLight,
          width: isCompleted ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isCompleted
                  ? AppColors.success.withValues(alpha: 0.15)
                  : AppColors.gold.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getIcon(habit.iconName),
              color: isCompleted ? AppColors.success : AppColors.gold,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  habit.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${habit.current} / ${habit.target}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          if (habit.target > 1) ...[
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              color: AppColors.grey,
              onPressed: habit.current > 0 ? onDecrement : null,
            ),
            IconButton(
              icon: const Icon(Icons.add_circle),
              color: isCompleted ? AppColors.success : AppColors.gold,
              onPressed: isCompleted ? null : onIncrement,
            ),
          ] else ...[
            IconButton(
              icon: Icon(
                isCompleted
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
              ),
              color: isCompleted ? AppColors.success : AppColors.gold,
              iconSize: 32,
              onPressed: isCompleted ? onDecrement : onIncrement,
            ),
          ],
        ],
      ),
    );
  }
}