import 'package:flutter/material.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';

class SettingsContainer extends StatelessWidget {
  final String textSettings;
  final String value;
  final VoidCallback onPressed;

  const SettingsContainer(
      {Key? key,
      required this.textSettings,
      required this.value,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: SizeConfig.scaleHeight(72),
        width: double.infinity,
        padding: EdgeInsetsDirectional.only(
          start: SizeConfig.scaleWidth(16),
          end: SizeConfig.scaleWidth(16),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
            )
          ],
        ),
        child: Row(
          children: [
            TextApp(
              text: textSettings,
              fontSize: 20,
              fontColor: AppColor.SUB_TITLE_PAGEVIEW,
              fontWeight: FontWeight.w400,
            ),
            const Spacer(),
            TextApp(
              text: value,
              fontSize: 16,
              fontColor: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
