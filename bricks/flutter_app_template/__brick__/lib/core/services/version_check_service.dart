import 'package:{{project_name}}/core/services/remote_config_service.dart';

enum VersionStatus {
  upToDate,
  updateRecommended,
  updateRequired,
  maintenance,
}

class VersionCheckService {
  final RemoteConfigService _remoteConfigService;

  VersionCheckService(this._remoteConfigService);

  VersionStatus checkVersion(String currentVersion) {
    if (_remoteConfigService.isMaintenance) {
      return VersionStatus.maintenance;
    }

    final minimumVersion = _remoteConfigService.minimumVersion;
    final recommendedVersion = _remoteConfigService.recommendedVersion;

    if (_compareVersions(currentVersion, minimumVersion) < 0) {
      return VersionStatus.updateRequired;
    }

    if (_compareVersions(currentVersion, recommendedVersion) < 0) {
      return VersionStatus.updateRecommended;
    }

    return VersionStatus.upToDate;
  }

  int _compareVersions(String version1, String version2) {
    final v1Parts = version1.split('.').map(int.parse).toList();
    final v2Parts = version2.split('.').map(int.parse).toList();

    for (int i = 0; i < 3; i++) {
      final v1Part = i < v1Parts.length ? v1Parts[i] : 0;
      final v2Part = i < v2Parts.length ? v2Parts[i] : 0;

      if (v1Part < v2Part) return -1;
      if (v1Part > v2Part) return 1;
    }

    return 0;
  }
}

