import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project2/controller/product_controller.dart';
import 'package:project2/models/product.dart';

class ProductGetxController extends GetxController {
  RxList<Product> product = <Product>[].obs;
  bool isLoading = false;
  ProductController productController = ProductController();
  static ProductGetxController get to => Get.find();

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
    product.clear();
    super.onClose();
  }



  Future<void> readProducts(int subCategoryId) async{
   isLoading = true;
    product.value = await productController.indexProduct(subCategoryId);
    isLoading = false;
  }
}