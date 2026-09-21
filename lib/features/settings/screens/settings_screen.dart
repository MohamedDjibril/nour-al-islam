import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/theme/app_colors.dart';
import '../providers/settings_provider.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        title: const Text('Paramètres'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ===== APPARENCE =====
              SettingsSection(
                title: 'Apparence',
                children: [
                  _ThemeSelector(
                    current: settings.themeMode,
                    onChanged: (mode) => notifier.setTheme(mode),
                  ),
                ],
              ),

              // ===== LANGUE =====
              SettingsSection(
                title: 'Langue',
                children: [
                  _LanguageSelector(
                    current: settings.language,
                    onChanged: (lang) => notifier.setLanguage(lang),
                  ),
                ],
              ),

              // ===== NOTIFICATIONS =====
              SettingsSection(
                title: 'Notifications',
                children: [
                  SettingsTile(
                    icon: Icons.notifications_active,
                    title: 'Rappels quotidiens',
                    subtitle: settings.notificationsEnabled
                        ? 'Activés'
                        : 'Désactivés',
                    trailing: Switch(
                      value: settings.notificationsEnabled,
                      activeThumbColor: AppColors.gold,
                      onChanged: (value) =>
                          notifier.setNotifications(value),
                    ),
                  ),
                ],
              ),

              // ===== DONNÉES =====
              SettingsSection(
                title: 'Données',
                children: [
                  SettingsTile(
                    icon: Icons.visibility,
                    title: 'Voir les données sauvegardées',
                    subtitle: 'Favoris, habitudes, préférences',
                    onTap: () => _showDataDialog(context),
                  ),
                  SettingsTile(
                    icon: Icons.delete_outline,
                    title: 'Supprimer toutes mes données',
                    subtitle: 'Action irréversible',
                    isDangerous: true,
                    onTap: () => _confirmReset(context, ref),
                  ),
                ],
              ),

              // ===== À PROPOS =====
              SettingsSection(
                title: 'À propos',
                children: [
                  const SettingsTile(
                    icon: Icons.info_outline,
                    title: 'Version',
                    subtitle: '1.0.0',
                  ),
                  SettingsTile(
                    icon: Icons.code,
                    title: 'Code source',
                    subtitle: 'GitHub - momokeith131-boop/nour-al-islam',
                    onTap: () => _openGithub(context),
                  ),
                  const SettingsTile(
                    icon: Icons.verified_user,
                    title: 'Licence',
                    subtitle: 'GPL-3.0',
                  ),
                ],
              ),

              // ===== SIGNATURE =====
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    const Icon(
                      Icons.nightlight_round,
                      size: 40,
                      color: AppColors.gold,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Nour al-Islam',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.gold,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Bismillah – 2026',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openGithub(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('github.com/momokeith131-boop/nour-al-islam'),
        backgroundColor: AppColors.gold,
      ),
    );
  }

  void _showDataDialog(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().toList();

    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Données sauvegardées'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${keys.length} clés :'),
              const SizedBox(height: 12),
              ...keys.map((k) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '• $k',
                      style: const TextStyle(fontSize: 12),
                    ),
                  )),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  void _confirmReset(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Supprimer toutes les données ?'),
        content: const Text(
          'Cette action supprimera définitivement :\n\n'
          '• Vos favoris\n'
          '• Vos habitudes\n'
          '• Vos préférences\n'
          '• Votre progression\n\n'
          'Cette action est irréversible.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () async {
              await ref.read(settingsProvider.notifier).clearAllData();
              if (dialogContext.mounted) {
                Navigator.of(dialogContext).pop();
                ScaffoldMessenger.of(dialogContext).showSnackBar(
                  const SnackBar(
                    content: Text('Toutes les données ont été supprimées'),
                    backgroundColor: AppColors.success,
                  ),
                );
              }
            },
            child: const Text(
              'Supprimer',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }
}

// ========== THEME SELECTOR ==========
class _ThemeSelector extends StatelessWidget {
  final ThemeMode current;
  final ValueChanged<ThemeMode> onChanged;

  const _ThemeSelector({
    required this.current,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _ThemeOption(
              icon: Icons.brightness_auto,
              label: 'Système',
              selected: current == ThemeMode.system,
              onTap: () => onChanged(ThemeMode.system),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _ThemeOption(
              icon: Icons.light_mode,
              label: 'Clair',
              selected: current == ThemeMode.light,
              onTap: () => onChanged(ThemeMode.light),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _ThemeOption(
              icon: Icons.dark_mode,
              label: 'Sombre',
              selected: current == ThemeMode.dark,
              onTap: () => onChanged(ThemeMode.dark),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.gold.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.gold : AppColors.greyLight,
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: selected ? AppColors.gold : AppColors.grey,
              size: 24,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                color: selected ? AppColors.gold : AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ========== LANGUAGE SELECTOR ==========
class _LanguageSelector extends StatelessWidget {
  final String current;
  final ValueChanged<String> onChanged;

  const _LanguageSelector({
    required this.current,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _LanguageTile(
          flag: '🇫🇷',
          name: 'Français',
          code: 'fr',
          selected: current == 'fr',
          onTap: () => onChanged('fr'),
        ),
        const Divider(height: 1, indent: 60, color: AppColors.greyLight),
        _LanguageTile(
          flag: '🇬🇧',
          name: 'English',
          code: 'en',
          selected: current == 'en',
          onTap: () => onChanged('en'),
        ),
        const Divider(height: 1, indent: 60, color: AppColors.greyLight),
        _LanguageTile(
          flag: '🇸🇦',
          name: 'العربية',
          code: 'ar',
          selected: current == 'ar',
          onTap: () => onChanged('ar'),
        ),
      ],
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 16),
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
