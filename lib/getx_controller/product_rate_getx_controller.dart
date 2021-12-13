import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project2/controller/product_rate_controller.dart';

class ProductRateGetxController extends GetxController {
  ProductRateController productRateController = ProductRateController();

  static ProductRateGetxController get to => Get.find();

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
    super.onClose();
  }

  Future<void> addRateProduct(BuildContext context,
      {required int productId, required double rate}) async {
    await productRateController.productRate(context,
        productId: productId, rate: rate);
  }
}
