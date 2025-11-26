// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'App-Vorlage';

  @override
  String get settings => 'Einstellungen';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get language => 'Sprache';

  @override
  String get subscription => 'Abonnement';

  @override
  String get restorePurchases => 'Käufe Wiederherstellen';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get maintenance => 'Wartung';

  @override
  String get maintenanceMessage =>
      'Die App befindet sich derzeit in Wartung. Bitte versuchen Sie es später erneut.';

  @override
  String get updateRequired => 'Aktualisierung Erforderlich';

  @override
  String get updateRequiredMessage =>
      'Bitte aktualisieren Sie auf die neueste Version, um die App weiterhin zu nutzen.';

  @override
  String get updateRecommended => 'Aktualisierung Empfohlen';

  @override
  String get updateRecommendedMessage =>
      'Eine neue Version ist verfügbar. Wir empfehlen eine Aktualisierung für die beste Erfahrung.';

  @override
  String get update => 'Aktualisieren';
}
