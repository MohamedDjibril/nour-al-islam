import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/theme/theme_extensions.dart';
import '../models/daily_stats.dart';

class WeeklyChart extends StatelessWidget {
  final List<DailyStats> stats;

  const WeeklyChart({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    if (stats.isEmpty) {
      return const SizedBox.shrink();
    }

    final maxY = 1.0;
    final barGroups = stats.asMap().entries.map((entry) {
      final index = entry.key;
      final stat = entry.value;
      final isToday = _isToday(stat.date);
      final value = stat.completionRate;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value * maxY,
            color: isToday ? AppColors.gold : AppColors.goldLight,
            width: 24,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(6),
            ),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: maxY,
              color: context.appBorder.withValues(alpha: 0.3),
            ),
          ),
        ],
      );
    }).toList();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.appSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: context.appBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.bar_chart, color: AppColors.gold, size: 20),
              const SizedBox(width: 8),
              Text(
                'Cette semaine',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Spacer(),
              Text(
                '${(stats.fold<double>(0, (s, e) => s + e.completionRate) / stats.length * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 180,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: maxY,
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => AppColors.gold,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final stat = stats[group.x];
                      return BarTooltipItem(
                        '${stat.dayLabel}\n'
                        '${(stat.completionRate * 100).toStringAsFixed(0)}%\n'
                        '${stat.habitsCompleted}/${stat.totalHabits}',
                        const TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() >= 0 &&
                            value.toInt() < stats.length) {
                          final stat = stats[value.toInt()];
                          final isToday = _isToday(stat.date);
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              stat.dayLabel,
                              style: TextStyle(
                                fontSize: 11,
                                color: isToday
                                    ? AppColors.gold
                                    : context.appTextSecondary,
                                fontWeight: isToday
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 0.25,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: context.appBorder.withValues(alpha: 0.3),
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: barGroups,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
