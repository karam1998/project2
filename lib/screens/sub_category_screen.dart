import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/api_setting.dart';
import 'package:project2/getx_controller/category_getx_controller.dart';
import 'package:project2/getx_controller/sub_category_getx_controller.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';
import 'list_product_screen.dart';

class SubCategoryScreen extends StatefulWidget {
  final int categoryId;

  const SubCategoryScreen({Key? key, required this.categoryId}) : super(key: key);

  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SubCategoryGetxController controller = Get.put(SubCategoryGetxController());
    SubCategoryGetxController.to.readSubCategories(widget.categoryId);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SubCategoryGetxController.to.subCategory.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<SubCategoryGetxController>(
      init: SubCategoryGetxController(),
      builder: (SubCategoryGetxController controller) {
        final indexCategory = CategoryGetxController.to.category
            .indexWhere((element) => element.id == widget.categoryId);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: TextApp(
              text: CategoryGetxController.to.category[indexCategory].nameEn,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontColor: Colors.black,
            ),
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
          ),
          body: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: controller.subCategory.length,
                  padding: EdgeInsetsDirectional.only(
                    start: SizeConfig.scaleWidth(16),
                    end: SizeConfig.scaleWidth(16),
                    top: SizeConfig.scaleHeight(30),
                    bottom: SizeConfig.scaleHeight(30),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListProductScreen(
                              subCategoryId: controller.subCategory[index].id,
                              categoryId: widget.categoryId,
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: SizeConfig.scaleHeight(100),
                        child: Card(
                          elevation: 5,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                ApiSettings.BASE_URL_STORAGE +
                                    ApiSettings.SUB_CATEGORIES +
                                    controller.subCategory[index].image,
                                fit: BoxFit.contain,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColor.COLOR_CONTAINER_SIZE.withOpacity(0.03),
                                        Colors.white.withOpacity(0.8),
                                      ],
                                      begin: AlignmentDirectional.topCenter,
                                    )),
                              ),

                              Center(
                                child: TextApp(
                                  text: controller.subCategory[index].nameEn,
                                  fontSize: 18,
                                  fontColor: Colors.black,
                                  fontWeight: FontWeight.bold,


                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
