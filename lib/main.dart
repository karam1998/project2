import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:project2/screens/about_us_screen.dart';
import 'package:project2/screens/auth/forget_password_screen.dart';
import 'package:project2/screens/auth/login_screen.dart';
import 'package:project2/screens/auth/register_screen.dart';
import 'package:project2/screens/bottom_navigation/bn_screen/favorite_screen.dart';
import 'package:project2/screens/bottom_navigation/bn_screen/home_screen.dart';
import 'package:project2/screens/bottom_navigation/bn_screen/main_screen.dart';
import 'package:project2/screens/categories_screen.dart';
import 'package:project2/screens/change_password_screen.dart';
import 'package:project2/screens/edit_profile_screen.dart';
import 'package:project2/screens/launch_screen.dart';
import 'package:project2/screens/on_boarding/on_boarding_screen.dart';
import 'package:project2/screens/search_screen.dart';
import 'package:project2/screens/select_language_screen.dart';
import 'package:project2/screens/settings_screen.dart';
import 'package:project2/screens/support_screen.dart';
import 'package:project2/screens/famous_screen.dart';
import 'package:project2/screens/latest_products.dart';
import 'getx_controller/cities_getx_controller.dart';
import 'getx_controller/language_getx_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences().initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  LanguageGetXController languageGetXController =
      Get.put(LanguageGetXController());
  GetxControllerCiteis city = Get.put(GetxControllerCiteis());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<LanguageGetXController>(
      builder: (LanguageGetXController controller) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/launch_screen",
          routes: {
            "/launch_screen": (context) => const LaunchScreen(),
            "/on_boarding_screen": (context) => const OnBoardingScreen(),
            "/login_screen": (context) => const LoginScreen(),
            "/register_screen": (context) => const RegisterScreen(),
            "/home_screen": (context) => const HomeScreen(),
            "/forget_password_screen": (context) =>
                const ForgetPasswordScreen(),
            "/main_screen": (context) => const MainScreen(),
            "/categories_screen": (context) => const CategoriesScreen(),
            "/settings_screen": (context) => const SettingsScreen(),
            "/favorite_screen": (context) => const FavoriteScreen(),
            "/select_language_screen": (context) =>
                const SelectLanguageScreen(),
            "/about_us_screen": (context) => const AboutUsScreen(),
            "/support_screen": (context) => const SupportScreen(),
            "/edit_profile_screen": (context) => const EditProfileScreen(),
            "/search_screen": (context) => const SearchScreen(),
            "/change_password_screen": (context) =>
                const ChangePasswordScreen(),
            "/latest_products_screen": (context) => const LatestProducts(),
            "/famous_products_screen": (context) => const FamousScreen(),
          },
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("en"),
            Locale("ar"),
          ],
          locale: Locale(controller.languageCode.value),
        );
      },
    );
  }
}
