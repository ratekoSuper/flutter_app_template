# 多言語対応 仕様

## 概要
12言語に対応した多言語対応機能を提供します。

## サポート言語

1. 英語（アメリカ）- en（プライマリ言語）
2. 日本語 - ja
3. アラビア語 - ar
4. イタリア語 - it
5. インドネシア語 - id
6. スペイン語 - es
7. ドイツ語 - de
8. ヒンディー語 - hi
9. フランス語 - fr
10. ポルトガル語 - pt
11. ロシア語 - ru
12. 韓国語 - ko

## 実装済み文字列

- アプリタイトル
- 設定
- プライバシーポリシー
- 利用規約
- 言語
- サブスクリプション
- 購入を復元
- OK / キャンセル
- メンテナンス関連メッセージ
- アップデート関連メッセージ

## 使用方法

### 1. Widgetで多言語文字列を使用
```dart
import 'l10n/app_localizations.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Text(l10n.appTitle);
  }
}
```

### 2. 新しい文字列の追加

#### Step 1: プライマリ言語（英語）のARBファイルに追加
`lib/l10n/app_en.arb`:
```json
{
  "newString": "New String",
  "@newString": {
    "description": "Description of the new string"
  }
}
```

#### Step 2: 他の言語のARBファイルにも追加
各言語のARBファイル（`app_ja.arb`, `app_ar.arb`など）に翻訳を追加:
```json
{
  "newString": "新しい文字列"
}
```

#### Step 3: コード生成
```bash
flutter gen-l10n
```

または

```bash
flutter pub get
```

## ファイル構成

### 設定ファイル
- `l10n.yaml`: 多言語対応の設定ファイル
- `pubspec.yaml`: `generate: true`を設定

### ARBファイル（lib/l10n/）
- `app_en.arb`: 英語（プライマリ）
- `app_ja.arb`: 日本語
- `app_ar.arb`: アラビア語
- `app_it.arb`: イタリア語
- `app_id.arb`: インドネシア語
- `app_es.arb`: スペイン語
- `app_de.arb`: ドイツ語
- `app_hi.arb`: ヒンディー語
- `app_fr.arb`: フランス語
- `app_pt.arb`: ポルトガル語
- `app_ru.arb`: ロシア語
- `app_ko.arb`: 韓国語

### 生成ファイル
- `.dart_tool/flutter_gen/gen_l10n/`: 自動生成される多言語対応クラス

## main.dartでの設定

```dart
CupertinoApp(
  localizationsDelegates: const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('en', ''),
    Locale('ja', ''),
    Locale('ar', ''),
    Locale('it', ''),
    Locale('id', ''),
    Locale('es', ''),
    Locale('de', ''),
    Locale('hi', ''),
    Locale('fr', ''),
    Locale('pt', ''),
    Locale('ru', ''),
    Locale('ko', ''),
  ],
  // ...
);
```

## 注意事項

- 新しい文字列を追加した後は必ず`flutter gen-l10n`を実行してください
- プライマリ言語（英語）のARBファイルには必ず`@`プレフィックス付きの説明を追加してください
- 他の言語のARBファイルには説明は不要です（キーと値のみ）
- アラビア語など右から左に読む言語は自動的にレイアウトが調整されます
