import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:project2/api/api_setting.dart';
import 'package:project2/getx_controller/category_getx_controller.dart';
import 'package:project2/getx_controller/favorite_product_getx_controller.dart';
import 'package:project2/getx_controller/home_getx_controller.dart';
import 'package:project2/getx_controller/language_getx_controller.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/product_home.dart';
import 'package:project2/widgets/sub_category_home.dart';
import 'package:project2/widgets/text_app.dart';
import '../../details_product_screen.dart';
import '../../sub_category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  CategoryGetxController controllerCategory = Get.put(CategoryGetxController());
  FavoriteProductGetxController favController =
      Get.put(FavoriteProductGetxController());

  @override
  Widget build(BuildContext context) {
    FavoriteProductGetxController.to.readFavoriteProducts();
    return GetX<HomeGetXController>(
        init: HomeGetXController(),
        builder: (HomeGetXController controller) {
          return ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: SizeConfig.scaleWidth(18),
                  end: SizeConfig.scaleWidth(18),
                ),
                child: SizedBox(
                  height: SizeConfig.scaleHeight(45),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsetsDirectional.zero,
                      hintText: "Search for products",
                      fillColor: AppColor.SEARCH_COLOR_FILL,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.scaleWidth(52)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.scaleWidth(52)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(31),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
                items: controller.sliders.value
                    .map(
                      (e) => Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 2,
                        shadowColor: Colors.blue,
                        child: Stack(
                          fit: StackFit.loose,
                          children: [
                            Image.network(
                              ApiSettings.BASE_URL_STORAGE + e.url,
                              fit: BoxFit.contain,
                              width: SizeConfig.scaleWidth(200),
                              height: SizeConfig.scaleHeight(300),
                              alignment: AlignmentDirectional.center,
                            ),
                            /** Padding(
                                padding: EdgeInsetsDirectional.only(
                                start: SizeConfig.scaleWidth(18),
                                ),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                TextApp(
                                text: "70%",
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                fontColor: AppColor.INDICATOR_PAGEVIEW,
                                ),
                                TextApp(
                                text: "Best Deals \n on Clothing",
                                fontSize: 16,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.bold,
                                ),
                                ],
                                ),
                                ),*/
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(38),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: SizeConfig.scaleWidth(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextApp(
                      text: "Categories",
                      fontSize: 18,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/categories_screen"),
                      child: TextApp(
                        text: "See all",
                        fontSize: 15,
                        fontColor: AppColor.INDICATOR_PAGEVIEW,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(190),
                child: ListView.builder(
                  itemCount: controller.categories.length,
                  shrinkWrap: true,
                  padding: EdgeInsetsDirectional.only(
                    end: SizeConfig.scaleWidth(10),
                    start: SizeConfig.scaleWidth(20),
                  ),
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubCategoryScreen(
                              categoryId:
                                  CategoryGetxController.to.category[index].id),
                        ),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            Image.network(
                              ApiSettings.BASE_URL_STORAGE +
                                  ApiSettings.CATEGORIES +
                                  controller.categories[index].image,
                              fit: BoxFit.fitHeight,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 2,
                              left: 3,
                              child: Text(
                                LanguageGetXController.to.languageCode.value ==
                                        "en"
                                    ? controller.categories[index].nameEn
                                    : controller.categories[index].nameAr,
                                style: const TextStyle(
                                    backgroundColor: Colors.black,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: SizeConfig.scaleWidth(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextApp(
                      text: "Famous",
                      fontSize: 16,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, "/famous_products_screen"),
                      child: TextApp(
                        text: "See all",
                        fontSize: 13,
                        fontColor: AppColor.INDICATOR_PAGEVIEW,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(235),
                child: ListView.builder(
                  itemCount: controller.famousProducts.length,
                  shrinkWrap: true,
                  padding: EdgeInsetsDirectional.only(
                    end: SizeConfig.scaleWidth(7),
                    start: SizeConfig.scaleWidth(24),
                  ),
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsProductScreen(
                              productId: controller.famousProducts[index].id),
                        ),
                      ),
                      child: controller.famousProducts.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ProductHome(
                              productId: controller.famousProducts[index].id,
                              image: controller.famousProducts[index].image_url,
                              name: LanguageGetXController
                                          .to.languageCode.value ==
                                      "en"
                                  ? controller.famousProducts[index].nameEn
                                  : controller.famousProducts[index].nameAr,
                              category: controller.categories[index].nameEn,
                              price: controller.famousProducts[index].price
                                  .toString(),
                              width: SizeConfig.scaleWidth(150),
                            ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(40),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: SizeConfig.scaleWidth(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextApp(
                      text: "Latest Products",
                      fontSize: 16,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, "/latest_products_screen"),
                      child: TextApp(
                        text: "See all",
                        fontSize: 13,
                        fontColor: AppColor.INDICATOR_PAGEVIEW,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(235),
                child: ListView.builder(
                  itemCount: controller.latestProducts.length,
                  shrinkWrap: true,
                  padding: EdgeInsetsDirectional.only(
                    end: SizeConfig.scaleWidth(7),
                    start: SizeConfig.scaleWidth(24),
                  ),
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // final categoryIndex = controller.categories.indexWhere((element) => element.id == controller.latestProducts[index].subCategoryId);
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsProductScreen(
                                  productId:
                                      controller.latestProducts[index].id))),
                      child: controller.latestProducts.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ProductHome(
                              productId: controller.latestProducts[index].id,
                              image: controller.latestProducts[index].image_url,
                              name: controller.latestProducts[index].nameEn,
                              category: controller.categories[index].nameEn,
                              price: controller.latestProducts[index].price
                                  .toString(),
                              width: SizeConfig.scaleWidth(150),
                            ),
                    );
                  },
                ),
              ),
            ],
          );
        });
  }
}
