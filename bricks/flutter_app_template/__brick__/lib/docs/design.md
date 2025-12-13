# デザインカスタマイズ 仕様

## 概要

このアプリはiOS風のスタイリッシュなデザインを採用しています。Cupertinoデザインシステムを使用し、ブランドカラーをカスタマイズ可能です。

## テーマカラー設定

### カラー定義ファイル

`lib/core/constants/app_colors.dart`でアプリ全体のカラーテーマを管理します。

### カラーカテゴリ

#### 1. プライマリカラー（ブランドカラー）

```dart
/// メインカラー（ブランドカラー）
static const Color primary = Color(0xFF007AFF);  // iOS Blue
```

**用途:**
- ボタン
- リンク
- アクティブな状態の要素
- ナビゲーションバーのアクセント

#### 2. セカンダリカラー

```dart
/// サブカラー
static const Color secondary = Color(0xFF34C759);  // iOS Green
```

**用途:**
- 補助的なボタン
- 成功メッセージ
- アクセント要素

#### 3. 背景色

```dart
/// メインの背景色（ライトモード）
static const Color backgroundLight = CupertinoColors.systemBackground;

/// メインの背景色（ダークモード）
static const Color backgroundDark = CupertinoColors.black;
```

#### 4. テキストカラー

```dart
/// プライマリテキストカラー
static const Color textPrimary = CupertinoColors.label;

/// セカンダリテキストカラー（説明文など）
static const Color textSecondary = CupertinoColors.secondaryLabel;
```

#### 5. ステータスカラー

```dart
/// 成功
static const Color success = CupertinoColors.systemGreen;

/// 警告
static const Color warning = CupertinoColors.systemOrange;

/// エラー
static const Color error = CupertinoColors.systemRed;

/// 情報
static const Color info = CupertinoColors.systemBlue;
```

## カラーのカスタマイズ

### ステップ1: カラーコードの決定

ブランドカラーを16進数カラーコードで決定します。

**カラーコードの形式:**
```dart
Color(0xFFRRGGBB)
```

- `FF`: 不透明度（常に FF）
- `RR`: 赤（00-FF）
- `GG`: 緑（00-FF）
- `BB`: 青（00-FF）

**例:**
- 赤: `Color(0xFFFF0000)`
- 緑: `Color(0xFF00FF00)`
- 青: `Color(0xFF0000FF)`
- 白: `Color(0xFFFFFFFF)`
- 黒: `Color(0xFF000000)`

### ステップ2: app_colors.dartの編集

`lib/core/constants/app_colors.dart`を編集：

```dart
class AppColors {
  AppColors._();

  // プライマリカラーを変更
  static const Color primary = Color(0xFFYOURCOLOR);

  // セカンダリカラーを変更
  static const Color secondary = Color(0xFFYOURCOLOR);
}
```

### ステップ3: アプリを再起動

```bash
# ホットリスタート（アプリ実行中に R を押す）
# または
flutter run
```

## カラーパレット例

### 例1: ピンク系アプリ

```dart
static const Color primary = Color(0xFFFF69B4);      // ホットピンク
static const Color secondary = Color(0xFFFFB6C1);    // ライトピンク
```

**使用例:** 女性向けアプリ、美容・ファッションアプリ

### 例2: グリーン系アプリ

```dart
static const Color primary = Color(0xFF2ECC71);      // エメラルドグリーン
static const Color secondary = Color(0xFF27AE60);    // ネフライトグリーン
```

**使用例:** ヘルスケアアプリ、環境・エコアプリ

### 例3: オレンジ系アプリ

```dart
static const Color primary = Color(0xFFFF9500);      // iOS Orange
static const Color secondary = Color(0xFFFF6B00);    // ディープオレンジ
```

**使用例:** フード系アプリ、エンターテインメントアプリ

### 例4: パープル系アプリ

```dart
static const Color primary = Color(0xFF9B59B6);      // アメジスト
static const Color secondary = Color(0xFF8E44AD);    // ウィステリア
```

**使用例:** クリエイティブアプリ、音楽アプリ

### 例5: ブルー系アプリ（デフォルト）

```dart
static const Color primary = Color(0xFF007AFF);      // iOS Blue
static const Color secondary = Color(0xFF5AC8FA);    // ライトブルー
```

**使用例:** ビジネスアプリ、ユーティリティアプリ

## カラーの使用方法

### Widgetでの使用

```dart
// ボタン
CupertinoButton.filled(
  onPressed: () {},
  child: Text('Button'),
  // AppColors.primaryが自動的に適用される
)

// テキスト
Text(
  'Primary Text',
  style: TextStyle(color: AppColors.textPrimary),
)

// 背景色
Container(
  color: AppColors.backgroundLight,
  child: ...,
)

// カスタムカラー
Container(
  color: AppColors.primary,
  child: ...,
)
```

