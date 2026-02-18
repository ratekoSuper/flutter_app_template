// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Plantilla de Aplicación';

  @override
  String get settings => 'Configuración';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get termsOfService => 'Términos de Servicio';

  @override
  String get language => 'Idioma';

  @override
  String get subscription => 'Suscripción';

  @override
  String get restorePurchases => 'Restaurar Compras';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancelar';

  @override
  String get maintenance => 'En Mantenimiento';

  @override
  String get maintenanceMessage =>
      'La aplicación está actualmente en mantenimiento. Por favor, inténtelo de nuevo más tarde.';

  @override
  String get updateRequired => 'Actualización Requerida';

  @override
  String get updateRequiredMessage =>
      'Por favor, actualice a la última versión para continuar usando la aplicación.';

  @override
  String get updateRecommended => 'Actualización Recomendada';

  @override
  String get updateRecommendedMessage =>
      'Una nueva versión está disponible. Recomendamos actualizar para la mejor experiencia.';

  @override
  String get update => 'Actualizar';
}
