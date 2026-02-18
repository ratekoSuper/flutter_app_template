import 'package:flutter/cupertino.dart';
import 'package:flutter_app_template/core/constants/app_constants.dart';
import 'package:flutter_app_template/presentation/pages/settings/privacy_policy_page.dart';
import 'package:flutter_app_template/presentation/pages/settings/terms_of_service_page.dart';
import 'package:flutter_app_template/l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const Color _settingsBackground =
      CupertinoColors.systemGroupedBackground;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CupertinoTheme(
      data: CupertinoTheme.of(context).copyWith(
        scaffoldBackgroundColor: _settingsBackground,
        barBackgroundColor: _settingsBackground,
      ),
      child: CupertinoPageScaffold(
        backgroundColor: _settingsBackground,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: _settingsBackground,
          middle: Text(l10n.settings),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              CupertinoListSection.insetGrouped(
                header: Text(l10n.language),
                children: [
                  CupertinoListTile(
                    title: Text(l10n.language),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {},
                  ),
                ],
              ),
              CupertinoListSection.insetGrouped(
                children: [
                  CupertinoListTile(
                    title: Text(l10n.subscription),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {},
                  ),
                  CupertinoListTile(
                    title: Text(l10n.restorePurchases),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {},
                  ),
                ],
              ),
              CupertinoListSection.insetGrouped(
                children: [
                  CupertinoListTile(
                    title: Text(l10n.privacyPolicy),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const PrivacyPolicyPage(),
                        ),
                      );
                    },
                  ),
                  CupertinoListTile(
                    title: Text(l10n.termsOfService),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const TermsOfServicePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Version ${AppConstants.appVersion}',
                    style: CupertinoTheme.of(context).textTheme.textStyle
                        .copyWith(
                          color: CupertinoColors.systemGrey,
                          fontSize: 12,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
