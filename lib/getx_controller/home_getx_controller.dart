import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/home_api_controller.dart';
import 'package:project2/models/categories.dart';
import 'package:project2/models/famous_products.dart';
import 'package:project2/models/last_products.dart';
import 'package:project2/models/slider.dart';

class HomeGetXController extends GetxController {
  RxList<Sliders> sliders = <Sliders>[].obs;
  RxList<Categories> categories = <Categories>[].obs;
  RxList<LatestProducts> latestProducts = <LatestProducts>[].obs;
  RxList<FamousProducts> famousProducts = <FamousProducts>[].obs;

  bool isLoading = false;
  HomeApiController homeApiController = HomeApiController();

  static HomeGetXController get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    readSliders();
    readCategories();
    readFamousProducts();
    readLatestProducts();


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
    sliders.clear();
    categories.clear();
    famousProducts.clear();
    latestProducts.clear();

    super.onClose();
  }

  Future<void> readSliders() async {
    isLoading = true;
    sliders.value = (await HomeApiController().indexSlider()).cast<Sliders>();
    isLoading = false;
  }

  Future<void> readCategories() async {
    isLoading = true;
    categories.value = await HomeApiController().indexCategories();
    isLoading = false;
  }

  Future<void> readLatestProducts() async {
    isLoading = true;
    latestProducts.value = await HomeApiController().indexLastProducts();
    isLoading = false;
  }

  Future<void> readFamousProducts() async {
    isLoading = true;
    famousProducts.value = await HomeApiController().indexFamousProducts();
    isLoading = false;
  }
}
