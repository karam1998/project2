import 'package:flutter/material.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.COLOR_BACKGROUND_ABOUT,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextApp(
          text: AppLocalizations.of(context)!.about_us,
          fontSize: 20,
          fontColor: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(
              top: SizeConfig.scaleHeight(19),
              start: SizeConfig.scaleWidth(17),
              end: SizeConfig.scaleWidth(17),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: AppLocalizations.of(context)!.about_us,
                  fontSize: 16,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(8),
                ),
                TextApp(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi elementum, erat eu volutpat semper, magna nisl rutrum mi, eu convallis mauris mi vel tortor. Nulla vehicula orci a semper tincidunt. Nam consectetur interdum orci, ut venenatis diam lobortis ut. Aliquam mollis nunc enim, in fermentum tortor pulvinar vel. Cras at nisl risus. Mauris vehicula ultricies justo tempus lacinia. Donec laoreet magna ut sapien convallis fermentum. Curabitur lacinia augue a urna aliquet accumsan at a purus. Phasellus varius, arcu quis vestibulum dignissim, elit nisl ullamcorper lectus, at placerat risus enim id lectus.   Maecenas molestie, ipsum non dapibus viverra, mauris est convallis arcu, et eleifend quam eros nec nisl. Quisque pulvinar enim metus, nec dapibus tellus tempor non. Nulla sed placerat est, vitae volutpat turpis.   ",
                  fontSize: 13,
                  fontColor: AppColor.SUB_TITLE_PAGEVIEW,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(10),
          ),
          Container(
            padding: EdgeInsetsDirectional.only(
              top: SizeConfig.scaleHeight(19),
              start: SizeConfig.scaleWidth(17),
              end: SizeConfig.scaleWidth(17),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: "What is Name? ",
                  fontSize: 16,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(8),
                ),
                TextApp(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi elementum, erat eu volutpat semper, magna nisl rutrum mi, eu convallis mauris mi vel tortor. Nulla vehicula orci a semper tincidunt. Nam consectetur interdum orci, ut venenatis diam lobortis ut. Aliquam mollis nunc enim, in fermentum tortor pulvinar vel. Cras at nisl risus. Mauris vehicula ultricies justo tempus lacinia. Donec laoreet magna ut sapien convallis fermentum. Curabitur lacinia augue a urna aliquet accumsan at a purus. Phasellus varius, arcu quis vestibulum dignissim, elit nisl ullamcorper lectus, at placerat risus enim id lectus.   Maecenas molestie, ipsum non dapibus viverra, mauris est convallis arcu, et eleifend quam eros nec nisl. Quisque pulvinar enim metus, nec dapibus tellus tempor non. Nulla sed placerat est, vitae volutpat turpis.  ",
                  fontSize: 13,
                  fontColor: AppColor.SUB_TITLE_PAGEVIEW,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
