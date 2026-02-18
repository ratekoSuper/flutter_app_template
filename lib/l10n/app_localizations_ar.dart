// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'قالب التطبيق';

  @override
  String get settings => 'الإعدادات';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String get language => 'اللغة';

  @override
  String get subscription => 'الاشتراك';

  @override
  String get restorePurchases => 'استعادة المشتريات';

  @override
  String get ok => 'موافق';

  @override
  String get cancel => 'إلغاء';

  @override
  String get maintenance => 'قيد الصيانة';

  @override
  String get maintenanceMessage =>
      'التطبيق قيد الصيانة حاليًا. يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get updateRequired => 'التحديث مطلوب';

  @override
  String get updateRequiredMessage =>
      'يرجى التحديث إلى أحدث إصدار لمواصلة استخدام التطبيق.';

  @override
  String get updateRecommended => 'يوصى بالتحديث';

  @override
  String get updateRecommendedMessage =>
      'يتوفر إصدار جديد. نوصي بالتحديث للحصول على أفضل تجربة.';

  @override
  String get update => 'تحديث';
}
