import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project2/controller/product_details_controller.dart';
import 'package:project2/models/product_details.dart';

class ProductDetailsGetxController extends GetxController {
  RxList<ProductsDetails?> productDetails = <ProductsDetails>[].obs;

  // RxBool isLoading = true.obs;
  FamousProductController productDetailsController =
      FamousProductController();

  static ProductDetailsGetxController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
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
    // productDetails.clear();
    super.onClose();
  }

  Future<void> readProductsDetails(int productId) async {
    ProductsDetails? productsDetails =
        await productDetailsController.indexProduct(productId);
    productDetails.add(productsDetails);
  }
}
