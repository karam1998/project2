import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/getx_controller/favorite_product_getx_controller.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/no_favourite.dart';
import 'package:project2/widgets/text_app.dart';
import '../../details_product_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<FavoriteProductGetxController>(
      builder: (FavoriteProductGetxController controller) {
        return controller.favoriteProducts.isEmpty
            ? const Center(
                child: NoFavourite(),
              )
            : ListView(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: SizeConfig.scaleHeight(16),
                      end: SizeConfig.scaleHeight(16),
                      bottom: SizeConfig.scaleHeight(20),
                    ),
                    child: TextApp(
                      text: "Total ${controller.favoriteProducts.length}",
                      fontColor: Colors.black,
                      fontSize: 22,
                      textAlign: TextAlign.end,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListView.builder(
                    itemCount: controller.favoriteProducts.length,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // final categoryId = CategoryGetxController.to.category[index].id;
                      // SubCategoryGetxController.to.readSubCategories(categoryId);
                      // final subCategoryIndex = controller.favoriteProducts.indexWhere((element) => element.subCategoryId == SubCategoryGetxController.to.subCategory[index].id);
                      return Container(
                        padding: EdgeInsetsDirectional.only(
                          start: SizeConfig.scaleWidth(16),
                          end: SizeConfig.scaleWidth(16),
                          top: SizeConfig.scaleHeight(10),
                          bottom: SizeConfig.scaleHeight(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsProductScreen(
                                      productId: controller
                                          .favoriteProducts[index]
                                          .pivot!
                                          .productId),
                                ),
                              ),
                              child: Card(
                                clipBehavior: Clip.hardEdge,
                                child: Image.network(
                                  controller.favoriteProducts[index].imageUrl,
                                  width: SizeConfig.scaleWidth(100),
                                  height: SizeConfig.scaleHeight(100),
                                  fit: BoxFit.contain,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10),
                                  side: BorderSide.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.scaleWidth(10),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextApp(
                                    text: controller
                                        .favoriteProducts[index].nameEn,
                                    fontSize: 18,
                                    fontColor: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.scaleHeight(15),
                                  ),

                                  // TextApp(
                                  //   text: subCategoryController.subCategory[subCategoryIndex].nameEn,
                                  //   fontSize: 16,
                                  //   fontColor: AppColor.INDICATOR_PAGEVIEW,
                                  //   fontWeight: FontWeight.w500,
                                  // ),
                                  SizedBox(
                                    height: SizeConfig.scaleHeight(10),
                                  ),
                                  TextApp(
                                    text:
                                        "${controller.favoriteProducts[index].price} ₪",
                                    fontSize: 16,
                                    fontColor: AppColor.PRICE,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                            // Spacer(),
                            InkWell(
                              onTap: () => FavoriteProductGetxController.to
                                  .addFavoriteProduct(context,
                                      productId: controller
                                          .favoriteProducts[index].id),
                              child: Icon(
                                FavoriteProductGetxController
                                        .to.favoriteProducts
                                        .where((element) =>
                                            element.id ==
                                            controller
                                                .favoriteProducts[index].id)
                                        .isNotEmpty
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: SizeConfig.scaleWidth(29),
                                color: AppColor.COLOR_BUTTON,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              );
      },
    );
  }
}
