/// Modèle d'état de l'onboarding
class OnboardingState {
  final String? language;
  final bool notificationsEnabled;
  final bool completed;

  const OnboardingState({
    this.language,
    this.notificationsEnabled = false,
    this.completed = false,
  });

  OnboardingState copyWith({
    String? language,
    bool? notificationsEnabled,
    bool? completed,
  }) {
    return OnboardingState(
      language: language ?? this.language,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      completed: completed ?? this.completed,
    );
  }

  bool get isLanguageSelected => language != null;
}