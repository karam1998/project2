import 'package:flutter/material.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextApp(
          text: AppLocalizations.of(context)!.support,
          fontSize: 18,
          fontColor: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Image.asset("images/support.png"),
          TextApp(
            text: AppLocalizations.of(context)!.get_support,
            fontColor: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(16),
          ),
          TextApp(
            text: AppLocalizations.of(context)!.support_desc,
            fontColor: AppColor.SUB_TITLE_PAGEVIEW,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(49),
          ),
          TextApp(
            text: '${AppLocalizations.of(context)!.call_us} => +972595783031',
            fontColor: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          TextApp(
            text:
                '${AppLocalizations.of(context)!.mail_us} => karm.shaat@gmail.com',
            fontColor: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
