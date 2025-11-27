# {{app_name}} - ClaudeCode 開発ルール

## プロジェクト概要
{{description}}

## アプリカラー
主なイメージ（必須）：
BrandColor（任意）:
SecondaryColor（任意）:

## 技術スタック
- フレームワーク: Flutter
- 言語: Dart
- アーキテクチャ: オニオンアーキテクチャ
- データベース/ストレージ: SharedPreferences
- API/外部サービス: Firebase (Analytics, App Check, Remote Config)
- 状態管理: Riverpod
- プラットフォーム: iOS / Android

## 主要機能一覧

### 1. Firebase統合
- **Firebase Analytics**: 画面閲覧回数、起動回数、新規ユーザー起動回数の追跡
- **Firebase App Check**: アプリの正当性検証
- **Firebase Remote Config**: バージョン管理、メンテナンスモード

### 2. サブスクリプション機能
- **In-App Purchase**: サブスクリプション購入
- **購入の復元**: 購入履歴の復元

### 3. 多言語対応
- **12言語対応**: 英語、日本語、アラビア語、イタリア語、インドネシア語、スペイン語、ドイツ語、ヒンディー語、フランス語、ポルトガル語、ロシア語、韓国語

## ページ/画面一覧

### 1. 設定画面 (`lib/presentation/pages/settings/settings_page.dart`)
- **パス**: `/settings`
- **機能**:
  - 言語設定
  - サブスクリプション管理
  - 購入の復元
  - プライバシーポリシー表示
  - 利用規約表示
- **主要コンポーネント/ウィジェット**:
  - `SettingsPage`: 設定画面のメインウィジェット
  - `CupertinoListSection`: iOS風のリストセクション

### 2. プライバシーポリシー画面 (`lib/presentation/pages/settings/privacy_policy_page.dart`)
- **パス**: `/privacy-policy`
- **機能**:
  - プライバシーポリシーの表示
  - 外部ブラウザで開く
- **主要コンポーネント/ウィジェット**:
  - `PrivacyPolicyPage`: プライバシーポリシー画面

### 3. 利用規約画面 (`lib/presentation/pages/settings/terms_of_service_page.dart`)
- **パス**: `/terms-of-service`
- **機能**:
  - 利用規約の表示
  - 外部ブラウザで開く
- **主要コンポーネント/ウィジェット**:
  - `TermsOfServicePage`: 利用規約画面

### ナビゲーション構造
- 設定画面: メイン画面

## アーキテクチャ構造
```
{{project_name}}/
├── lib/
│   ├── core/                   # 共通機能
│   │   ├── di/                # 依存性注入（Riverpod）
│   │   ├── services/          # 共通サービス（Firebase等）
│   │   └── constants/         # 定数定義
│   ├── domain/                # ドメイン層（ビジネスロジック）
│   │   ├── entities/          # エンティティ
│   │   ├── repositories/      # リポジトリインターフェース
│   │   └── usecases/          # ユースケース
│   ├── data/                  # データ層（データアクセス）
│   │   ├── datasources/       # データソース
│   │   │   ├── local/        # ローカルストレージ
│   │   │   └── remote/       # API通信
│   │   ├── models/           # データモデル
│   │   └── repositories/      # リポジトリ実装
│   ├── presentation/          # プレゼンテーション層（UI）
│   │   ├── pages/            # 画面
│   │   ├── providers/        # 状態管理
│   │   └── widgets/          # 再利用可能なウィジェット
│   ├── docs/                 # 仕様ドキュメント
│   └── main.dart             # エントリーポイント
├── android/                   # Android設定
├── ios/                       # iOS設定
└── test/                      # テスト
```

## コーディング規約

### 命名規則
- クラス名: PascalCase（例: `SettingsPage`）
- ファイル名: snake_case（例: `settings_page.dart`）
- 変数・関数: camelCase（例: `getUserData`）
- 定数: camelCase with `static const`（例: `static const String appVersion`）
- プライベート変数: `_` prefix with camelCase（例: `_subscriptionController`）

