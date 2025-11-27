# Flutter App Template Mason Brick

Flutterアプリ開発のための再利用可能なMasonブリックです。

## ⚠️ 重要な注意事項

このブリックは、**既存のFlutterプロジェクトに追加するのではなく、完全なプロジェクトを生成します**。

ただし、iOSのXcodeプロジェクトファイル（`project.pbxproj`）など、一部の複雑なファイルは含まれていません。生成後、以下の手順を実行してください：

### 生成後の必須手順

1. **Flutterプロジェクトとして初期化**
   ```bash
   cd <project_name>
   flutter create --platforms=ios,android .
   ```

   これにより、不足しているiOS/Androidの設定ファイルが自動生成されます。

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

## 機能

- ✅ オニオンアーキテクチャ
- ✅ Riverpodによる状態管理
- ✅ Firebase統合（Analytics、App Check、Remote Config）
- ✅ In-App Purchase（サブスクリプション）
- ✅ 12言語対応（多言語化）
- ✅ Cupertinoデザインシステム
- ✅ 開発中Firebase無効化オプション

## インストール

### Gitリポジトリからインストール（推奨）

```bash
# 公開リポジトリから
mason add -g flutter_app_template \
  --git-url https://github.com/your-username/flutter_app_template.git \
  --git-path bricks/flutter_app_template

# 特定のバージョンを使用する場合
mason add -g flutter_app_template \
  --git-url https://github.com/your-username/flutter_app_template.git \
  --git-path bricks/flutter_app_template \
  --git-ref v1.0.0
```

### ローカルパスからインストール

```bash
# ローカルパスから
mason add -g flutter_app_template --path <path_to_brick>
```

### 共有方法について

詳細な共有手順は [SHARING.md](SHARING.md) を参照してください。

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

### 生成後の完全な手順

```bash
# 1. 生成されたプロジェクトディレクトリに移動
cd <project_name>

# 2. Flutterプロジェクトとして初期化（重要！）
flutter create --platforms=ios,android .

# 3. 依存関係をインストール
flutter pub get

# 4. 多言語対応ファイルを生成
flutter gen-l10n

# 5. アプリを実行
flutter run
```

## 生成されるファイル構造

```
<project_name>/
├── lib/
│   ├── core/              # 共通機能
│   ├── domain/           # ドメイン層
│   ├── data/             # データ層
│   ├── presentation/      # プレゼンテーション層
│   ├── l10n/             # 多言語対応ファイル（12言語）
│   └── main.dart         # エントリーポイント
├── android/              # Android設定
├── ios/                  # iOS設定（一部のみ）
├── test/                 # テストファイル
├── pubspec.yaml          # 依存関係
├── l10n.yaml            # 多言語設定
└── .gitignore           # Git除外設定
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

### iOSビルドエラー

`flutter create --platforms=ios,android .`を実行して、不足しているファイルを生成してください。

### Androidビルドエラー

`flutter create --platforms=android .`を実行して、不足しているファイルを生成してください。

## ライセンス

このテンプレートは自由に使用・改変できます。
