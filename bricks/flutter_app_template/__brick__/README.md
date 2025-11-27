# {{app_name}}

{{description}}

## 目的

- 共通部分をセットアップしておき、工数削減
- Flutterアプリの開発高速化
- ベストプラクティスの適用

## 技術スタック

- **プラットフォーム**: iOS / Android
- **フレームワーク**: Flutter
- **言語**: Dart
- **アーキテクチャ**: オニオンアーキテクチャ
- **状態管理**: Riverpod
- **デザインシステム**: Cupertino（iOS風）

## 共通機能

### Firebase統合
- ✅ **Firebase Analytics**: 画面閲覧回数、起動回数、新規ユーザー起動回数の追跡
- ✅ **Firebase App Check**: アプリの正当性検証
- ✅ **Firebase Remote Config**:
  - 最低動作バージョン
  - 推奨動作バージョン
  - メンテナンス中フラグ
  - iOSアプリURL
  - AndroidアプリURL

### サブスクリプション機能
- ✅ In-App Purchaseによるサブスクリプション
- ✅ 商品一覧の取得
- ✅ 購入処理
- ✅ 購入の復元

### 多言語対応（12言語）
- ✅ 英語（アメリカ）（プライマリ言語）
- ✅ 日本語
- ✅ アラビア語
- ✅ イタリア語
- ✅ インドネシア語
- ✅ スペイン語
- ✅ ドイツ語
- ✅ ヒンディー語
- ✅ フランス語
- ✅ ポルトガル語
- ✅ ロシア語
- ✅ 韓国語

### 共通画面
- ✅ 設定画面
- ✅ プライバシーポリシー画面
- ✅ 利用規約画面

## プロジェクト構成（オニオンアーキテクチャ）

```
lib/
├── core/                   # 共通機能
│   ├── di/                # 依存性注入（Riverpod）
│   ├── services/          # 共通サービス（Firebase等）
│   └── constants/         # 定数定義
├── domain/                # ドメイン層（ビジネスロジック）
│   ├── entities/          # エンティティ
│   ├── repositories/      # リポジトリインターフェース
│   └── usecases/          # ユースケース
├── data/                  # データ層（データアクセス）
│   ├── datasources/       # データソース
│   │   ├── local/        # ローカルストレージ
│   │   └── remote/       # API通信
│   ├── models/           # データモデル
│   └── repositories/      # リポジトリ実装
├── presentation/          # プレゼンテーション層（UI）
│   ├── pages/            # 画面
│   ├── providers/        # 状態管理
│   └── widgets/          # 再利用可能なウィジェット
├── docs/                 # 仕様ドキュメント
└── main.dart             # エントリーポイント
```

## 🚀 クイックスタート

```bash
# 1. パッケージのインストール
flutter pub get

# 2. 多言語対応ファイルの生成
flutter gen-l10n

# 3. アプリを起動（Firebaseは無効化されています）
flutter run
```

Firebaseの設定をせずにすぐに動作確認できます（`enableFirebase = false`により無効化）。

## 📖 ドキュメント

- **[SETUP.md](SETUP.md)** - 完全なセットアップ手順書
  - クイックスタート（5分）
  - 基本設定
  - Firebase設定
  - In-App Purchase設定
  - デザインカスタマイズ（テーマカラー、アイコン）
  - リリース準備
  - チェックリスト
- **[lib/docs/](lib/docs/)** - 各機能の詳細仕様

## 📝 詳細なセットアップ手順

完全なセットアップ手順については、**[SETUP.md](SETUP.md)** を参照してください。

### セットアップ手順の概要

1. プロジェクト名の変更
2. パッケージのインストール
3. 多言語対応ファイルの生成

### 4. Firebase設定

