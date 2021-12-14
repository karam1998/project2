import 'package:flutter/material.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';

class OnBoardingContent extends StatelessWidget {
  final String image;
  final int currentPage;
  final String title;
  final String subTitle;

  const OnBoardingContent(
      {required this.image,
      required this.currentPage,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.contain,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  AppColor.INDICATOR_PAGEVIEW.withOpacity(0.70),
                  Colors.black.withOpacity(0.80),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd),
          ),
        ),
        PositionedDirectional(
          top: SizeConfig.scaleHeight(250),
          start: 0,
          end: 0,
          child: TextApp(
            text: title,
            fontSize: 16,
            fontColor: Colors.white,
            fontWeight: FontWeight.w500,
            height: 2,
          ),
        ),
        SizedBox(
          height: SizeConfig.scaleHeight(7),
        ),
        PositionedDirectional(
          top: SizeConfig.scaleHeight(350),
          start: 0,
          end: 0,
          child: TextApp(
            text: subTitle,
            fontSize: 14,
            fontColor: Colors.white70,
            fontWeight: FontWeight.w300,
            height: 2,
          ),
        ),
      ],
    );
  }
}
