import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project2/controller/sub_category_controller.dart';
import 'package:project2/models/product_details.dart';

class SubCategoryGetxController extends GetxController {
  RxList<SubCategory> subCategory = <SubCategory>[].obs;
  RxBool isLoading = true.obs;
SubCategoryController subCategoryController = SubCategoryController();
  static SubCategoryGetxController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    // readSubCategories();
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
    subCategory.clear();
    super.onClose();
  }



  Future<void> readSubCategories(int categoryId) async{
    isLoading(true);

    try{
      subCategory.value = await subCategoryController.indexSubCategory(categoryId);

    }finally{
      isLoading(false);
    }
  }
}