import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/getx_controller/favorite_product_getx_controller.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';

class ProductHome extends StatefulWidget {
  final String name;
  final String category;
  final String price;
  final String image;
  final double width;
  final int productId;

  const ProductHome({
    Key? key,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.width,
    required this.productId,
  }) : super(key: key);

  @override
  _ProductHomeState createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  @override
  Widget build(BuildContext context) {
    FavoriteProductGetxController.to.readFavoriteProducts();
    return Container(
      width: SizeConfig.scaleWidth(170),
      margin: EdgeInsetsDirectional.only(
        end: SizeConfig.scaleWidth(7),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.scaleWidth(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.network(
                  widget.image,
                  alignment: AlignmentDirectional.topCenter,
                  fit: BoxFit.cover,
                  width: widget.width,
                  height: SizeConfig.scaleHeight(160),
                ),
                Obx(
                  () {
                    return IconButton(
                      icon: Icon(
                        FavoriteProductGetxController.to.favoriteProducts
                                .where(
                                    (element) => element.id == widget.productId)
                                .isNotEmpty
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: AppColor.COLOR_BUTTON,
                      ),
                      onPressed: () {
                        FavoriteProductGetxController.to.addFavoriteProduct(
                            context,
                            productId: widget.productId);
                      },
                    );
                  },
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(8),
            ),
            TextApp(
              text: widget.name,
              fontSize: 16,
              fontColor: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(7),
            ),
            TextApp(
              text: widget.category,
              fontSize: 14,
              fontColor: AppColor.INDICATOR_PAGEVIEW,
              fontWeight: FontWeight.w500,
            ),
            TextApp(
              text: "₪ ${widget.price}",
              fontSize: 16,
              fontColor: AppColor.PRICE,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
