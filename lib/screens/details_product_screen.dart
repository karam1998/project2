import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:project2/api/api_setting.dart';
import 'package:project2/getx_controller/favorite_product_getx_controller.dart';
import 'package:project2/getx_controller/product_details_getx_controller.dart';
import 'package:project2/getx_controller/product_rate_getx_controller.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/helpers.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsProductScreen extends StatefulWidget {
  int productId;

  DetailsProductScreen({Key? key, required this.productId}) : super(key: key);

  @override
  _DetailsProductScreenState createState() => _DetailsProductScreenState();
}

class _DetailsProductScreenState extends State<DetailsProductScreen>
    with Helper {
  @override
  void dispose() {
    // TODO: implement dispose
    ProductDetailsGetxController.to.productDetails.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProductDetailsGetxController controller =
        Get.put(ProductDetailsGetxController());
    ProductDetailsGetxController.to.readProductsDetails(widget.productId);
    ProductRateGetxController productRate =
        Get.put(ProductRateGetxController());
    return GetX<ProductDetailsGetxController>(
      init: ProductDetailsGetxController(),
      builder: (ProductDetailsGetxController controller) {
        double _rating = controller.productDetails.isNotEmpty
            ? double.parse(controller.productDetails[0]!.productRate.toString())
            : 0;

        return SafeArea(
          child: Scaffold(
              extendBody: true,
              body: controller.productDetails.isNotEmpty
                  ? ListView(
                      shrinkWrap: true,
                      padding: EdgeInsetsDirectional.only(
                        bottom: SizeConfig.scaleHeight(10),
                      ),
                      physics: const ScrollPhysics(),
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft:
                                  Radius.circular(SizeConfig.scaleWidth(70)),
                              bottomRight:
                                  Radius.circular(SizeConfig.scaleWidth(70)),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Image.network(
                                ApiSettings.BASE_URL_STORAGE +
                                    controller
                                        .productDetails[0]!.images![0].url,
                                fit: BoxFit.contain,
                                width: double.infinity,
                                height: SizeConfig.scaleHeight(330),
                              ),
                              PositionedDirectional(
                                  start: SizeConfig.scaleWidth(18),
                                  top: SizeConfig.scaleHeight(18),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                  )),
                              PositionedDirectional(
                                start: SizeConfig.scaleWidth(10),
                                top: SizeConfig.scaleHeight(60),
                                child: SizedBox(
                                  height: SizeConfig.scaleHeight(300),
                                  child: Column(
                                    children: [
                                      // Expanded(child: CircleAvatar(backgroundImage: AssetImage("images/3.png"), , radius: SizeConfig.scaleWidth(24),)),
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        width: SizeConfig.scaleWidth(100),
                                        height: SizeConfig.scaleHeight(100),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Image.network(
                                          ApiSettings.BASE_URL_STORAGE +
                                              controller.productDetails[0]!
                                                  .images![0].url,
                                          fit: BoxFit.contain,
                                          alignment:
                                              AlignmentDirectional.topCenter,
                                        ),
                                      ),
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        width: SizeConfig.scaleWidth(80),
                                        height: SizeConfig.scaleHeight(80),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Image.network(
                                          ApiSettings.BASE_URL_STORAGE +
                                              controller.productDetails[0]!
                                                  .images![1].url,
                                          fit: BoxFit.contain,
                                          alignment:
                                              AlignmentDirectional.topCenter,
                                        ),
                                      ),

                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        width: SizeConfig.scaleWidth(80),
                                        height: SizeConfig.scaleHeight(80),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Image.network(
                                          ApiSettings.BASE_URL_STORAGE +
                                              controller.productDetails[0]!
                                                  .images![2].url,
                                          fit: BoxFit.contain,
                                          alignment:
                                              AlignmentDirectional.topCenter,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Obx(
                                () => PositionedDirectional(
                                  end: SizeConfig.scaleWidth(28),
                                  bottom: SizeConfig.scaleHeight(24),
                                  child: InkWell(
                                    onTap: () {
                                      FavoriteProductGetxController.to
                                          .addFavoriteProduct(context,
                                              productId: controller
                                                  .productDetails[0]!.id);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        FavoriteProductGetxController
                                                .to.favoriteProducts
                                                .where((element) =>
                                                    element.id ==
                                                    controller
                                                        .productDetails[0]!.id)
                                                .isNotEmpty
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: SizeConfig.scaleWidth(29),
                                        color: AppColor.COLOR_Favboton,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(34),
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(
                            start: SizeConfig.scaleWidth(18),
                            end: SizeConfig.scaleWidth(17),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextApp(
                                    text:
                                        controller.productDetails.first!.nameEn,
                                    fontSize: 20,
                                    fontColor: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  TextApp(
                                    text:
                                        " ${controller.productDetails[0]!.price.toString()} ₪",
                                    fontSize: 30,
                                    fontColor: AppColor.COLOR_BUTTON,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.scaleHeight(24),
                              ),
                              TextApp(
                                text: AppLocalizations.of(context)!.description,
                                fontSize: 18,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: SizeConfig.scaleHeight(11),
                              ),
                              TextApp(
                                text: controller.productDetails[0]!.infoEn,
                                fontSize: 16,
                                fontColor: AppColor.INDICATOR_PAGEVIEW,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: SizeConfig.scaleHeight(24),
                              ),
                              TextApp(
                                text: "Quantity",
                                fontSize: 16,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: SizeConfig.scaleHeight(11),
                              ),
                              TextApp(
                                text: controller.productDetails[0]!.quantity
                                    .toString(),
                                fontSize: 16,
                                fontColor: AppColor.INDICATOR_PAGEVIEW,
                                fontWeight: FontWeight.w300,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),

                        //  Divider(height: 25,),
                        // Padding(
                        //   padding:  EdgeInsetsDirectional.only(
                        //     start: SizeConfig.scaleWidth(18),
                        //     end: SizeConfig.scaleWidth(19),
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       TextApp(text: AppLocalizations.of(context)!.color, fontSize: 16, fontColor: AppColor.COLOR_DETAILS_PAGE_TEXT, fontWeight: FontWeight.w300, textAlign: TextAlign.start,),
                        //       Row(
                        //         children: [
                        //           CircleAvatar(backgroundColor: Colors.blue, radius: 12,),
                        //           SizedBox(width: SizeConfig.scaleWidth(17),),
                        //           CircleAvatar(backgroundColor: Colors.blue, radius: 12,),
                        //           SizedBox(width: SizeConfig.scaleWidth(17),),
                        //           CircleAvatar(backgroundColor: Colors.blue, radius: 12,),
                        //         ],
                        //       )
                        //     ],
                        //   ),
                        // ),
                        const Divider(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: SizeConfig.scaleWidth(18),
                            end: SizeConfig.scaleWidth(19),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextApp(
                                    text:
                                        "Your rating : ${controller.productDetails[0]!.productRate}",
                                    fontSize: 18,
                                    fontColor: AppColor.COLOR_DETAILS_PAGE_TEXT,
                                    fontWeight: FontWeight.w300,
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(height: 18,),
                                  TextApp(
                                    text:
                                        "${controller.productDetails[0]!.overalRate}",
                                    fontSize: 16,
                                    fontColor: AppColor.COLOR_RATING,
                                    fontWeight: FontWeight.w300,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              RatingBar.builder(
                                initialRating: _rating,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: SizeConfig.scaleWidth(19),
                                // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: AppColor.COLOR_RATING,
                                ),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    _rating = rating;
                                    ProductRateGetxController.to.addRateProduct(
                                        context,
                                        productId:
                                            controller.productDetails[0]!.id,
                                        rate: _rating);

                                    print(rating);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 25,
                        ),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    )),
        );
      },
    );
  }
}
