import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project2/controller/user_api_controller.dart';
import 'package:project2/models/user.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/button_app.dart';
import 'package:project2/widgets/text_app.dart';
import 'package:project2/widgets/text_filed_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _mobileTextEditingController;
  late TextEditingController _passwordTextEditingController;

  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    _mobileTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = navigateToRegister;
    super.initState();
  }

  navigateToRegister() {
    Navigator.pushNamed(context, "/register_screen");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          start: SizeConfig.scaleWidth(28),
          end: SizeConfig.scaleWidth(28),
        ),
        children: [
          TextApp(
            text: AppLocalizations.of(context)?.hey_there ?? "",
            fontSize: 30,
            fontColor: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(17),
          ),
          TextApp(
            text: AppLocalizations.of(context)?.sub_title_login ?? "",
            fontSize: 14,
            fontColor: AppColor.SUB_TITLE_PAGEVIEW,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(94),
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
            prefixIcon: Icons.lock,
            controller: _passwordTextEditingController,
            obscure: true,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(11),
          ),
          Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/forget_password_screen");
                },
                child: TextApp(
                  text: AppLocalizations.of(context)?.forget_password ?? "",
                  fontSize: 14,
                  fontColor: AppColor.INDICATOR_PAGEVIEW,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.end,
                ),
              )),
          SizedBox(
            height: SizeConfig.scaleHeight(7),
          ),
          ButtonApp(
            text: AppLocalizations.of(context)?.sign_in ?? "",
            width: double.infinity,
            height: 59,
            onPressed: () => PerformLogin(),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(21),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: AppLocalizations.of(context)?.not_have_account ?? "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: SizeConfig.scaleTextFont(14),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Circular Std",
                ),
                children: [
                  const TextSpan(text: " "),
                  TextSpan(
                    text: AppLocalizations.of(context)?.sign_up ?? "",
                    recognizer: _tapGestureRecognizer,
                    style: TextStyle(
                      color: AppColor.TEXT_SIGNUP,
                      fontSize: SizeConfig.scaleTextFont(14),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Circular Std",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future PerformLogin() async {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (_mobileTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      print("Success");
      return true;
    }
    print("Error");
    return false;
  }

  Future login() async {
    User? user = await UserApiController().login(
      context,
      mobile: _mobileTextEditingController.text,
      password: _passwordTextEditingController.text,
      token: '',
    );

    if (user != null) {
      UserPreferences().save(user);
      UserPreferences().setUserName(user.name);
      UserPreferences().setGender(user.gender);
      UserPreferences().setCityId(user.cityId);
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Navigator.pushReplacementNamed(context, "/main_screen");
        },
      );
    }
  }
}
