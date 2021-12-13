import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project2/controller/city_controller.dart';
import 'package:project2/models/cities.dart';

class GetxControllerCiteis extends GetxController {
  RxList<City> city = <City>[].obs;

  CityController cityController = CityController();

  static GetxControllerCiteis get to => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    readCities();
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
    city.clear();
    super.onClose();
  }


    Future<void> readCities() async{
      city.value = await cityController.indexCities();
    }
}