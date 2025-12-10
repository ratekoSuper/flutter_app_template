# Firebase App Check 仕様

## 概要
Firebase App Checkを使用してアプリの正当性を検証し、不正なアクセスを防ぎます。

## 実装済み機能

### 1. App Checkの有効化
- アプリ起動時に自動的にApp Checkを有効化
- デバッグモードとプロダクションモードの両方に対応

### 2. トークンの取得
- App Checkトークンを取得可能
- 強制リフレッシュのオプションあり

## 使用方法

### サービスの取得
```dart
final appCheckService = ref.watch(firebaseAppCheckServiceProvider);
```

### App Checkの有効化（main.dartで自動実行）
```dart
await appCheckService.activate();
```

### トークンの取得
```dart
final token = await appCheckService.getToken(forceRefresh: true);
```

## ファイル構成
- `lib/core/services/firebase_app_check_service.dart`: App Checkサービスの実装
- `lib/core/di/providers.dart`: Riverpodプロバイダーの定義

## 注意事項
- 現在はデバッグモードで設定されています
- プロダクション環境では以下に変更してください:
  - iOS: `AppleProvider.appAttest` または `AppleProvider.deviceCheck`
  - Android: `AndroidProvider.playIntegrity`
- Firebase Consoleでプロジェクトを設定する必要があります



