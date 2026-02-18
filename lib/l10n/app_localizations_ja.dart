// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'アプリテンプレート';

  @override
  String get settings => '設定';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get termsOfService => '利用規約';

  @override
  String get language => '言語';

  @override
  String get subscription => 'サブスクリプション';

  @override
  String get restorePurchases => '購入を復元';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'キャンセル';

  @override
  String get maintenance => 'メンテナンス中';

  @override
  String get maintenanceMessage => '現在メンテナンス中です。しばらくしてからもう一度お試しください。';

  @override
  String get updateRequired => 'アップデートが必要です';

  @override
  String get updateRequiredMessage => 'アプリを引き続き使用するには、最新バージョンにアップデートしてください。';

  @override
  String get updateRecommended => 'アップデートをおすすめします';

  @override
  String get updateRecommendedMessage =>
      '新しいバージョンが利用可能です。最高のエクスペリエンスのためにアップデートすることをおすすめします。';

  @override
  String get update => 'アップデート';
}
