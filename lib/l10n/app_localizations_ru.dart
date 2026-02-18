// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Шаблон Приложения';

  @override
  String get settings => 'Настройки';

  @override
  String get privacyPolicy => 'Политика Конфиденциальности';

  @override
  String get termsOfService => 'Условия Использования';

  @override
  String get language => 'Язык';

  @override
  String get subscription => 'Подписка';

  @override
  String get restorePurchases => 'Восстановить Покупки';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Отмена';

  @override
  String get maintenance => 'На Обслуживании';

  @override
  String get maintenanceMessage =>
      'Приложение находится на обслуживании. Пожалуйста, попробуйте позже.';

  @override
  String get updateRequired => 'Требуется Обновление';

  @override
  String get updateRequiredMessage =>
      'Пожалуйста, обновите до последней версии, чтобы продолжить использование приложения.';

  @override
  String get updateRecommended => 'Рекомендуется Обновление';

  @override
  String get updateRecommendedMessage =>
      'Доступна новая версия. Мы рекомендуем обновить для лучшего опыта.';

  @override
  String get update => 'Обновить';
}
