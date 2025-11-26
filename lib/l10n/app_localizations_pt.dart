// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Modelo de Aplicativo';

  @override
  String get settings => 'Configurações';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get termsOfService => 'Termos de Serviço';

  @override
  String get language => 'Idioma';

  @override
  String get subscription => 'Assinatura';

  @override
  String get restorePurchases => 'Restaurar Compras';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancelar';

  @override
  String get maintenance => 'Em Manutenção';

  @override
  String get maintenanceMessage =>
      'O aplicativo está atualmente em manutenção. Por favor, tente novamente mais tarde.';

  @override
  String get updateRequired => 'Atualização Necessária';

  @override
  String get updateRequiredMessage =>
      'Por favor, atualize para a versão mais recente para continuar usando o aplicativo.';

  @override
  String get updateRecommended => 'Atualização Recomendada';

  @override
  String get updateRecommendedMessage =>
      'Uma nova versão está disponível. Recomendamos atualizar para a melhor experiência.';

  @override
  String get update => 'Atualizar';
}
