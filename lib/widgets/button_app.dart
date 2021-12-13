import 'package:flutter/material.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';
class ButtonApp extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color buttonColor;
  final double fontSize;
  final Color fontColor;
  final Color colorBorder;

  ButtonApp({
   required this.text,
   required this.onPressed,
   required this.width,
  required this.height,
    this.buttonColor=  AppColor.COLOR_BUTTON,
    this.fontSize  = 16,
    this.fontColor = Colors.white,
    this.colorBorder = Colors.transparent
  });

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      child: TextApp(text: text , fontColor: fontColor, fontWeight: FontWeight.bold, fontSize: fontSize,),
      style: ElevatedButton.styleFrom(
          primary: buttonColor,
          minimumSize: Size(SizeConfig.scaleWidth(width), SizeConfig.scaleHeight(height)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
            side: BorderSide(
              color: colorBorder,
            )
          ),
      ),
    );
  }
}
