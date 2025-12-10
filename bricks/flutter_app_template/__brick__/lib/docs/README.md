# {{app_name}} ドキュメント

## 概要
このディレクトリには、{{app_name}}の各機能の仕様ドキュメントが含まれています。

## ドキュメント一覧

### アーキテクチャ
- [アーキテクチャ仕様](architecture.md): オニオンアーキテクチャの説明

### Firebase関連
- [Firebase Analytics](firebase_analytics.md): アナリティクス機能の仕様
- [Firebase App Check](firebase_app_check.md): App Check機能の仕様
- [Firebase Remote Config](remote_config.md): Remote Config機能の仕様

### 機能
{{#enable_subscription}}
- [サブスクリプション](subscription.md): サブスクリプション機能の仕様
{{/enable_subscription}}
- [多言語対応](localization.md): 12言語対応の仕様

### デザイン
- [デザインカスタマイズ](design.md): テーマカラー、アイコン、レイアウトの仕様

## プロジェクト構成

```
lib/
├── core/                   # 共通機能
│   ├── di/                # 依存性注入
│   ├── services/          # 共通サービス
│   └── constants/         # 定数定義
├── domain/                # ドメイン層
│   ├── entities/          # エンティティ
│   ├── repositories/      # リポジトリインターフェース
│   └── usecases/          # ユースケース
├── data/                  # データ層
│   ├── datasources/       # データソース
│   │   ├── local/        # ローカルストレージ
│   │   └── remote/       # API通信
│   ├── models/           # データモデル
│   └── repositories/      # リポジトリ実装
├── presentation/          # プレゼンテーション層
│   ├── pages/            # 画面
│   ├── providers/        # 状態管理
│   └── widgets/          # 再利用可能なウィジェット
├── docs/                 # ドキュメント（このディレクトリ）
└── main.dart             # エントリーポイント
```

## セットアップ手順

### 1. パッケージのインストール
```bash
flutter pub get
```

### 2. 多言語対応ファイルの生成
```bash
flutter gen-l10n
```

### 3. Firebase設定
- Firebase Consoleでプロジェクトを作成
- iOSとAndroidのアプリを追加
- 設定ファイルをダウンロードして配置:
  - iOS: `ios/Runner/GoogleService-Info.plist`
  - Android: `android/app/google-services.json`

{{#enable_subscription}}
### 4. In-App Purchase設定
- App Store Connect / Google Play Consoleで商品を設定
- `lib/data/repositories/subscription_repository_impl.dart`で商品IDを設定
{{/enable_subscription}}

## 技術スタック

- **フレームワーク**: Flutter
- **言語**: Dart
- **状態管理**: Riverpod
- **アーキテクチャ**: オニオンアーキテクチャ
- **デザインシステム**: Cupertino（iOS風）
- **Firebase**: Analytics, App Check, Remote Config
{{#enable_subscription}}
- **課金**: In-App Purchase
{{/enable_subscription}}
- **多言語対応**: Flutter Localizations

## 共通機能

{{#enable_subscription}}
✅ サブスクリプション機能
{{/enable_subscription}}
✅ Firebase Analytics（画面閲覧、起動回数追跡）
✅ Firebase App Check
✅ Remote Config（バージョン管理、メンテナンスモード）
✅ 12言語対応
✅ 設定画面
✅ プライバシーポリシー画面
✅ 利用規約画面

## 開発ガイドライン

### コーディング規約
- Dart公式のスタイルガイドに従う
- `flutter_lints`の推奨ルールに従う

### 新機能の追加
1. ドメイン層にエンティティとリポジトリインターフェースを定義
2. データ層にリポジトリ実装を作成
3. プレゼンテーション層にUI・状態管理を実装
4. `lib/core/di/providers.dart`にプロバイダーを追加
5. `lib/docs/`にドキュメントを作成

### テスト
- ユニットテスト: ドメイン層とデータ層
- ウィジェットテスト: プレゼンテーション層
- 統合テスト: アプリ全体のフロー

## サポートプラットフォーム
- iOS
- Android

## ライセンス
このテンプレートは自由に使用・改変できます。




