// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Modèle d\'Application';

  @override
  String get settings => 'Paramètres';

  @override
  String get privacyPolicy => 'Politique de Confidentialité';

  @override
  String get termsOfService => 'Conditions d\'Utilisation';

  @override
  String get language => 'Langue';

  @override
  String get subscription => 'Abonnement';

  @override
  String get restorePurchases => 'Restaurer les Achats';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Annuler';

  @override
  String get maintenance => 'En Maintenance';

  @override
  String get maintenanceMessage =>
      'L\'application est actuellement en maintenance. Veuillez réessayer plus tard.';

  @override
  String get updateRequired => 'Mise à Jour Requise';

  @override
  String get updateRequiredMessage =>
      'Veuillez mettre à jour vers la dernière version pour continuer à utiliser l\'application.';

  @override
  String get updateRecommended => 'Mise à Jour Recommandée';

  @override
  String get updateRecommendedMessage =>
      'Une nouvelle version est disponible. Nous recommandons de mettre à jour pour une meilleure expérience.';

  @override
  String get update => 'Mettre à Jour';
}
