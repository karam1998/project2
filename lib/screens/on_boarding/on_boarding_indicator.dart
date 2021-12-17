import 'package:flutter/material.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';

class OnBoardingIndicator extends StatelessWidget {
  final bool currentPage;

  const OnBoardingIndicator(this.currentPage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: currentPage ? SizeConfig.scaleWidth(10) : SizeConfig.scaleWidth(8),
      height:
          currentPage ? SizeConfig.scaleHeight(10) : SizeConfig.scaleHeight(8),
      decoration: BoxDecoration(
        color: currentPage
            ? AppColor.INDICATOR_PAGEVIEW
            : AppColor.SUB_TITLE_PAGEVIEW,
        shape: BoxShape.circle,
      ),
    );
  }
}
