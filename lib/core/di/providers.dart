import 'package:flutter_app_template/core/services/firebase_analytics_service.dart';
import 'package:flutter_app_template/core/services/firebase_app_check_service.dart';
import 'package:flutter_app_template/core/services/remote_config_service.dart';
import 'package:flutter_app_template/core/services/version_check_service.dart';
import 'package:flutter_app_template/data/repositories/subscription_repository_impl.dart';
import 'package:flutter_app_template/domain/repositories/subscription_repository.dart';
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

final subscriptionRepositoryProvider = Provider<SubscriptionRepository>((ref) {
  return SubscriptionRepositoryImpl();
});
