import 'package:flutter/material.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/settings_container.dart';
import 'package:project2/widgets/text_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.COLOR_BACKGROUND_SETTINGS,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextApp(
          text: AppLocalizations.of(context)!.settings,
          fontSize: 18,
          fontColor: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          top: SizeConfig.scaleHeight(12),
          bottom: SizeConfig.scaleHeight(11),
        ),
        children: [
          SettingsContainer(
            textSettings: AppLocalizations.of(context)!.language,
            value: UserPreferences().codeLang == 'en' ? "English" : "Arabic",
            onPressed: () =>
                Navigator.pushNamed(context, "/select_language_screen"),
          ),
          SettingsContainer(
              textSettings: AppLocalizations.of(context)!.currency,
              value: "shekel",
              onPressed: () {}),
          SizedBox(
            height: SizeConfig.scaleHeight(86),
          ),
          SettingsContainer(
              textSettings: AppLocalizations.of(context)!.about_us,
              value: "",
              onPressed: () =>
                  Navigator.pushNamed(context, "/about_us_screen")),
          SettingsContainer(
              textSettings: AppLocalizations.of(context)!.support,
              value: "",
              onPressed: () => Navigator.pushNamed(context, "/support_screen")),
          SettingsContainer(
              textSettings: AppLocalizations.of(context)!.privacy_policy,
              value: "",
              onPressed: () =>
                  _launchURL("https://smart-store.mr-dev.tech/privacy-policy")),
          SettingsContainer(
              textSettings: AppLocalizations.of(context)!.terms_conditions,
              value: "",
              onPressed: () {}),
          SizedBox(
            height: SizeConfig.scaleHeight(86),
          ),
          TextApp(
            text: "${AppLocalizations.of(context)!.version} 1.0.0",
            fontSize: 14,
            fontColor: AppColor.SUB_TITLE_PAGEVIEW,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
