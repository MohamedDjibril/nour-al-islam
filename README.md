# 🌙 Nour al-Islam

> **La lumière qui guide votre retour vers Allah**

Application mobile musulmane **100 % gratuite**, **open source** et **sans publicité**, conçue pour transformer les tentations numériques en actions spirituelles bénéfiques.

[![Licence: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Flutter](https://img.shields.io/badge/Flutter-3.47-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.13-0175C2?logo=dart)](https://dart.dev)
[![Déployé](https://img.shields.io/badge/Déployé-GitHub%20Pages-success)](https://momokeith131-boop.github.io/nour-al-islam/)

---

## 🔗 Accès direct

**🌐 Application en ligne** : [momokeith131-boop.github.io/nour-al-islam](https://momokeith131-boop.github.io/nour-al-islam/)

**📱 Installable** : ajoutez-la à votre écran d'accueil pour un effet "vraie app"

---

## 📖 Français

### 🎯 Vision

**Nour al-Islam** aide les croyants à :
- 🚨 **Résister aux tentations** (contenus haram, scroll compulsif)
- 📖 **Se reconnecter spirituellement** en cas de pulsion
- 📿 **Construire des habitudes** quotidiennes bénéfiques
- ❤️ **S'entourer** de contenus spirituels authentiques

### ✨ Fonctionnalités

| Module | Contenu |
|--------|---------|
| 🚨 **SOS** | 30 versets par thème + timer |
| 📚 **Bibliothèque** | 20 duas + 15 adhkar + 10 hadiths authentiques |
| 📿 **Compteur** | Dhikr interactif avec vibration |
| 📊 **Tracker** | Statistiques, graphique hebdomadaire, séries |
| ❤️ **Favoris** | Sauvegardez vos contenus préférés |
| ⚙️ **Paramètres** | Thème clair/sombre/système, langue, données |
| 🌙 **Thème sombre** | Design élégant dans les 2 modes |

### 🎨 Design

- **Palette** : Or (#C9A84C), Vert profond (#1B5E20), Bleu nuit (#0D1B2A)
- **Typographie** : Poppins (interface), Amiri (arabe)
- **Material 3** avec animations fluides

### 🛠️ Stack technique

- **Flutter 3.47** + **Dart 3.13**
- **Riverpod** (gestion d'état)
- **GoRouter** (navigation)
- **SharedPreferences** (persistance locale)
- **fl_chart** (graphiques)
- **Google Fonts** + polices locales

### 💾 Confidentialité

- ✅ **Données locales** par défaut (aucun serveur)
- ✅ **Aucun tracking**, aucune publicité
- ✅ **Code open source** (vérifiable)
- ✅ **Suppression** complète en 1 clic

### 🚀 Installation (développeurs)

```bash
git clone https://github.com/momokeith131-boop/nour-al-islam.git
cd nour-al-islam
flutter pub get
flutter run -d chrome
flutter build web --release --base-href "/nour-al-islam/"