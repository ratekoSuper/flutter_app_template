# サブスクリプション機能 仕様

## 概要
In-App Purchaseを使用したサブスクリプション機能を提供します。

## 実装済み機能

### 1. サブスクリプション商品の取得
- App Store / Google Play Consoleに登録された商品情報を取得

### 2. 商品の購入
- サブスクリプション商品の購入処理

### 3. 購入の復元
- 過去の購入履歴を復元

### 4. サブスクリプション状態の監視
- リアルタイムでサブスクリプション状態を監視

## アーキテクチャ

### ドメイン層
- `lib/domain/entities/subscription_product.dart`: 商品エンティティ
- `lib/domain/repositories/subscription_repository.dart`: リポジトリインターフェース

### データ層
- `lib/data/repositories/subscription_repository_impl.dart`: リポジトリ実装

### プレゼンテーション層
- `lib/presentation/pages/settings/settings_page.dart`: 設定画面（サブスクリプションセクション含む）

## 使用方法

### リポジトリの取得
```dart
final subscriptionRepository = ref.watch(subscriptionRepositoryProvider);
```

### 商品一覧の取得
```dart
final products = await subscriptionRepository.getProducts();
```

### 商品の購入
```dart
final success = await subscriptionRepository.purchaseProduct(productId);
```

### 購入の復元
```dart
final success = await subscriptionRepository.restorePurchases();
```

### サブスクリプション状態の監視
```dart
subscriptionRepository.subscriptionStream.listen((isSubscribed) {
  if (isSubscribed) {
    // サブスクリプション有効
  } else {
    // サブスクリプション無効
  }
});
```

## セットアップ手順

### 1. 商品IDの設定
`lib/data/repositories/subscription_repository_impl.dart`で商品IDを設定:
```dart
final Set<String> _productIds = {
  'your_subscription_product_id', // 実際の商品IDに置き換える
};
```

### 2. App Store Connect設定（iOS）
1. App Store Connectにログイン
2. アプリを選択
3. サブスクリプショングループを作成
4. サブスクリプション商品を追加

### 3. Google Play Console設定（Android）
1. Google Play Consoleにログイン
2. アプリを選択
3. 収益化 > 定期購入 から商品を追加

## ファイル構成
- `lib/domain/entities/subscription_product.dart`
- `lib/domain/repositories/subscription_repository.dart`
- `lib/data/repositories/subscription_repository_impl.dart`
- `lib/core/di/providers.dart`

## 注意事項
- テスト環境ではサンドボックスアカウントを使用してください
- 商品IDは必ず実際のものに置き換えてください
- 購入処理のエラーハンドリングを適切に実装してください