### コメント
- **必須**: 日本語でのコメントを記述
- パブリックAPIには必ずドキュメントコメントを追加
- 複雑なロジックには説明コメントを追加

```dart
/// 設定画面を表示するウィジェット
/// 
/// ユーザーの設定を管理し、各種機能へのアクセスを提供します。
class SettingsPage extends StatelessWidget {
  /// アプリのバージョン情報
  static const String appVersion = '1.0.0';
  
  // プライベート変数の説明
  final String _userId;
}
```

### エラーハンドリング
- try-catch文を使用してエラーを適切に処理
- ユーザーに分かりやすいエラーメッセージを表示
- ログにエラー情報を記録

```dart
try {
  await subscriptionRepository.purchaseProduct(productId);
} on PlatformException catch (e) {
  // プラットフォーム固有のエラー処理
  print('Purchase failed: ${e.message}');
} catch (e) {
  // その他のエラー処理
  print('Unexpected error: $e');
}
```

## UI/UXデザイン指針

### デザインコンセプト
- **iOS風デザイン**: Cupertinoウィジェットを優先的に使用
- **シンプルで洗練されたUI**: 不要な装飾を避け、機能性を重視
- **一貫性**: アプリ全体で統一されたデザイン言語を使用
- **アクセシビリティ**: すべてのユーザーが使いやすいUI

### iOSデザインガイドライン
UIは必ずiOS Human Interface Guidelines（HIG）に準拠し、ネイティブiOSアプリのような洗練されたデザインを実現する。

#### 必須対応項目
- **Cupertino系ウィジェット使用**: Material DesignではなくCupertinoウィジェットを優先的に使用
- **iOSネイティブフォント**: SF Pro、SF Compact、SF Monoを使用
- **iOSスタイルのナビゲーション**: CupertinoNavigationBar、CupertinoTabBarを使用
- **iOSスタイルのアニメーション**: スムーズで自然なトランジション効果
- **iOSカラーシステム**: iOS標準のシステムカラーを活用（例: CupertinoColors.systemBlue）

#### UIコンポーネントの選択基準
```dart
// ❌ Material Design（使用しない）
import 'package:flutter/material.dart';
Scaffold, AppBar, FloatingActionButton, etc.

// ✅ Cupertino（iOS風）（優先使用）
import 'package:flutter/cupertino.dart';
CupertinoPageScaffold, CupertinoNavigationBar, CupertinoButton, etc.
```

#### 余白とレイアウト
- **パディング**: iOSの標準的な余白（16pt, 20pt）を使用
- **角丸**: iOS標準の角丸半径（8pt, 10pt, 12pt）
- **シャドウ**: 控えめで自然な影（iOSは一般的に影を控えめに使用）

#### アニメーション・トランジション
- **画面遷移**: iOSネイティブのような右からスライド
- **モーダル**: 下から上へスライド
- **タブ切り替え**: クロスフェード
- **リスト操作**: スワイプアクション（左右）

#### インタラクション
- **ボタン**: タップ時に透明度変化（0.4秒）
- **スクロール**: iOS特有のバウンス効果
- **プルトゥリフレッシュ**: CupertinoSliverRefreshControlを使用
- **コンテキストメニュー**: 長押しでiOS風のコンテキストメニュー

#### 参考実装例
```dart
// iOS風のページ構造
CupertinoPageScaffold(
  navigationBar: CupertinoNavigationBar(
    middle: Text('設定'),
  ),
  child: SafeArea(
    child: [コンテンツ],
  ),
)

// iOS風のボタン
CupertinoButton(
  onPressed: () {},
  child: Text('OK'),
)

// iOS風のアラートダイアログ
showCupertinoDialog(
  context: context,
  builder: (context) => CupertinoAlertDialog(
    title: Text('タイトル'),
    content: Text('内容'),
    actions: [
      CupertinoDialogAction(child: Text('キャンセル')),
      CupertinoDialogAction(child: Text('OK')),
    ],
  ),
)
```

