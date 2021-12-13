import 'package:flutter/material.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';
import 'button_app.dart';

class SubCategoryHome extends StatelessWidget {
  final String title;
  final String image;

  const SubCategoryHome({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.scaleHeight(160),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.scaleWidth(10)),
        ),
        margin: EdgeInsetsDirectional.only(
          start: SizeConfig.scaleWidth(16),
          end: SizeConfig.scaleWidth(16),
        ),
        child: Stack(
          children: [
            Image.asset(
              image,
              alignment: AlignmentDirectional.topCenter,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            PositionedDirectional(
                top: SizeConfig.scaleHeight(41),
                start: SizeConfig.scaleWidth(19),
                child: TextApp(
                  text: title,
                  fontSize: 18,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            PositionedDirectional(
              bottom: SizeConfig.scaleHeight(21),
              start: SizeConfig.scaleWidth(48),
              child: ButtonApp(
                  text: "Shop now", onPressed: () {}, width: 98, height: 33),
            ),
          ],
        ),
      ),
    );
  }
}
