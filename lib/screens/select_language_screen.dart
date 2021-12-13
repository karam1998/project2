import 'package:flutter/material.dart';
import 'package:project2/getx_controller/language_getx_controller.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  _SelectLanguageScreenState createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  String _selectedLanguage = UserPreferences().codeLang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          top: SizeConfig.scaleHeight(39),
        ),
        children: [
          TextApp(
            text: AppLocalizations.of(context)!.choose_languages,
            fontColor: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(17),
          ),
          TextApp(
            text: AppLocalizations.of(context)!.select_lang_desc,
            fontColor: AppColor.SUB_TITLE_PAGEVIEW,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          Column(
            children: [
              RadioListTile<String>(
                value: "ar",
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  print(value);
                  setState(() {
                    _selectedLanguage = value ?? "ar";
                    UserPreferences().setLanguage(_selectedLanguage);
                    LanguageGetXController.to.changeLanguage(_selectedLanguage);
                    print(UserPreferences().setLanguage(_selectedLanguage));
                  });
                },
                title: const Text("Arabic"),
                activeColor: AppColor.INDICATOR_PAGEVIEW,
              ),
              RadioListTile<String>(
                value: "en",
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  print(value);
                  setState(() {
                    _selectedLanguage = value ?? "en";
                    UserPreferences().setLanguage(_selectedLanguage);
                    LanguageGetXController.to.changeLanguage(_selectedLanguage);
                    print(UserPreferences().setLanguage(_selectedLanguage));
                  });
                },
                title: const Text("English"),
                activeColor: AppColor.INDICATOR_PAGEVIEW,
              ),
            ],
          )
        ],
      ),
    );
  }
}
