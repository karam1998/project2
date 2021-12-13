import 'package:get/get.dart';
import 'package:project2/preferences/user_preferences.dart';
class LanguageGetXController extends GetxController{

  RxString languageCode = 'ar'.obs;

  static LanguageGetXController get to => Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    languageCode.value = UserPreferences().codeLang;
    super.onInit();
  }

  void changeLanguage(String newLangCode){
    languageCode.value = newLangCode;
    UserPreferences().setLanguage(newLangCode);
  }
}