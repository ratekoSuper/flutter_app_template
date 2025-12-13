import 'package:flutter/cupertino.dart';

/// アプリ全体で使用するカラーテーマ
///
/// ここでプライマリカラー、セカンダリカラーなどを定義します。
/// アプリのブランドカラーに合わせて変更してください。
class AppColors {
  AppColors._();

  // ==================== プライマリカラー ====================
  /// メインカラー（ブランドカラー）
  /// ボタン、アクセントなど、アプリの主要な要素に使用
  static const Color primary = CupertinoColors.systemBlue;

  /// プライマリカラーの明るいバリエーション
  static const Color primaryLight = CupertinoColors.systemBlue;

  /// プライマリカラーの暗いバリエーション
  static const Color primaryDark = CupertinoColors.systemBlue;

  // ==================== セカンダリカラー ====================
  /// サブカラー
  /// 補助的な要素やアクセントに使用
  static const Color secondary = CupertinoColors.systemGreen;

  /// セカンダリカラーの明るいバリエーション
  static const Color secondaryLight = CupertinoColors.systemGreen;

  /// セカンダリカラーの暗いバリエーション
  static const Color secondaryDark = CupertinoColors.systemGreen;

  // ==================== 背景色 ====================
  /// メインの背景色（ライトモード）
  static const Color backgroundLight = CupertinoColors.systemBackground;

  /// メインの背景色（ダークモード）
  static const Color backgroundDark = CupertinoColors.black;

  /// セカンダリ背景色（ライトモード）
  static const Color secondaryBackgroundLight =
      CupertinoColors.secondarySystemBackground;

  /// セカンダリ背景色（ダークモード）
  static const Color secondaryBackgroundDark =
      CupertinoColors.secondarySystemBackground;

  // ==================== テキストカラー ====================
  /// プライマリテキストカラー
  static const Color textPrimary = CupertinoColors.label;

  /// セカンダリテキストカラー（説明文など）
  static const Color textSecondary = CupertinoColors.secondaryLabel;

  /// 無効なテキストカラー
  static const Color textDisabled = CupertinoColors.systemGrey;

  /// プレースホルダーテキストカラー
  static const Color textPlaceholder = CupertinoColors.placeholderText;

  // ==================== 境界線・区切り線 ====================
  /// 境界線の色
  static const Color border = CupertinoColors.separator;

  /// 薄い境界線の色
  static const Color borderLight = CupertinoColors.opaqueSeparator;

  // ==================== ステータスカラー ====================
  /// 成功を表す色
  static const Color success = CupertinoColors.systemGreen;

  /// 警告を表す色
  static const Color warning = CupertinoColors.systemOrange;

  /// エラーを表す色
  static const Color error = CupertinoColors.systemRed;

  /// 情報を表す色
  static const Color info = CupertinoColors.systemBlue;

  // ==================== その他 ====================
  /// リンクの色
  static const Color link = CupertinoColors.link;

  /// シャドウの色
  static const Color shadow = CupertinoColors.systemGrey;

  /// オーバーレイの色（半透明）
  static const Color overlay = CupertinoColors.systemGrey;
}





