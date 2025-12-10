# Firebase Remote Config 仕様

## 概要
Firebase Remote Configを使用してアプリの設定をリモートで管理します。

## 実装済み機能

### 1. バージョン管理
- 最低動作バージョン（minimum_version）
- 推奨動作バージョン（recommended_version）

### 2. メンテナンスモード
- メンテナンス中フラグ（is_maintenance）

### 3. アプリストアURL
- iOSアプリURL（ios_app_url）
- AndroidアプリURL（android_app_url）

## 使用方法

### サービスの取得
```dart
final remoteConfigService = ref.watch(remoteConfigServiceProvider);
```

### 設定値の取得
```dart
final minimumVersion = remoteConfigService.minimumVersion;
final isMaintenance = remoteConfigService.isMaintenance;
final iosAppUrl = remoteConfigService.iosAppUrl;
```

### 設定の再取得
```dart
await remoteConfigService.fetchAndActivate();
```

## バージョンチェック

### バージョンチェックサービスの使用
```dart
final versionCheckService = ref.watch(versionCheckServiceProvider);
final status = versionCheckService.checkVersion(AppConstants.appVersion);

switch (status) {
  case VersionStatus.upToDate:
    // 最新バージョン
    break;
  case VersionStatus.updateRecommended:
    // アップデート推奨
    break;
  case VersionStatus.updateRequired:
    // アップデート必須
    break;
  case VersionStatus.maintenance:
    // メンテナンス中
    break;
}
```

## Remote Configのデフォルト値

```dart
{
  'minimum_version': '1.0.0',
  'recommended_version': '1.0.0',
  'is_maintenance': false,
  'ios_app_url': '',
  'android_app_url': '',
}
```

## ファイル構成
- `lib/core/services/remote_config_service.dart`: Remote Configサービスの実装
- `lib/core/services/version_check_service.dart`: バージョンチェックサービスの実装
- `lib/core/di/providers.dart`: Riverpodプロバイダーの定義

## 注意事項
- Firebase Consoleで各パラメータを設定してください
- フェッチ間隔は1時間に設定されています
- デバッグ時はより短い間隔に設定することを推奨します