#### Firebase Consoleでプロジェクトを作成
1. [Firebase Console](https://console.firebase.google.com/)にアクセス
2. 新しいプロジェクトを作成
3. iOSとAndroidアプリを追加

#### 設定ファイルの配置
- **iOS**: `ios/Runner/GoogleService-Info.plist`
- **Android**: `android/app/google-services.json`

#### Firebase機能の有効化
- Analytics
- App Check
- Remote Config

#### Remote Configパラメータの設定
Firebase Consoleで以下のパラメータを設定:
- `minimum_version`: 最低動作バージョン（例: "1.0.0"）
- `recommended_version`: 推奨動作バージョン（例: "1.0.0"）
- `is_maintenance`: メンテナンス中フラグ（true/false）
- `ios_app_url`: App StoreのURL
- `android_app_url`: Google PlayのURL

### 5. In-App Purchase設定

#### 商品IDの設定
`lib/data/repositories/subscription_repository_impl.dart`で商品IDを設定:

```dart
final Set<String> _productIds = {
  'your_subscription_product_id', // 実際の商品IDに置き換える
};
```

#### App Store Connect（iOS）
1. App Store Connectにログイン
2. アプリを作成
3. サブスクリプショングループを作成
4. サブスクリプション商品を追加

#### Google Play Console（Android）
1. Google Play Consoleにログイン
2. アプリを作成
3. 収益化 > 定期購入 から商品を追加

### 6. アプリ情報のカスタマイズ

#### プライバシーポリシーと利用規約のURL
`lib/core/constants/app_constants.dart`を編集:

```dart
class AppConstants {
  static const String appVersion = '{{version}}'.split('+')[0];
  static const String privacyPolicyUrl = 'https://yourwebsite.com/privacy';
  static const String termsOfServiceUrl = 'https://yourwebsite.com/terms';
}
```

#### アプリ名とアイコン
- `pubspec.yaml`の`name`を変更
- アプリアイコンを設定（`ios/Runner/Assets.xcassets`、`android/app/src/main/res`）

## ドキュメント

詳細な仕様は`lib/docs/`ディレクトリを参照してください:

- [アーキテクチャ仕様](lib/docs/architecture.md)
- [Firebase Analytics](lib/docs/firebase_analytics.md)
- [Firebase App Check](lib/docs/firebase_app_check.md)
- [Firebase Remote Config](lib/docs/remote_config.md)
- [サブスクリプション](lib/docs/subscription.md)
- [多言語対応](lib/docs/localization.md)

## 開発ガイドライン

### コーディング規約
- Dart公式のスタイルガイドに従う
- `flutter_lints`の推奨ルールに従う

### 新機能の追加手順
1. ドメイン層にエンティティとリポジトリインターフェースを定義
2. データ層にリポジトリ実装を作成
3. プレゼンテーション層にUI・状態管理を実装
4. `lib/core/di/providers.dart`にプロバイダーを追加
5. `lib/docs/`にドキュメントを作成

## デザインシステム

iOS風のスタイリッシュなデザインを採用しています。

- **フレームワーク**: Cupertino（iOS風）
- **テーマ**: CupertinoThemeData
- **ナビゲーション**: CupertinoPageRoute

## ビルド

### iOS
```bash
flutter build ios --release
```

### Android
```bash
flutter build apk --release
# または
flutter build appbundle --release
```

## テスト

```bash
# ユニットテスト
flutter test

# ウィジェットテスト
flutter test test/widget_test.dart

# 統合テスト
flutter drive --target=test_driver/app.dart
```

## トラブルシューティング

### Firebaseが初期化されない
- `google-services.json`（Android）と`GoogleService-Info.plist`（iOS）が正しく配置されているか確認
- Firebase Consoleでプロジェクトが正しく設定されているか確認

### 多言語対応が反映されない
```bash
flutter clean
flutter pub get
flutter gen-l10n
```

### In-App Purchaseが動作しない
- 商品IDが正しく設定されているか確認
- テスト環境ではサンドボックスアカウントを使用

## ライセンス

このテンプレートは自由に使用・改変できます。

## 貢献

プルリクエストを歓迎します。大きな変更の場合は、まずIssueを開いて変更内容を議論してください。

## サポート

問題が発生した場合は、Issueを作成してください。


