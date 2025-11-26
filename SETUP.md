# Flutter App Template セットアップ手順書

このドキュメントでは、Flutter App Templateを使用してアプリ開発を始めるための完全な手順を説明します。

## 目次

1. [クイックスタート（5分）](#🚀-クイックスタート5分)
2. [基本設定](#📝-基本設定)
3. [Firebase設定](#🔥-firebase設定)
4. [In-App Purchase設定](#💰-in-app-purchase設定)
5. [デザインカスタマイズ](#🎨-デザインカスタマイズ)
6. [リリース準備](#🚀-リリース準備)
7. [よく使うコマンド](#📚-よく使うコマンド)
8. [トラブルシューティング](#🐛-トラブルシューティング)
9. [完全チェックリスト](#✅-完全チェックリスト)

---

## 📋 事前準備

以下がインストールされていることを確認してください：

- [ ] Flutter SDK（最新安定版）
- [ ] Dart SDK（Flutterに含まれます）
- [ ] Xcode（iOS開発の場合）
- [ ] Android Studio（Android開発の場合）
- [ ] Git

---

## 🚀 クイックスタート（5分）

まずアプリを動かしてみましょう。Firebase設定は後回しでOKです。

```bash
# 1. パッケージのインストール
flutter pub get

# 2. 多言語対応ファイルの生成
flutter gen-l10n

# 3. アプリを起動
flutter run
```

これだけで設定画面が表示されるアプリが起動します！
（`lib/main.dart`の`enableFirebase = false`によりFirebaseは無効化されています）

---

## 📝 基本設定

### ステップ1: プロジェクト名の変更

#### 1-1. pubspec.yamlの編集

`pubspec.yaml`を開き、プロジェクト名を変更：

```yaml
name: your_app_name  # ここを変更（スネークケース推奨）
description: "あなたのアプリの説明"
version: 1.0.0+1  # バージョン番号+ビルド番号
```

#### 1-2. インポート文の一括置換

プロジェクト内のすべての`flutter_app_template`を`your_app_name`に置換：

**VS Code/Android Studio:**
1. `Ctrl+Shift+H` (Windows/Linux) または `Cmd+Shift+H` (Mac)
2. 検索: `flutter_app_template`
3. 置換: `your_app_name`
4. "すべて置換"を実行

#### 1-3. iOS設定

1. Xcodeで`ios/Runner.xcworkspace`を開く
2. Runner > General > Bundle Identifier を変更
   - 例: `com.yourcompany.yourapp`
3. Display Name を変更（アプリ名）
4. Teamを設定

#### 1-4. Android設定

`android/app/build.gradle`を編集：

```gradle
android {
    defaultConfig {
        applicationId "com.yourcompany.yourapp"  // ← 変更
        // ...
    }
}
```

`android/app/src/main/AndroidManifest.xml`を編集：

```xml
<application
    android:label="Your App Name"  <!-- ← アプリ名を変更 -->
    ...
```

### ステップ2: アプリ情報の設定

`lib/core/constants/app_constants.dart`を編集：

```dart
class AppConstants {
  static const String appVersion = '1.0.0';  // pubspec.yamlと同じ

  // プライバシーポリシーと利用規約のURL（後で設定）
  static const String privacyPolicyUrl = 'https://yourwebsite.com/privacy';
  static const String termsOfServiceUrl = 'https://yourwebsite.com/terms';
}
```

---

## 🔥 Firebase設定

### ステップ3: Firebaseプロジェクトの作成

#### 3-1. プロジェクト作成

1. [Firebase Console](https://console.firebase.google.com/) にアクセス
2. 「プロジェクトを追加」をクリック
3. プロジェクト名を入力（例: `your-app-name`）
4. Google Analyticsを「有効にする」を選択（推奨）
5. 「プロジェクトを作成」をクリック

#### 3-2. iOSアプリの追加

1. プロジェクト概要ページで、iOSアイコンをクリック
2. **Apple バンドル ID** を入力（ステップ1-3で設定したもの）
   - 例: `com.yourcompany.yourapp`
3. アプリのニックネーム: 任意（例: `YourApp iOS`）
4. 「アプリを登録」をクリック
5. **GoogleService-Info.plist** をダウンロード
6. ファイルを `ios/Runner/` に配置
7. Xcodeで`ios/Runner.xcworkspace`を開き、ファイルが認識されることを確認

**ファイル配置:**
```
ios/
└── Runner/
    └── GoogleService-Info.plist  ← ここに配置
```

#### 3-3. Androidアプリの追加

1. プロジェクト概要ページで、Androidアイコンをクリック
2. **Android パッケージ名** を入力（ステップ1-4で設定したもの）
   - 例: `com.yourcompany.yourapp`
3. アプリのニックネーム: 任意（例: `YourApp Android`）
4. 「アプリを登録」をクリック
5. **google-services.json** をダウンロード
6. ファイルを `android/app/` に配置

**ファイル配置:**
```
android/
└── app/
    └── google-services.json  ← ここに配置
```

### ステップ4: Firebase機能の設定

#### 4-1. Firebase Analytics（自動有効）

Google Analyticsを有効にした場合、自動的に設定されています。

#### 4-2. Firebase App Check

1. Firebase Console で「App Check」をクリック
2. 「使ってみる」をクリック
3. **iOS**: App Attestを選択 → アプリを選択 → 「保存」
4. **Android**: Play Integrityを選択 → アプリを選択 → 「保存」

**⚠️ 重要: プロダクション前の設定変更**

現在、コードはデバッグモードに設定されています。リリース前に以下を変更してください：

`lib/core/services/firebase_app_check_service.dart`:
```dart
Future<void> activate() async {
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,  // ← debug → playIntegrity
    appleProvider: AppleProvider.appAttest,          // ← debug → appAttest
  );
}
```

#### 4-3. Firebase Remote Config

1. Firebase Console で「Remote Config」をクリック
2. 「構成を作成」をクリック
3. 以下のパラメータを追加：

| パラメータキー | デフォルト値 | 値の型 | 説明 |
|------------|----------|--------|------|
| `minimum_version` | `1.0.0` | String | アプリの最低動作バージョン |
| `recommended_version` | `1.0.0` | String | 推奨バージョン |
| `is_maintenance` | `false` | Boolean | メンテナンス中フラグ |
| `ios_app_url` | `https://apps.apple.com/app/idXXXXXXXXX` | String | App StoreのURL |
| `android_app_url` | `https://play.google.com/store/apps/details?id=com.yourcompany.yourapp` | String | Google PlayのURL |

4. 「変更を公開」をクリック

**パラメータの追加方法:**
1. 「パラメータを追加」ボタンをクリック
2. パラメータキーを入力
3. デフォルト値を入力
4. データ型を選択
5. 「保存」をクリック
6. すべてのパラメータを追加後、「変更を公開」

### ステップ5: Firebaseの有効化

`lib/main.dart`を編集：

```dart
// Firebaseの有効化/無効化（true=有効, false=無効）
const bool enableFirebase = true;  // ← false から true に変更
```

### ステップ6: 動作確認

```bash
# iOSの場合
flutter run -d ios

# Androidの場合
flutter run -d android
```

アプリが起動してエラーがなければ成功です！

---

## 💰 In-App Purchase設定

### ステップ7: App Store Connect設定（iOS）

#### 7-1. アプリの作成

1. [App Store Connect](https://appstoreconnect.apple.com/) にログイン
2. 「マイApp」→「+」→「新規App」
3. 必要情報を入力：
   - プラットフォーム: iOS
   - 名前: アプリ名
   - プライマリ言語: 日本語
   - バンドルID: Firebaseで設定したもの
   - SKU: 任意の一意な識別子
4. 「作成」をクリック

#### 7-2. サブスクリプションの設定

1. アプリを選択 → 左メニュー「サブスクリプション」
2. 「+」→「サブスクリプショングループを作成」
3. グループ参照名を入力（例: `Premium Subscription`）
4. 「作成」をクリック
5. グループを選択 → 「+」→「サブスクリプションを作成」
6. 情報を入力：
   - **参照名**: 例 `Monthly Premium`
   - **プロダクトID**: 例 `com.yourcompany.yourapp.premium.monthly`
     - ⚠️ **このIDをメモしてください**
   - **サブスクリプション期間**: 例 1ヶ月
   - **価格**: 設定
7. 「保存」をクリック

#### 7-3. サンドボックステスターの作成

1. App Store Connect → 「ユーザとアクセス」
2. 「サンドボックス」タブ
3. 「+」をクリック
4. テスター情報を入力（実在しないメールアドレスでOK）
5. 「招待」をクリック

### ステップ8: Google Play Console設定（Android）

#### 8-1. アプリの作成

1. [Google Play Console](https://play.google.com/console/) にログイン
2. 「アプリを作成」をクリック
3. 必要情報を入力
4. 「アプリを作成」をクリック

#### 8-2. 定期購入の設定

1. 左メニュー → 「収益化」→「定期購入」
2. 「定期購入を作成」をクリック
3. 情報を入力：
   - **プロダクトID**: iOSと同じまたは別のID
     - 例: `com.yourcompany.yourapp.premium.monthly`
   - **名前**: 商品名
   - **説明**: 商品説明
   - **料金**: 価格設定
4. 「保存」→「有効化」をクリック

### ステップ9: コードに商品IDを設定

`lib/data/repositories/subscription_repository_impl.dart`を編集：

```dart
final Set<String> _productIds = {
  'com.yourcompany.yourapp.premium.monthly', // ← 実際の商品IDに変更
};
```

複数の商品がある場合：
```dart
final Set<String> _productIds = {
  'com.yourcompany.yourapp.premium.monthly',
  'com.yourcompany.yourapp.premium.yearly',
};
```

### ステップ10: テスト

**iOS:**
1. 実機を接続（シミュレータ不可）
2. 設定 → App Store → サンドボックスアカウントでログイン
3. アプリで購入テスト

**Android:**
1. テスターとして自分を追加
2. アプリで購入テスト

---

## 🎨 デザインカスタマイズ

### ステップ11: テーマカラーの設定

アプリのブランドカラーを設定します。

#### 11-1. カラーの定義

`lib/core/constants/app_colors.dart`を編集：

```dart
class AppColors {
  AppColors._();

  // ==================== プライマリカラー ====================
  /// メインカラー（ブランドカラー）
  static const Color primary = Color(0xFF007AFF);  // ← 好きな色に変更

  // ==================== セカンダリカラー ====================
  /// サブカラー
  static const Color secondary = Color(0xFF34C759);  // ← 好きな色に変更

  // その他のカラーも必要に応じて変更...
}
```

**カラーコードの指定方法:**
- `Color(0xFFRRGGBB)` - 16進数カラーコード
- 例: 赤 `Color(0xFFFF0000)`
- 例: 青 `Color(0xFF0000FF)`

#### 11-2. カスタムカラーの例

```dart
// 例1: ピンク系アプリ
static const Color primary = Color(0xFFFF69B4);
static const Color secondary = Color(0xFFFFB6C1);

// 例2: グリーン系アプリ
static const Color primary = Color(0xFF2ECC71);
static const Color secondary = Color(0xFF27AE60);

// 例3: オレンジ系アプリ
static const Color primary = Color(0xFFFF9500);
static const Color secondary = Color(0xFFFF6B00);
```

### ステップ12: アプリアイコンの設定

#### 12-1. flutter_launcher_iconsパッケージを使用（推奨）

**1. パッケージの追加**

`pubspec.yaml`に追加：

```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/icon/app_icon.png"  # アイコン画像のパス
  adaptive_icon_background: "#FFFFFF"  # Android用背景色
  adaptive_icon_foreground: "assets/icon/app_icon.png"
```

**2. アイコン画像の準備**

- サイズ: 1024x1024px（推奨）
- フォーマット: PNG
- 配置: `assets/icon/app_icon.png`

**3. アイコン生成**

```bash
flutter pub get
flutter pub run flutter_launcher_icons
```

#### 12-2. 手動で設定する場合

**iOS:**
1. Xcodeで`ios/Runner.xcworkspace`を開く
2. `Runner/Assets.xcassets/AppIcon.appiconset`を選択
3. 各サイズのアイコンをドラッグ&ドロップ

**Android:**
1. 以下のフォルダに`ic_launcher.png`を配置：
   - `android/app/src/main/res/mipmap-hdpi/`
   - `android/app/src/main/res/mipmap-mdpi/`
   - `android/app/src/main/res/mipmap-xhdpi/`
   - `android/app/src/main/res/mipmap-xxhdpi/`
   - `android/app/src/main/res/mipmap-xxxhdpi/`

### ステップ13: 多言語対応の編集

新しい文字列を追加する場合：

**1. 英語（プライマリ）に追加**

`lib/l10n/app_en.arb`:
```json
{
  "myNewString": "My New String",
  "@myNewString": {
    "description": "説明文"
  }
}
```

**2. 他の言語に追加**

`lib/l10n/app_ja.arb`:
```json
{
  "myNewString": "私の新しい文字列"
}
```

**3. コード生成**

```bash
flutter gen-l10n
```

**4. コードで使用**

```dart
final l10n = AppLocalizations.of(context)!;
Text(l10n.myNewString);
```

---

## 🚀 リリース準備

### ステップ14: ビルド設定

#### 14-1. iOS署名設定

1. Xcodeで`ios/Runner.xcworkspace`を開く
2. Runner → Signing & Capabilities
3. 「Automatically manage signing」を有効化
4. Teamを選択
5. Provisioning Profileが自動生成される

#### 14-2. Android署名設定

**1. キーストアの作成**

```bash
keytool -genkey -v -keystore ~/upload-keystore.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias upload
```

質問に回答してパスワードを設定（メモしてください）

**2. key.propertiesの作成**

`android/key.properties`を作成：

```properties
storePassword=YOUR_STORE_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=upload
storeFile=/Users/yourname/upload-keystore.jks
```

**3. build.gradleの編集**

`android/app/build.gradle`の先頭に追加：

```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}
```

`android`ブロック内に追加：

```gradle
signingConfigs {
    release {
        keyAlias keystoreProperties['keyAlias']
        keyPassword keystoreProperties['keyPassword']
        storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
        storePassword keystoreProperties['storePassword']
    }
}

buildTypes {
    release {
        signingConfig signingConfigs.release
    }
}
```

### ステップ15: リリースビルド

**iOS:**
```bash
flutter build ios --release
```

Xcodeで Product → Archive → Distribute App

**Android:**
```bash
# App Bundle（推奨）
flutter build appbundle --release

# または APK
flutter build apk --release
```

### ステップ16: ストア申請

#### iOS（App Store）

1. App Store Connectですべての情報を入力
2. TestFlightでベータテスト
3. 審査用の情報を準備
4. 「審査に提出」をクリック

#### Android（Google Play）

1. Google Play Consoleですべての情報を入力
2. 内部テストまたはクローズドテスト
3. コンテンツレーティングを取得
4. 「審査に提出」をクリック

---

## 📚 よく使うコマンド

### 開発

```bash
# パッケージのインストール
flutter pub get

# 多言語対応ファイルの生成
flutter gen-l10n

# 実行（デバッグ）
flutter run

# iOS実機で実行
flutter run -d ios

# Android実機で実行
flutter run -d android

# ホットリロード
r (アプリ実行中)

# ホットリスタート
R (アプリ実行中)
```

### ビルド

```bash
# クリーンビルド
flutter clean

# iOS リリースビルド
flutter build ios --release

# Android App Bundle
flutter build appbundle --release

# Android APK
flutter build apk --release
```

### コード品質

```bash
# 静的解析
flutter analyze

# テスト実行
flutter test

# フォーマット
flutter format .
```

### iOS固有

```bash
# Podのクリーン
cd ios
pod deintegrate
pod install
cd ..
```

### その他

```bash
# デバイス一覧
flutter devices

# Flutter バージョン確認
flutter --version

# Flutter ドクター（環境確認）
flutter doctor
```

---

## 🐛 トラブルシューティング

### Firebaseが初期化されない

**症状:** アプリ起動時にクラッシュ、Firebase関連エラー

**解決方法:**
1. 設定ファイルの配置を確認
   - iOS: `ios/Runner/GoogleService-Info.plist`
   - Android: `android/app/google-services.json`
2. Bundle ID / パッケージ名がFirebaseと一致するか確認
3. Xcodeでプロジェクトをクリーン：
   ```bash
   cd ios
   pod deintegrate
   pod install
   cd ..
   flutter clean
   flutter pub get
   ```

### 多言語対応が反映されない

**症状:** ARBファイルを編集したが変更が反映されない

**解決方法:**
```bash
flutter clean
flutter pub get
flutter gen-l10n
```

### ビルドエラー

**症状:** `flutter build`でエラーが出る

**解決方法:**
```bash
# 完全クリーン
flutter clean
rm -rf ios/Pods
rm -rf ios/.symlinks
rm -rf ios/Flutter/Flutter.framework
rm -rf ios/Flutter/Flutter.podspec

# 再インストール
flutter pub get
cd ios
pod install
cd ..

# 再ビルド
flutter build ios
```

### In-App Purchaseが動作しない

**症状:** 商品が取得できない、購入できない

**解決方法:**
1. 商品IDが正しいか確認
2. iOS: サンドボックステスターでログインしているか確認
3. Android: テスターとして登録されているか確認
4. 商品が「審査準備完了」状態か確認
5. 実機でテスト（エミュレータでは動作しない場合あり）

### パッケージのバージョンエラー

**症状:** パッケージの依存関係エラー

**解決方法:**
```bash
flutter pub upgrade
flutter pub get
```

### Xcodeでアーカイブできない

**症状:** Product → Archive がグレーアウト

**解決方法:**
1. デバイスを「Any iOS Device」に変更
2. Scheme を「Release」に変更
3. Build Settings → Code Signing を確認

---

## ✅ 完全チェックリスト

コピーしてタスク管理に使用してください。

### 基本設定

- [ ] プロジェクト名を変更した（pubspec.yaml）
- [ ] インポート文を一括置換した
- [ ] iOS Bundle IDを変更した
- [ ] Android パッケージ名を変更した
- [ ] アプリ情報を設定した（app_constants.dart）
- [ ] `flutter pub get`を実行した
- [ ] `flutter gen-l10n`を実行した
- [ ] アプリが起動することを確認した

### Firebase設定

- [ ] Firebaseプロジェクトを作成した
- [ ] iOSアプリを追加した
- [ ] GoogleService-Info.plistをダウンロード・配置した
- [ ] Androidアプリを追加した
- [ ] google-services.jsonをダウンロード・配置した
- [ ] Firebase Analyticsが有効になっている
- [ ] Firebase App Checkを設定した
- [ ] Remote Configパラメータを設定した（5個）
- [ ] `enableFirebase = true`に変更した
- [ ] エラーなくアプリが起動することを確認した

### In-App Purchase設定

- [ ] App Store Connectでアプリを作成した（iOS）
- [ ] サブスクリプショングループを作成した（iOS）
- [ ] サブスクリプション商品を作成した（iOS）
- [ ] 商品IDをメモした（iOS）
- [ ] サンドボックステスターを作成した（iOS）
- [ ] Google Play Consoleでアプリを作成した（Android）
- [ ] 定期購入商品を作成した（Android）
- [ ] 商品IDをメモした（Android）
- [ ] コードに商品IDを設定した
- [ ] 実機でサブスクリプション購入をテストした

### デザインカスタマイズ

- [ ] テーマカラーを設定した（app_colors.dart）
- [ ] アプリアイコンを準備した（1024x1024px）
- [ ] アプリアイコンを設定した（iOS & Android）
- [ ] 多言語文字列を確認・編集した
- [ ] 不要な言語を削除した（必要に応じて）

### 法的文書

- [ ] プライバシーポリシーを作成した
- [ ] プライバシーポリシーをWebに公開した
- [ ] プライバシーポリシーURLを設定した
- [ ] 利用規約を作成した
- [ ] 利用規約をWebに公開した
- [ ] 利用規約URLを設定した

### テスト

- [ ] iOS実機で起動確認
- [ ] Android実機で起動確認
- [ ] 設定画面の表示確認
- [ ] 多言語切り替え確認（実装した場合）
- [ ] Firebase Analyticsの動作確認
- [ ] Remote Config値の取得確認
- [ ] サブスクリプション購入確認

### リリース準備

- [ ] バージョン番号を確認した（pubspec.yaml）
- [ ] app_constants.dartのバージョンと一致している
- [ ] Firebase App Checkを本番モードに変更した
- [ ] iOS署名設定を完了した
- [ ] Android署名設定を完了した（キーストア作成）
- [ ] `flutter analyze`でエラーなし
- [ ] `flutter test`でテスト通過
- [ ] リリースビルド作成（iOS）
- [ ] リリースビルド作成（Android）
- [ ] 実機でリリースビルドをテスト

### ストア申請

- [ ] App Store Connectの情報をすべて入力した
- [ ] スクリーンショットを準備・アップロードした
- [ ] TestFlightでベータテストを実施した
- [ ] iOSアプリを審査に提出した
- [ ] Google Play Consoleの情報をすべて入力した
- [ ] コンテンツレーティングを取得した
- [ ] Androidアプリを審査に提出した

---

## 🎉 完了！

すべてのステップが完了したら、アプリをリリースする準備ができています。

詳細な技術仕様については、`lib/docs/`配下のドキュメントを参照してください：

- [アーキテクチャ](lib/docs/architecture.md)
- [Firebase Analytics](lib/docs/firebase_analytics.md)
- [Firebase App Check](lib/docs/firebase_app_check.md)
- [Firebase Remote Config](lib/docs/remote_config.md)
- [サブスクリプション](lib/docs/subscription.md)
- [多言語対応](lib/docs/localization.md)

**開発を楽しんでください！** 🚀
