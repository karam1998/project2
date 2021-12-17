import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/getx_controller/category_getx_controller.dart';
import 'package:project2/screens/sub_category_screen.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScreen extends StatefulWidget {
  late int id;

  CategoriesScreen(this.id);

  // const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.id == 1
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: TextApp(
                text: AppLocalizations.of(context)!.categories,
                fontSize: 20,
                fontColor: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ],
            ),
            body: GetX<CategoryGetxController>(
              init: CategoryGetxController(),
              builder: (CategoryGetxController controller) {
                return ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  padding: EdgeInsetsDirectional.only(
                    bottom: SizeConfig.scaleHeight(50),
                  ),
                  children: [
                    SizedBox(
                      height: SizeConfig.scaleHeight(33),
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: controller.category.length,
                      padding: EdgeInsetsDirectional.only(
                        start: SizeConfig.scaleWidth(16),
                        end: SizeConfig.scaleWidth(16),
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubCategoryScreen(
                                    categoryId: controller.category[index].id),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: SizeConfig.scaleHeight(100),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    controller.category[index].imageUrl,
                                    fit: BoxFit.contain,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                      colors: [
                                        Colors.white
                                            .withOpacity(0.001),
                                        Colors.blueGrey,
                                      ],
                                      begin: AlignmentDirectional.topCenter,
                                      end: AlignmentDirectional.bottomCenter,
                                    )),
                                  ),
                                  Center(
                                    child: TextApp(
                                      text: controller.category[index].nameEn,
                                      fontSize: 22,
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
                  ],
                );
              },
            ),
          )
        : Container(
            child: GetX<CategoryGetxController>(
              init: CategoryGetxController(),
              builder: (CategoryGetxController controller) {
                return ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  padding: EdgeInsetsDirectional.only(
                    bottom: SizeConfig.scaleHeight(50),
                  ),
                  children: [
                    SizedBox(
                      height: SizeConfig.scaleHeight(33),
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: controller.category.length,
                      padding: EdgeInsetsDirectional.only(
                        start: SizeConfig.scaleWidth(16),
                        end: SizeConfig.scaleWidth(16),
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubCategoryScreen(
                                    categoryId: controller.category[index].id),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: SizeConfig.scaleHeight(100),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    controller.category[index].imageUrl,
                                    fit: BoxFit.contain,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.white
                                                .withOpacity(0.001),
                                            Colors.blueGrey,
                                          ],
                                          begin: AlignmentDirectional.topCenter,
                                          end: AlignmentDirectional.bottomCenter,
                                        )),
                                  ),
                                  Center(
                                    child: TextApp(
                                      text: controller.category[index].nameEn,
                                      fontSize: 22,
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
                  ],
                );
              },
            ),
          );
  }
}
