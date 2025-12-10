import 'package:firebase_app_check/firebase_app_check.dart';

class FirebaseAppCheckService {
  Future<void> activate() async {
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.debug,
    );
  }

  Future<String?> getToken({bool forceRefresh = false}) async {
    final token = await FirebaseAppCheck.instance.getToken(forceRefresh);
    return token;
  }
}




