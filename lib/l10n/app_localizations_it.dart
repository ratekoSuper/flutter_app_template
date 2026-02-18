// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Modello App';

  @override
  String get settings => 'Impostazioni';

  @override
  String get privacyPolicy => 'Informativa sulla Privacy';

  @override
  String get termsOfService => 'Termini di Servizio';

  @override
  String get language => 'Lingua';

  @override
  String get subscription => 'Abbonamento';

  @override
  String get restorePurchases => 'Ripristina Acquisti';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Annulla';

  @override
  String get maintenance => 'In Manutenzione';

  @override
  String get maintenanceMessage =>
      'L\'app è attualmente in manutenzione. Riprova più tardi.';

  @override
  String get updateRequired => 'Aggiornamento Richiesto';

  @override
  String get updateRequiredMessage =>
      'Aggiorna all\'ultima versione per continuare a utilizzare l\'app.';

  @override
  String get updateRecommended => 'Aggiornamento Consigliato';

  @override
  String get updateRecommendedMessage =>
      'È disponibile una nuova versione. Consigliamo di aggiornare per la migliore esperienza.';

  @override
  String get update => 'Aggiorna';
}
