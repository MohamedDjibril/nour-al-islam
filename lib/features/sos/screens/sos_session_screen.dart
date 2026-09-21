import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/theme/theme_extensions.dart';
import '../../../config/routes/app_router.dart';
import '../providers/sos_provider.dart';

class SosSessionScreen extends ConsumerStatefulWidget {
  const SosSessionScreen({super.key});

  @override
  ConsumerState<SosSessionScreen> createState() => _SosSessionScreenState();
}

class _SosSessionScreenState extends ConsumerState<SosSessionScreen> {
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _showReflection = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startTimer());
  }

  void _startTimer() {
    final state = ref.read(sosProvider);
    if (state.durationMinutes == null) {
      context.go(AppRoutes.sosStart);
      return;
    }
    _remainingSeconds = state.durationMinutes! * 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 0) {
        timer.cancel();
        _onTimerComplete();
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  void _onTimerComplete() {
    ref.read(sosProvider.notifier).completeSession();
    context.go(AppRoutes.sosComplete);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sosProvider);
    final verse = state.verse;

    if (verse == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        title: const Text('Session en cours'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            _timer?.cancel();
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
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.goldGradient,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gold.withValues(alpha: 0.3),
                      blurRadius: 20,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _formatTime(_remainingSeconds),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: context.appSurface,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: AppColors.goldLight, width: 2),
                        ),
                        child: Column(
                          children: [
                            Text(
                              verse.textAr,
                              style: const TextStyle(
                                fontSize: 22,
                                fontFamily: 'Amiri',
                                color: AppColors.gold,
                                height: 1.8,
                              ),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            ),
                            const SizedBox(height: 20),
                            const Divider(color: AppColors.goldLight),
                            const SizedBox(height: 20),
                            Text(
                              verse.textFr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(height: 1.6),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              verse.reference,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.gold,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (!_showReflection)
                        TextButton.icon(
                          onPressed: () =>
                              setState(() => _showReflection = true),
                          icon: const Icon(Icons.psychology,
                              color: AppColors.gold),
                          label: const Text(
                            'Afficher la réflexion',
                            style: TextStyle(color: AppColors.gold),
                          ),
                        )
                      else
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.goldLight.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.psychology,
                                  color: AppColors.gold, size: 32),
                              const SizedBox(height: 12),
                              Text(
                                verse.reflection,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontStyle: FontStyle.italic,
                                      height: 1.6,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _timer?.cancel();
                    _onTimerComplete();
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('J\'ai terminé'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
