# Firebase Analytics 仕様

## 概要
Firebase Analyticsを使用してアプリの利用状況を追跡します。

## 実装済み機能

### 1. アプリ起動の追跡
- アプリ起動時に自動的にイベントを送信
- 新規ユーザーと既存ユーザーを区別

### 2. 画面閲覧の追跡
- 各画面の閲覧回数を記録
- 画面名とクラス名を記録

### 3. カスタムイベントの追跡
- 任意のイベントをパラメータ付きで記録可能

## 使用方法

### サービスの取得
```dart
final analyticsService = ref.watch(firebaseAnalyticsServiceProvider);
```

### 画面閲覧の記録
```dart
await analyticsService.logScreenView(
  screenName: 'settings',
  screenClass: 'SettingsPage',
);
```

### カスタムイベントの記録
```dart
await analyticsService.logEvent(
  name: 'button_clicked',
  parameters: {
    'button_name': 'subscribe',
  },
);
```

## ファイル構成
- `lib/core/services/firebase_analytics_service.dart`: Analyticsサービスの実装
- `lib/core/di/providers.dart`: Riverpodプロバイダーの定義

## 注意事項
- Firebase Consoleでプロジェクトを設定する必要があります
- iOSとAndroidそれぞれで設定ファイルが必要です
  - iOS: `ios/Runner/GoogleService-Info.plist`
  - Android: `android/app/google-services.json`




