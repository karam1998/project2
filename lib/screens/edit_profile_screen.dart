import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/user_api_controller.dart';
import 'package:project2/getx_controller/cities_getx_controller.dart';
import 'package:project2/getx_controller/language_getx_controller.dart';
import 'package:project2/models/cities.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/helpers.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/button_app.dart';
import 'package:project2/widgets/text_filed_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with Helper {
  late TextEditingController _nameTextEditingController;
  late TextEditingController _phoneTextEditingController;
  String selectedUserGender =
      UserPreferences().gender == "M" ? "Male" : "Female";
  String selectedUserCity = "";
  String gender = "";

  int cityId = UserPreferences().city_id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextEditingController =
        TextEditingController(text: UserPreferences().userName);
    _phoneTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameTextEditingController.dispose();
    _phoneTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetxControllerCiteis controller = Get.put(GetxControllerCiteis());
    final indexCity = controller.city
        .indexWhere((element) => element.id == UserPreferences().city_id);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsetsDirectional.only(
            start: SizeConfig.scaleWidth(19),
            top: SizeConfig.scaleHeight(30),
          ),
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          top: SizeConfig.scaleHeight(23),
          bottom: SizeConfig.scaleHeight(58),
          start: SizeConfig.scaleWidth(14),
          end: SizeConfig.scaleWidth(14),
        ),
        children: [
          DropdownButtonFormField<City>(
              isExpanded: false,
              items: controller.city
                  .map((e) => DropdownMenuItem<City>(
                        child: Text(
                          LanguageGetXController.to.languageCode.value == "en"
                              ? e.nameEn.toString()
                              : e.nameAr.toString(),
                        ),
                        // value: e.nameEn,
                        value: e,
                      ))
                  .toList(),
              value: GetxControllerCiteis.to.city.value.elementAt(indexCity),
              onChanged: (City? city) {
                setState(() {
                  cityId = city!.id;
                });
              }),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  value: AppLocalizations.of(context)?.male ?? "",
                  title: Text(AppLocalizations.of(context)?.male ?? ""),
                  contentPadding: EdgeInsetsDirectional.zero,
                  groupValue: selectedUserGender,
                  activeColor: AppColor.INDICATOR_PAGEVIEW,
                  onChanged: (String? value) {
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
                  title: Text(AppLocalizations.of(context)?.female ?? ""),
                  activeColor: AppColor.INDICATOR_PAGEVIEW,
                  groupValue: selectedUserGender,
                  onChanged: (String? value) {
                    print(value);
                    setState(
                      () {
                        selectedUserGender = value ?? '';
                      },
                    );
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(15),
          ),
          TextFiledApp(
              hint: AppLocalizations.of(context)!.name,
              prefixIcon: Icons.person_outline,
              controller: _nameTextEditingController),
          SizedBox(
            height: SizeConfig.scaleHeight(150),
          ),
          ButtonApp(
              text: AppLocalizations.of(context)!.save,
              onPressed: () async => await performUpdateProfile(),
              width: double.infinity,
              height: 59),
        ],
      ),
    );
  }

  Future performUpdateProfile() async {
    if (checkData()) {
      await updateProfile();
    }
  }

  bool checkData() {
    if (_nameTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, "Check data required", error: true);

    return false;
  }

  Future updateProfile() async {
    selectedUserGender == "Male" ? gender = "M" : "F";
    bool status = await UserApiController().updateProfile(context,
        city_id: cityId, name: _nameTextEditingController.text, gender: gender);
    if (status) {
      UserPreferences().setUserName(_nameTextEditingController.text);
      UserPreferences().setGender(gender);
      UserPreferences().setCityId(cityId);
      Navigator.pop(context);
    }
  }
}
