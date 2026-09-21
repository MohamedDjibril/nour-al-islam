import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/routes/app_router.dart';
import '../../tracker/providers/tracker_provider.dart';
import '../widgets/sos_button.dart';
import '../widgets/streak_card.dart';
import '../widgets/action_card.dart';
import '../widgets/habit_tile.dart';
import '../widgets/bottom_nav.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _navIndex = 0;

  void _onNavTap(int index) {
    setState(() => _navIndex = index);
    switch (index) {
      case 2:
        context.go(AppRoutes.library);
        break;
      case 3:
        context.go(AppRoutes.favorites);
        break;
      case 4:
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tracker = ref.watch(trackerProvider);
    final notifier = ref.read(trackerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        title: const Text('Nour al-Islam'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push(AppRoutes.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.gold,
          onRefresh: () async {
            notifier.resetForNewDay();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StreakCard(
                  streakDays: tracker.streakDays,
                  completedToday: tracker.completedToday,
                  totalHabits: tracker.habits.length,
                ),
                const SizedBox(height: 32),
                Center(
                  child: SosButton(
                    onPressed: () {
                      context.go(AppRoutes.sosStart);
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Actions rapides',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ActionCard(
                        icon: Icons.menu_book,
                        label: 'Quran',
                        subtitle: 'Lire un verset',
                        onTap: () => context.go(AppRoutes.library),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ActionCard(
                        icon: Icons.auto_awesome,
                        label: 'Dhikr',
                        subtitle: 'Se souvenir d\'Allah',
                        onTap: () => context.go(AppRoutes.library),
                        color: AppColors.green,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ActionCard(
                        icon: Icons.favorite,
                        label: 'Dua',
                        subtitle: 'Invocations',
                        onTap: () => context.go(AppRoutes.library),
                        color: AppColors.info,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  'Habitudes du jour',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                ...tracker.habits.map(
                  (habit) => HabitTile(
                    habit: habit,
                    onIncrement: () => notifier.incrementHabit(habit.id),
                    onDecrement: () => notifier.decrementHabit(habit.id),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _navIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