### UI要素
- **CupertinoPageScaffold**: ページの基本構造
- **CupertinoNavigationBar**: ナビゲーションバー
- **CupertinoListSection**: リストセクション
- **CupertinoButton**: ボタン

## Firebase機能

### Firebase Analytics活用
- **画面閲覧追跡**: 各画面の表示回数を記録
- **イベント追跡**: 重要なユーザーアクションを記録
- **ユーザー属性**: ユーザーの特性を記録

### Firebase App Check設計
- **デバッグモード**: 開発中はデバッグプロバイダーを使用
- **本番モード**: リリース前にはApp Attest/Play Integrityに切り替え

### Firebase Remote Config設計
- **バージョン管理**: 最低動作バージョンと推奨バージョンを管理
- **メンテナンスモード**: アプリのメンテナンス状態を制御
- **アプリストアURL**: iOS/AndroidアプリのストアURLを管理

## データ永続化

### SharedPreferences方針
- **設定情報**: ユーザーの設定を保存
- **キャッシュ**: 一時的なデータを保存
- **軽量データ**: 小規模なデータのみを保存

## テストガイドライン

### テスト方針
- **ユニットテスト**: ドメイン層とデータ層のロジック
- **ウィジェットテスト**: UIコンポーネントの動作確認
- **統合テスト**: エンドツーエンドの動作確認

### テストファイル命名
- ファイル名: `[対象ファイル名]_test.dart`
- 配置: `test/`ディレクトリ

```dart
// 例: lib/core/services/firebase_analytics_service.dart
//   → test/core/services/firebase_analytics_service_test.dart

void main() {
  group('FirebaseAnalyticsService', () {
    test('logScreenView should log screen view', () async {
      // テストコード
    });
  });
}
```

### DO
✅ Cupertinoウィジェットを優先的に使用
✅ オニオンアーキテクチャに従う
✅ Riverpodで状態管理を行う
✅ エラーハンドリングを適切に実装
✅ ドキュメントコメントを追加
✅ テストを書く

### DON'T（禁止）
❌ Material Designウィジェットを使用しない
❌ プレゼンテーション層からデータ層に直接アクセスしない
❌ グローバル変数を使用しない
❌ ハードコードされた文字列を使用しない（多言語対応を使用）
❌ エラーを無視しない

## パフォーマンス最適化

### 最適化ポイント
- **画像最適化**: 適切なサイズの画像を使用
- **リスト最適化**: ListView.builderを使用
- **メモリ管理**: 不要なオブジェクトを適切に破棄
- **非同期処理**: Future/Streamを適切に使用

## アクセシビリティ

### 必須対応
- **セマンティックラベル**: 適切なセマンティック情報を追加
- **フォントサイズ**: システムフォントサイズに従う
- **コントラスト**: 十分なコントラスト比を確保
- **タッチターゲット**: 最小44x44ptのタッチターゲット

## 参考リソース

### Flutter
- [Flutter公式ドキュメント](https://flutter.dev/docs)
- [Cupertino Widgets](https://api.flutter.dev/flutter/cupertino/cupertino-library.html)

### Firebase
- [Firebase公式ドキュメント](https://firebase.google.com/docs)
- [Firebase Analytics](https://firebase.google.com/docs/analytics)

### iOS
- [iOS Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios)

---

## まとめ

このルールファイルは、{{app_name}}の開発において一貫性と品質を保つためのガイドラインです。
全ての開発者はこのルールに従い、特に以下を厳守してください：

1. **Cupertinoウィジェットの使用**: iOS風のデザインを維持
2. **オニオンアーキテクチャの遵守**: 層の依存関係を正しく保つ
3. **エラーハンドリング**: すべてのエラーを適切に処理
4. **テストの作成**: 重要な機能にはテストを書く
5. **ドキュメント**: パブリックAPIにはドキュメントコメントを追加

質問や不明点がある場合は、このルールファイルを参照してください。


