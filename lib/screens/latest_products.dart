import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/getx_controller/favorite_product_getx_controller.dart';
import 'package:project2/getx_controller/home_getx_controller.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';

class LatestProducts extends StatelessWidget {
  const LatestProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteProductGetxController.to.readFavoriteProducts();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: TextApp(
          text: "Latest products",
          fontSize: 18,
          fontColor: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: GetX<HomeGetXController>(
        builder: (HomeGetXController controller) {
          return ListView.builder(
            padding: EdgeInsetsDirectional.only(
              start: SizeConfig.scaleWidth(15),
              end: SizeConfig.scaleWidth(15),
            ),
            itemCount: controller.latestProducts.length,
            itemBuilder: (context, index) {
              return Container(
                child: Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: Image.network(
                        controller.latestProducts[index].image_url,
                        width: SizeConfig.scaleWidth(110),
                        height: SizeConfig.scaleHeight(110),
                        alignment: AlignmentDirectional.topCenter,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.scaleWidth(20),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextApp(
                            text: controller.latestProducts[index].nameEn,
                            fontSize: 16,
                            fontColor: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: SizeConfig.scaleHeight(20),
                          ),
                          TextApp(
                            text: controller.categories[index].nameEn,
                            fontSize: 14,
                            fontColor: AppColor.INDICATOR_PAGEVIEW,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: SizeConfig.scaleHeight(20),
                          ),
                          TextApp(
                            text: "${controller.latestProducts[index].price}",
                            fontSize: 14,
                            fontColor: AppColor.PRICE,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => IconButton(
                        onPressed: () => FavoriteProductGetxController.to
                            .addFavoriteProduct(context,
                                productId: controller.latestProducts[index].id),
                        icon: Icon(
                          FavoriteProductGetxController.to.favoriteProducts
                                  .where((element) =>
                                      element.id ==
                                      controller.latestProducts[index].id)
                                  .isNotEmpty
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: AppColor.COLOR_BUTTON,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
