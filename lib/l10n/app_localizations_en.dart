// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'App Template';

  @override
  String get settings => 'Settings';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get language => 'Language';

  @override
  String get subscription => 'Subscription';

  @override
  String get restorePurchases => 'Restore Purchases';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get maintenance => 'Under Maintenance';

  @override
  String get maintenanceMessage =>
      'The app is currently under maintenance. Please try again later.';

  @override
  String get updateRequired => 'Update Required';

  @override
  String get updateRequiredMessage =>
      'Please update to the latest version to continue using the app.';

  @override
  String get updateRecommended => 'Update Recommended';

  @override
  String get updateRecommendedMessage =>
      'A new version is available. We recommend updating for the best experience.';

  @override
  String get update => 'Update';
}
