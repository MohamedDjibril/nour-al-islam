import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @appName.
  ///
  /// In fr, this message translates to:
  /// **'Nour al-Islam'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In fr, this message translates to:
  /// **'La lumière qui guide votre retour vers Allah'**
  String get appTagline;

  /// No description provided for @startButton.
  ///
  /// In fr, this message translates to:
  /// **'Commencer'**
  String get startButton;

  /// No description provided for @continueButton.
  ///
  /// In fr, this message translates to:
  /// **'Continuer'**
  String get continueButton;

  /// No description provided for @laterButton.
  ///
  /// In fr, this message translates to:
  /// **'Plus tard'**
  String get laterButton;

  /// No description provided for @finishButton.
  ///
  /// In fr, this message translates to:
  /// **'Terminer'**
  String get finishButton;

  /// No description provided for @welcomeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bismillah, bienvenue'**
  String get welcomeTitle;

  /// No description provided for @chooseLanguageTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bismillah, choisissez votre langue'**
  String get chooseLanguageTitle;

  /// No description provided for @languageFrench.
  ///
  /// In fr, this message translates to:
  /// **'Français'**
  String get languageFrench;

  /// No description provided for @languageEnglish.
  ///
  /// In fr, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageArabic.
  ///
  /// In fr, this message translates to:
  /// **'العربية'**
  String get languageArabic;

  /// No description provided for @notificationsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsHeadline.
  ///
  /// In fr, this message translates to:
  /// **'Restez connecté à votre foi'**
  String get notificationsHeadline;

  /// No description provided for @notificationsSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Recevez des rappels doux pour vos prières, dhikr et moments de réflexion.'**
  String get notificationsSubtitle;

  /// No description provided for @notificationsToggle.
  ///
  /// In fr, this message translates to:
  /// **'Activer les rappels'**
  String get notificationsToggle;

  /// No description provided for @homeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Nour al-Islam'**
  String get homeTitle;

  /// No description provided for @greeting.
  ///
  /// In fr, this message translates to:
  /// **'As-salam alaykoum'**
  String get greeting;

  /// No description provided for @quranCard.
  ///
  /// In fr, this message translates to:
  /// **'Quran'**
  String get quranCard;

  /// No description provided for @quranCardSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Lire un verset'**
  String get quranCardSubtitle;

  /// No description provided for @dhikrCard.
  ///
  /// In fr, this message translates to:
  /// **'Dhikr'**
  String get dhikrCard;

  /// No description provided for @dhikrCardSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Se souvenir d\'Allah'**
  String get dhikrCardSubtitle;

  /// No description provided for @duaCard.
  ///
  /// In fr, this message translates to:
  /// **'Dua'**
  String get duaCard;

  /// No description provided for @duaCardSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Invocations'**
  String get duaCardSubtitle;

  /// No description provided for @dailyHabits.
  ///
  /// In fr, this message translates to:
  /// **'Habitudes du jour'**
  String get dailyHabits;

  /// No description provided for @quickActions.
  ///
  /// In fr, this message translates to:
  /// **'Actions rapides'**
  String get quickActions;

  /// No description provided for @sosButton.
  ///
  /// In fr, this message translates to:
  /// **'SOS'**
  String get sosButton;

  /// No description provided for @sosButtonSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Besoin d\'aide ?'**
  String get sosButtonSubtitle;

  /// No description provided for @streakLabel.
  ///
  /// In fr, this message translates to:
  /// **'Série actuelle'**
  String get streakLabel;

  /// No description provided for @startToday.
  ///
  /// In fr, this message translates to:
  /// **'Commencez aujourd\'hui !'**
  String get startToday;

  /// No description provided for @keepGoing.
  ///
  /// In fr, this message translates to:
  /// **'Continuez, vous y êtes presque !'**
  String get keepGoing;

  /// No description provided for @habitQuran.
  ///
  /// In fr, this message translates to:
  /// **'Lecture du Coran'**
  String get habitQuran;

  /// No description provided for @habitDhikr.
  ///
  /// In fr, this message translates to:
  /// **'Dhikr'**
  String get habitDhikr;

  /// No description provided for @habitPrayers.
  ///
  /// In fr, this message translates to:
  /// **'Prières'**
  String get habitPrayers;

  /// No description provided for @trackerTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tracker'**
  String get trackerTitle;

  /// No description provided for @thisWeek.
  ///
  /// In fr, this message translates to:
  /// **'Cette semaine'**
  String get thisWeek;

  /// No description provided for @statistics.
  ///
  /// In fr, this message translates to:
  /// **'Statistiques'**
  String get statistics;

  /// No description provided for @average.
  ///
  /// In fr, this message translates to:
  /// **'Moyenne'**
  String get average;

  /// No description provided for @perfectDays.
  ///
  /// In fr, this message translates to:
  /// **'Jours parfaits'**
  String get perfectDays;

  /// No description provided for @sosSessions.
  ///
  /// In fr, this message translates to:
  /// **'Sessions SOS'**
  String get sosSessions;

  /// No description provided for @dailySummary.
  ///
  /// In fr, this message translates to:
  /// **'Récap du jour'**
  String get dailySummary;

  /// No description provided for @tabHome.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get tabHome;

  /// No description provided for @tabTracker.
  ///
  /// In fr, this message translates to:
  /// **'Tracker'**
  String get tabTracker;

  /// No description provided for @tabLibrary.
  ///
  /// In fr, this message translates to:
  /// **'Biblio'**
  String get tabLibrary;

  /// No description provided for @tabFavorites.
  ///
  /// In fr, this message translates to:
  /// **'Favoris'**
  String get tabFavorites;

  /// No description provided for @tabProfile.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get tabProfile;

  /// No description provided for @libraryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bibliothèque'**
  String get libraryTitle;

  /// No description provided for @duasTitle.
  ///
  /// In fr, this message translates to:
  /// **'Douas'**
  String get duasTitle;

  /// No description provided for @adhkarTitle.
  ///
  /// In fr, this message translates to:
  /// **'Adhkar'**
  String get adhkarTitle;

  /// No description provided for @hadithsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Hadiths'**
  String get hadithsTitle;

  /// No description provided for @favoritesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Favoris'**
  String get favoritesTitle;

  /// No description provided for @settingsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In fr, this message translates to:
  /// **'Langue'**
  String get settingsLanguage;

  /// No description provided for @settingsTheme.
  ///
  /// In fr, this message translates to:
  /// **'Thème'**
  String get settingsTheme;

  /// No description provided for @settingsNotifications.
  ///
  /// In fr, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsAbout.
  ///
  /// In fr, this message translates to:
  /// **'À propos'**
  String get settingsAbout;

  /// No description provided for @settingsPrivacy.
  ///
  /// In fr, this message translates to:
  /// **'Confidentialité'**
  String get settingsPrivacy;

  /// No description provided for @settingsDeleteData.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer mes données'**
  String get settingsDeleteData;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
