import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/user_api_controller.dart';
import 'package:project2/getx_controller/cities_getx_controller.dart';
import 'package:project2/getx_controller/language_getx_controller.dart';
import 'package:project2/models/cities.dart';
import 'package:project2/screens/auth/verify_account_screen.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/button_app.dart';
import 'package:project2/widgets/text_app.dart';
import 'package:project2/widgets/text_filed_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _nameTextEditingController;
  late TextEditingController _mobileTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TextEditingController _cityTextEditingController;

  String selectedUserGender = "";
  String selectedUserCity = "";
  String gender = "";

  int? cityId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextEditingController = TextEditingController();
    _mobileTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _cityTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextEditingController.dispose();
    _mobileTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _cityTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetxControllerCiteis controller = Get.put(GetxControllerCiteis());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          start: SizeConfig.scaleWidth(28),
          end: SizeConfig.scaleWidth(28),
        ),
        children: [
          TextApp(
            text: AppLocalizations.of(context)?.create_new_account ?? "",
            fontSize: 30,
            fontColor: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(17),
          ),
          TextApp(
            text: AppLocalizations.of(context)?.sub_title_reg ?? "",
            fontSize: 14,
            fontColor: AppColor.SUB_TITLE_PAGEVIEW,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(94),
          ),
          TextFiledApp(
              hint: AppLocalizations.of(context)?.name ?? "",
              prefixIcon: Icons.person_outline,
              controller: _nameTextEditingController),
          SizedBox(
            height: SizeConfig.scaleHeight(21),
          ),
          TextFiledApp(
            hint: AppLocalizations.of(context)?.mobile ?? "",
            prefixIcon: Icons.phone_android,
            controller: _mobileTextEditingController,
            textInputType: TextInputType.phone,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(21),
          ),
          TextFiledApp(
            hint: AppLocalizations.of(context)?.password ?? "",
            prefixIcon: Icons.lock_open_outlined,
            controller: _passwordTextEditingController,
            obscure: true,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(21),
          ),
          GetX<GetxControllerCiteis>(
              // init: GetxControllerCiteis(),
              builder: (GetxControllerCiteis controller) {
            if (controller.city.isNotEmpty) {
              return DropdownButtonFormField<City>(
                items: controller.city.value
                    .map((e) => DropdownMenuItem<City>(
                          child: Text(
                              LanguageGetXController.to.languageCode.value ==
                                      "en"
                                  ? e.nameEn.toString()
                                  : e.nameAr.toString()),
                          // value: e.nameEn,
                          value: e,
                        ))
                    .toList(),
                value: controller.city.value.elementAt(0),
                onChanged: (City? city) {
                  setState(() {
                    cityId = city?.id;
                  });
                },
              );
            } else {
              return const Text("");
            }
          }),
          SizedBox(
            height: SizeConfig.scaleHeight(21),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(80),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: SizeConfig.scaleWidth(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp(
                    text: AppLocalizations.of(context)?.select_gender ?? "",
                    fontSize: 16,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          value: AppLocalizations.of(context)?.male ?? "",
                          title: Text(AppLocalizations.of(context)?.male ?? ""),
                          contentPadding: EdgeInsetsDirectional.zero,
                          groupValue: selectedUserGender,
                          activeColor: AppColor.INDICATOR_PAGEVIEW,
                          onChanged: (String? value) {
                            print(value);
                            setState(() {
                              selectedUserGender = value ?? '';
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          contentPadding: EdgeInsetsDirectional.zero,
                          value: AppLocalizations.of(context)?.female ?? "",
                          title:
                              Text(AppLocalizations.of(context)?.female ?? ""),
                          activeColor: AppColor.INDICATOR_PAGEVIEW,
                          groupValue: selectedUserGender,
                          onChanged: (String? value) {
                            print(value);
                            setState(() {
                              selectedUserGender = value ?? '';
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.scaleHeight(27)),
          ButtonApp(
            text: AppLocalizations.of(context)?.sign_up ?? "",
            width: double.infinity,
            height: 59,
            onPressed: () => PerformRegister(),
          ),
          SizedBox(height: SizeConfig.scaleHeight(22)),
          TextApp(
            text: AppLocalizations.of(context)?.have_account ?? "",
            fontSize: 14,
            fontColor: AppColor.TEXT_SIGNUP,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: SizeConfig.scaleHeight(11.5)),
          TextApp(
            text: AppLocalizations.of(context)?.by_creating ?? "",
            fontSize: 13,
            fontColor: AppColor.SUB_TITLE_PAGEVIEW,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Future PerformRegister() async {
    if (checkData()) {
      await register();
    }
  }

  bool checkData() {
    if (_mobileTextEditingController.text.isNotEmpty &&
        _nameTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty &&
        selectedUserGender != "" &&
        cityId != "") {
      if (selectedUserGender == "Male" || selectedUserGender == "ذكر") {
        setState(() {
          gender = "M";
        });
      } else if (selectedUserGender == "Female" ||
          selectedUserGender == "انثى") {
        setState(() {
          gender = "F";
        });
      }

      return true;
    }
    Get.snackbar("Error", "Enter required data",
        backgroundColor: Colors.red, colorText: Colors.white);
    return false;
  }

  Future register() async {
    print(int.parse(_mobileTextEditingController.text));
    print(cityId);
    print(gender);
    print(_nameTextEditingController.text);
    print(_passwordTextEditingController.text);
    bool success = await UserApiController().register(context,
        mobile: _mobileTextEditingController.text,
        cityId: cityId!,
        gender: gender,
        name: _nameTextEditingController.text,
        password: _passwordTextEditingController.text);

    if (success) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyAccountScreen(
              mobile: _mobileTextEditingController.text,
            ),
          ),
          (route) => false);
      Get.snackbar("Create Account Successfully", "Please Verify mobile number",
          backgroundColor: Colors.green, colorText: Colors.white);
    }
  }
}