### テーマでの使用

`lib/main.dart`でテーマにカラーが適用されています：

```dart
theme: CupertinoThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  barBackgroundColor: AppColors.backgroundLight,
  textTheme: const CupertinoTextThemeData(
    primaryColor: AppColors.textPrimary,
  ),
),
```

## デザインガイドライン

### 1. カラーコントラスト

- テキストと背景のコントラスト比を4.5:1以上に保つ
- 重要なボタンは十分なコントラストを確保

### 2. アクセシビリティ

- カラーブラインドユーザーのため、色だけに頼らない
- アイコンやテキストラベルを併用

### 3. 一貫性

- プライマリカラーは重要なアクションに使用
- セカンダリカラーは補助的な要素に使用
- システムカラー（成功、警告、エラー）は適切な場面で使用

### 4. ダークモード対応

- CupertinoColorsを使用することで自動的にダークモード対応
- カスタムカラーを使用する場合は、ライト/ダーク両方を定義

## アプリアイコン

### 必要なサイズ

**iOS:**
- 1024x1024px（App Store用）
- 複数サイズ（20px, 29px, 40px, 60px, 76px, 83.5px @ 1x, 2x, 3x）

**Android:**
- mdpi: 48x48px
- hdpi: 72x72px
- xhdpi: 96x96px
- xxhdpi: 144x144px
- xxxhdpi: 192x192px

### デザインガイドライン

1. **シンプルさ**: 複雑すぎるデザインは避ける
2. **認識性**: 小さいサイズでも認識できるデザイン
3. **一貫性**: ブランドカラーを使用
4. **透過**: PNG形式、背景は透明または単色
5. **余白**: アイコンの周囲に適切な余白

### ツール

- [Figma](https://www.figma.com/) - デザインツール
- [Sketch](https://www.sketch.com/) - macOS用デザインツール
- [Adobe Illustrator](https://www.adobe.com/products/illustrator.html) - ベクターグラフィック
- [Canva](https://www.canva.com/) - オンラインデザインツール

## フォント

### デフォルトフォント

CupertinoアプリはSan Franciscoフォント（iOS標準）を使用します。

### カスタムフォントの追加

1. フォントファイルを`assets/fonts/`に配置
2. `pubspec.yaml`に追加：

```yaml
flutter:
  fonts:
    - family: YourFont
      fonts:
        - asset: assets/fonts/YourFont-Regular.ttf
        - asset: assets/fonts/YourFont-Bold.ttf
          weight: 700
```

3. 使用：

```dart
Text(
  'Custom Font',
  style: TextStyle(fontFamily: 'YourFont'),
)
```

## レイアウト

### 余白（Padding/Margin）

推奨値：
- 小: 8px
- 中: 16px
- 大: 24px
- 特大: 32px

### ボタンサイズ

- 最小タップ領域: 44x44px（iOS Human Interface Guidelines）
- 推奨高さ: 44-50px

### 角丸（Border Radius）

- 小: 4px
- 中: 8px
- 大: 12px
- 円形: 999px または 50%

## アニメーション

### デフォルトアニメーション

Cupertinoウィジェットは自動的にiOS標準のアニメーションを適用します。

### カスタムアニメーション

```dart
// フェードイン
AnimatedOpacity(
  opacity: _visible ? 1.0 : 0.0,
  duration: Duration(milliseconds: 300),
  child: YourWidget(),
)

// スライドイン
SlideTransition(
  position: _animation,
  child: YourWidget(),
)
```

### アニメーション時間

- 短: 200ms
- 中: 300ms
- 長: 500ms

## 参考リンク

- [iOS Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [Cupertino Widget Catalog](https://docs.flutter.dev/development/ui/widgets/cupertino)
- [Material Design Color Tool](https://material.io/resources/color/)
- [Coolors](https://coolors.co/) - カラーパレットジェネレーター
- [Adobe Color](https://color.adobe.com/) - カラーホイール

## ファイル構成

```
lib/
├── core/
│   └── constants/
│       └── app_colors.dart        # カラー定義
├── presentation/
│   ├── pages/                     # 各画面
│   └── widgets/                   # 共通ウィジェット
└── main.dart                      # テーマ設定
```

## まとめ

- カラーは`app_colors.dart`で一元管理
- Cupertinoデザインシステムを使用
- iOS Human Interface Guidelinesに準拠
- アクセシビリティとコントラストに配慮
- ブランドカラーでアプリを個性化





