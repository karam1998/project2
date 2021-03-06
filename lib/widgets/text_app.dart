import 'package:flutter/material.dart';
import 'package:project2/utils/size_config.dart';
class TextApp extends StatelessWidget {

  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color fontColor;

  TextApp({
   required this.text,
    this.fontWeight = FontWeight.normal,
   required this.fontSize,
    this.textAlign = TextAlign.center,
    this.height = 1,
   required this.fontColor
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      softWrap: true,
      style: TextStyle(fontFamily: "CircularStd",
          fontWeight: fontWeight,
          fontSize: SizeConfig.scaleTextFont(fontSize),
          color: fontColor,
          height: height), textAlign: textAlign,);

  }
}
