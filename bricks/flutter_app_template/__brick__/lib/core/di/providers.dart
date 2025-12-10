import 'package:{{project_name}}/core/services/firebase_analytics_service.dart';
import 'package:{{project_name}}/core/services/firebase_app_check_service.dart';
import 'package:{{project_name}}/core/services/remote_config_service.dart';
import 'package:{{project_name}}/core/services/version_check_service.dart';
{{#enable_subscription}}
import 'package:{{project_name}}/data/repositories/subscription_repository_impl.dart';
import 'package:{{project_name}}/domain/repositories/subscription_repository.dart';
{{/enable_subscription}}
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAnalyticsServiceProvider = Provider<FirebaseAnalyticsService>((ref) {
  return FirebaseAnalyticsService();
});

final firebaseAppCheckServiceProvider = Provider<FirebaseAppCheckService>((ref) {
  return FirebaseAppCheckService();
});

final remoteConfigServiceProvider = Provider<RemoteConfigService>((ref) {
  return RemoteConfigService();
});

final versionCheckServiceProvider = Provider<VersionCheckService>((ref) {
  final remoteConfigService = ref.watch(remoteConfigServiceProvider);
  return VersionCheckService(remoteConfigService);
});

{{#enable_subscription}}
final subscriptionRepositoryProvider = Provider<SubscriptionRepository>((ref) {
  return SubscriptionRepositoryImpl();
});
{{/enable_subscription}}




