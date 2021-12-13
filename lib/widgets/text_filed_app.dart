import 'package:flutter/material.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
class TextFiledApp extends StatelessWidget {

  final String hint;
  final IconData prefixIcon;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscure;
  TextFiledApp({
   required this.hint,
   required this.prefixIcon,
   required this.controller,
    this.textInputType = TextInputType.text,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: AppColor.SUB_TITLE_PAGEVIEW,
            fontSize: SizeConfig.scaleTextFont(14),
            fontWeight: FontWeight.w300,
            fontFamily: "Circular Std" ,
          ),
          prefixIcon: Icon(prefixIcon, color: AppColor.INDICATOR_PAGEVIEW,),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.TEXT_FlIED_BORDER,
            ),
          ),
          focusedBorder:  UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade700,
            ),
          ),
        )
    );
  }
}