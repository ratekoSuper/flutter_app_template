// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '앱 템플릿';

  @override
  String get settings => '설정';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get termsOfService => '서비스 약관';

  @override
  String get language => '언어';

  @override
  String get subscription => '구독';

  @override
  String get restorePurchases => '구매 복원';

  @override
  String get ok => '확인';

  @override
  String get cancel => '취소';

  @override
  String get maintenance => '점검 중';

  @override
  String get maintenanceMessage => '앱이 현재 점검 중입니다. 나중에 다시 시도해주세요.';

  @override
  String get updateRequired => '업데이트 필요';

  @override
  String get updateRequiredMessage => '앱을 계속 사용하려면 최신 버전으로 업데이트하세요.';

  @override
  String get updateRecommended => '업데이트 권장';

  @override
  String get updateRecommendedMessage =>
      '새 버전을 사용할 수 있습니다. 최상의 경험을 위해 업데이트를 권장합니다.';

  @override
  String get update => '업데이트';
}
