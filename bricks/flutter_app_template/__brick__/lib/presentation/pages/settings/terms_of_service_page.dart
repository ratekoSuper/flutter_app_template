import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name}}/core/constants/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:{{project_name}}/l10n/app_localizations.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(l10n.termsOfService)),
      child: SafeArea(
        child: Center(
          child: CupertinoButton(
            onPressed: () async {
              final Uri url = Uri.parse(AppConstants.termsOfServiceUrl);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            child: Text(l10n.termsOfService),
          ),
        ),
      ),
    );
  }
}

