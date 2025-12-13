# アーキテクチャ 仕様

## 概要
このプロジェクトはオニオンアーキテクチャを採用しています。

## オニオンアーキテクチャとは

オニオンアーキテクチャは、依存関係を内側から外側に向けて構成するアーキテクチャパターンです。
内側の層は外側の層に依存せず、外側の層が内側の層に依存します。

## 層の構成

### 1. ドメイン層（Domain Layer）
最も内側の層で、ビジネスロジックを含みます。

#### 構成要素
- **エンティティ（Entities）**: ビジネスオブジェクト
- **リポジトリインターフェース（Repositories）**: データアクセスの抽象化
- **ユースケース（Use Cases）**: ビジネスロジックの実行

#### ディレクトリ構成
```
lib/domain/
├── entities/              # エンティティ
│   └── subscription_product.dart
├── repositories/          # リポジトリインターフェース
│   └── subscription_repository.dart
└── usecases/             # ユースケース（今後追加予定）
```

#### 依存関係
- 他の層に依存しない
- Flutterフレームワークに依存しない純粋なDartコード

### 2. データ層（Data Layer）
ドメイン層の外側にあり、データの取得・保存を担当します。

#### 構成要素
- **データソース（Data Sources）**: データの取得元
  - ローカル（Local）: Hive, SQLite, SharedPreferencesなど
  - リモート（Remote）: API通信など
- **モデル（Models）**: データ転送オブジェクト
- **リポジトリ実装（Repositories）**: ドメイン層のリポジトリインターフェースを実装

#### ディレクトリ構成
```
lib/data/
├── datasources/
│   ├── local/            # ローカルデータソース
│   └── remote/           # リモートデータソース
├── models/               # データモデル
└── repositories/         # リポジトリ実装
    └── subscription_repository_impl.dart
```

#### 依存関係
- ドメイン層に依存
- プレゼンテーション層には依存しない

### 3. プレゼンテーション層（Presentation Layer）
最も外側の層で、UIと状態管理を担当します。

#### 構成要素
- **ページ（Pages）**: 画面
- **プロバイダー（Providers）**: 状態管理（Riverpod）
- **ウィジェット（Widgets）**: 再利用可能なUIコンポーネント

#### ディレクトリ構成
```
lib/presentation/
├── pages/                # 画面
│   └── settings/
│       ├── settings_page.dart
│       ├── privacy_policy_page.dart
│       └── terms_of_service_page.dart
├── providers/            # 状態管理
└── widgets/              # 再利用可能なウィジェット
```

#### 依存関係
- ドメイン層に依存
- データ層に直接依存しない（依存性注入を通じて間接的に使用）

### 4. コア層（Core Layer）
横断的関心事を担当します。

#### 構成要素
- **DI（Dependency Injection）**: 依存性注入
- **サービス（Services）**: 共通サービス
- **定数（Constants）**: 定数定義

#### ディレクトリ構成
```
lib/core/
├── di/                   # 依存性注入
│   └── providers.dart
├── services/             # 共通サービス
│   ├── firebase_analytics_service.dart
│   ├── firebase_app_check_service.dart
│   ├── remote_config_service.dart
│   └── version_check_service.dart
└── constants/            # 定数定義
    └── app_constants.dart
```

## 依存性注入（Dependency Injection）

### Riverpodを使用したDI

すべての依存関係はRiverpodのProviderを通じて管理されます。

#### プロバイダーの定義（lib/core/di/providers.dart）
```dart
final subscriptionRepositoryProvider = Provider<SubscriptionRepository>((ref) {
  return SubscriptionRepositoryImpl();
});
```

#### プロバイダーの使用
```dart
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(subscriptionRepositoryProvider);
    // ...
  }
}
```

## データフロー

```
User Action
    ↓
Presentation Layer (UI)
    ↓
Provider (State Management)
    ↓
Domain Layer (Use Case)
    ↓
Repository Interface
    ↓
Data Layer (Repository Implementation)
    ↓
Data Source (Local/Remote)
    ↓
External Data (API/Database)
```

## 利点

1. **テスタビリティ**: 各層を独立してテスト可能
2. **保守性**: 関心事が明確に分離されている
3. **拡張性**: 新機能の追加が容易
4. **依存関係の明確化**: 依存方向が一方向
5. **ビジネスロジックの独立性**: UIやフレームワークから独立

## ベストプラクティス

1. **ドメイン層はフレームワークに依存しない**: 純粋なDartコードのみ
2. **リポジトリパターン**: データアクセスを抽象化
3. **依存性注入**: Riverpodを使用して依存関係を管理
4. **単一責任の原則**: 各クラスは1つの責任のみを持つ
5. **インターフェース分離の原則**: 必要なメソッドのみを定義





