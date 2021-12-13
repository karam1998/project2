import 'package:flutter/material.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';

class NoFavourite extends StatelessWidget {
  const NoFavourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("images/no_favourites.png"),
        SizedBox(height: SizeConfig.scaleHeight(15),),
        TextApp(text: "No favourites products added", fontSize: 16, fontColor: Colors.black, fontWeight: FontWeight.bold,),
        SizedBox(height: SizeConfig.scaleHeight(15),),
        TextApp(text: "Add products to be able to access products", fontSize: 14, fontColor: Colors.grey.shade500, fontWeight: FontWeight.w500,),

      ],
    );
  }
}
