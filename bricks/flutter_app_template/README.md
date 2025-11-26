# Flutter App Template Mason Brick

Flutterアプリ開発のための再利用可能なMasonブリックです。

## 機能

- ✅ オニオンアーキテクチャ
- ✅ Riverpodによる状態管理
- ✅ Firebase統合（Analytics、App Check、Remote Config）
- ✅ In-App Purchase（サブスクリプション）
- ✅ 12言語対応（多言語化）
- ✅ Cupertinoデザインシステム
- ✅ 開発中Firebase無効化オプション

## インストール

### ローカルブリックとして使用

1. このリポジトリをクローンまたはダウンロード
2. プロジェクトのルートに`mason.yaml`を作成：

```yaml
bricks:
  flutter_app_template:
    path: ./bricks/flutter_app_template
```

3. ブリックを取得：

```bash
mason get
```

### グローバルブリックとして使用

```bash
mason add -g flutter_app_template --path ./bricks/flutter_app_template
```

## 使用方法

### 基本的な使い方

```bash
# 新しいプロジェクトを作成
mason make flutter_app_template
```

対話形式で以下の情報を入力します：

- **project_name**: プロジェクト名（スネークケース、例：`my_app`）
- **app_name**: アプリ名（表示名、例：`My App`）
- **package_name**: パッケージ名（ドット区切り、例：`com.company.myapp`）
- **description**: プロジェクトの説明
- **version**: 初期バージョン（デフォルト：`1.0.0+1`）
- **enable_firebase**: Firebase有効化（デフォルト：`false`）

### 設定ファイルを使用（非対話式）

`config.json`を作成：

```json
{
  "project_name": "my_app",
  "app_name": "My App",
  "package_name": "com.company.myapp",
  "description": "A new Flutter project",
  "version": "1.0.0+1",
  "enable_firebase": false
}
```

設定ファイルを使用して生成：

```bash
mason make flutter_app_template --config-path config.json
```

### 出力ディレクトリを指定

```bash
mason make flutter_app_template --output-dir ./my_new_project
```

## 生成後の手順

1. **プロジェクトディレクトリに移動**
   ```bash
   cd <project_name>
   ```

2. **依存関係をインストール**
   ```bash
   flutter pub get
   ```

3. **多言語対応ファイルを生成**
   ```bash
   flutter gen-l10n
   ```

4. **アプリを実行**
   ```bash
   flutter run
   ```

## 生成されるファイル構造

```
<project_name>/
├── lib/
│   ├── core/              # 共通機能
│   │   ├── di/           # 依存性注入
│   │   ├── services/     # 共通サービス
│   │   └── constants/    # 定数定義
│   ├── domain/           # ドメイン層
│   │   ├── entities/     # エンティティ
│   │   └── repositories/ # リポジトリインターフェース
│   ├── data/             # データ層
│   │   └── repositories/ # リポジトリ実装
│   ├── presentation/      # プレゼンテーション層
│   │   └── pages/        # 画面
│   ├── l10n/             # 多言語対応ファイル（12言語）
│   └── main.dart         # エントリーポイント
├── android/              # Android設定
├── ios/                  # iOS設定
├── pubspec.yaml          # 依存関係
└── l10n.yaml            # 多言語設定
```

## サポート言語

- 英語（en）- プライマリ言語
- 日本語（ja）
- アラビア語（ar）
- ドイツ語（de）
- スペイン語（es）
- フランス語（fr）
- ヒンディー語（hi）
- インドネシア語（id）
- イタリア語（it）
- 韓国語（ko）
- ポルトガル語（pt）
- ロシア語（ru）

## カスタマイズ

生成後、以下のファイルをカスタマイズしてください：

- `lib/core/constants/app_colors.dart` - テーマカラー
- `lib/core/constants/app_constants.dart` - アプリ定数
- `lib/data/repositories/subscription_repository_impl.dart` - 商品ID設定
- `android/app/build.gradle.kts` - Android設定
- `ios/Runner/Info.plist` - iOS設定

## Firebase設定

Firebaseを使用する場合：

1. Firebase Consoleでプロジェクトを作成
2. `google-services.json`（Android）と`GoogleService-Info.plist`（iOS）を配置
3. `lib/main.dart`の`enableFirebase`を`true`に変更

## トラブルシューティング

### ブリックが見つからない

```bash
# ブリックを再取得
mason get
```

### ファイルの競合

```bash
# 上書きする場合
mason make flutter_app_template --on-conflict overwrite

# スキップする場合
mason make flutter_app_template --on-conflict skip
```

## ライセンス

このテンプレートは自由に使用・改変できます。

