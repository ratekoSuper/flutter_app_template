import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initialize() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );

    await _remoteConfig.setDefaults({
      'minimum_version': '1.0.0',
      'recommended_version': '1.0.0',
      'is_maintenance': false,
      'ios_app_url': '',
      'android_app_url': '',
    });

    await _remoteConfig.fetchAndActivate();
  }

  String get minimumVersion => _remoteConfig.getString('minimum_version');

  String get recommendedVersion => _remoteConfig.getString('recommended_version');

  bool get isMaintenance => _remoteConfig.getBool('is_maintenance');

  String get iosAppUrl => _remoteConfig.getString('ios_app_url');

  String get androidAppUrl => _remoteConfig.getString('android_app_url');

  Future<void> fetchAndActivate() async {
    await _remoteConfig.fetchAndActivate();
  }
}




