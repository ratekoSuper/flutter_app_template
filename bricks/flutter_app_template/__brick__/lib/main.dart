import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:{{project_name}}/core/di/providers.dart';
import 'package:{{project_name}}/core/constants/app_colors.dart';
import 'package:{{project_name}}/presentation/pages/settings/settings_page.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Firebaseの有効化/無効化（true=有効, false=無効）
const bool enableFirebase = {{enable_firebase}};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (enableFirebase) {
    await Firebase.initializeApp();
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  Future<void> _initializeServices() async {
    if (!enableFirebase) {
      return;
    }

    final appCheckService = ref.read(firebaseAppCheckServiceProvider);
    await appCheckService.activate();

    final remoteConfigService = ref.read(remoteConfigServiceProvider);
    await remoteConfigService.initialize();

    final analyticsService = ref.read(firebaseAnalyticsServiceProvider);
    await analyticsService.logAppOpen();

    final subscriptionRepository = ref.read(subscriptionRepositoryProvider);
    await subscriptionRepository.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: '{{app_name}}',
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
      theme: CupertinoThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.backgroundLight,
        barBackgroundColor: AppColors.backgroundLight,
        textTheme: const CupertinoTextThemeData(
          primaryColor: AppColors.textPrimary,
        ),
      ),
      home: const SettingsPage(),
    );
  }
}

