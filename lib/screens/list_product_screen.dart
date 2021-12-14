import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/getx_controller/product_getx_controller.dart';
import 'package:project2/getx_controller/sub_category_getx_controller.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'details_product_screen.dart';

class ListProductScreen extends StatefulWidget {
  int subCategoryId;
  int categoryId;

  ListProductScreen(
      {Key? key, required this.subCategoryId, required this.categoryId})
      : super(key: key);

  @override
  _ListProductScreenState createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  @override
  Widget build(BuildContext context) {
    ProductGetxController controller = Get.put(ProductGetxController());

    SubCategoryGetxController subCategoryController =
        Get.put(SubCategoryGetxController());

    ProductGetxController.to.readProducts(widget.subCategoryId);

    var size = MediaQuery.of(context).size;
    return GetX<ProductGetxController>(
      init: ProductGetxController(),
      builder: (ProductGetxController controller) {
        print("Length : ${controller.product.length}");
        final indexCategory = SubCategoryGetxController.to.subCategory
            .indexWhere((element) => element.id == widget.subCategoryId);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: TextApp(
              text: SubCategoryGetxController
                  .to.subCategory[indexCategory].nameEn,
              fontSize: 20,
              fontColor: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
          ),
          body: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.product.isNotEmpty
                  ? SizedBox(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: controller.product.length,
                        shrinkWrap: true,
                        padding: EdgeInsetsDirectional.only(
                          end: SizeConfig.scaleWidth(5),
                          start: SizeConfig.scaleWidth(24),
                        ),
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsProductScreen(
                                  productId: controller.product[index].id,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Card(
                                child: Column(
                                  children: [
                                    Image.network(
                                        controller.product[index].image_url,
                                        alignment:
                                            AlignmentDirectional.topCenter,
                                        fit: BoxFit.contain,
                                        width: double.infinity,
                                        height: 100),
                                    Spacer(),

                                    TextApp(
                                      text: controller.product[index].nameEn,
                                      fontSize: 18,
                                      fontColor: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Spacer(),
                                    TextApp(
                                      text: SubCategoryGetxController
                                          .to.subCategory[indexCategory].nameEn,
                                      fontSize: 16,
                                      fontColor: AppColor.INDICATOR_PAGEVIEW,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    // SizedBox(height: SizeConfig.scaleHeight(4),),
                                    Spacer(),
                                    TextApp(
                                      text: controller.product[index].price
                                          .toString(),
                                      fontSize: 14,
                                      fontColor: AppColor.PRICE,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: Text("No Product here"),
                    ),
        );
      },
    );
  }
}
