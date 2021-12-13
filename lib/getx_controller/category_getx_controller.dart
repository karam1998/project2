import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project2/controller/category_controller.dart';
import 'package:project2/models/category.dart';

class CategoryGetxController extends GetxController {
  RxList<Category> category = <Category>[].obs;

CategoryController categoryController = CategoryController();
  static CategoryGetxController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    readCategories();
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    category.clear();
    super.onClose();
  }


    Future<void> readCategories() async{
      category.value = await categoryController.indexCategory();
    }


}