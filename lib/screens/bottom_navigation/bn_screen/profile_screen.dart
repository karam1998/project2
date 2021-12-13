import 'package:flutter/material.dart';
import 'package:project2/controller/user_api_controller.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/button_app.dart';
import 'package:project2/widgets/text_app.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/bg.png",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        PositionedDirectional(
          top: SizeConfig.scaleHeight(10),
          start: 0,
          end: 0,
          child: CircleAvatar(
            backgroundImage: const AssetImage(
              "images/person_zara.png",
            ),
            radius: SizeConfig.scaleWidth(45),
          ),
        ),
        PositionedDirectional(
            top: SizeConfig.scaleHeight(132),
            start: 0,
            end: 0,
            child: Column(
              children: [
                TextApp(
                  text: "karam Shaat",
                  fontSize: 22,
                  fontColor: AppColor.COLOR_NAME_PROFILE,
                  fontWeight: FontWeight.bold,
                ),
                TextApp(
                  text: "karm.shaat@gmail.com",
                  fontSize: 16,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ],
            )),
        PositionedDirectional(
          top: SizeConfig.scaleHeight(260),
          start: 0,
          end: 0,
          child: SizedBox(
            height: SizeConfig.scaleHeight(400),
            child: ListView(
              padding: EdgeInsetsDirectional.only(
                start: SizeConfig.scaleWidth(16),
                end: SizeConfig.scaleWidth(16),
              ),
              children: [
                ListTile(
                  onTap: () =>
                      Navigator.pushNamed(context, "/edit_profile_screen"),
                  title: const Text("Edit Profile"),
                  leading: const Icon(
                    Icons.person_outline,
                    color: AppColor.INDICATOR_PAGEVIEW,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  onTap: () =>
                      Navigator.pushNamed(context, "/change_password_screen"),
                  title: const Text("Change Password"),
                  leading: const Icon(
                    Icons.lock_open_outlined,
                    color: AppColor.INDICATOR_PAGEVIEW,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  onTap: () => Navigator.pushNamed(context, "/settings_screen"),
                  title: const Text("Settings"),
                  leading: const Icon(
                    Icons.settings,
                    color: AppColor.INDICATOR_PAGEVIEW,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                ElevatedButton.icon(
                  onPressed: () => logout(context),
                  icon: const Icon(
                    Icons.logout,
                    color: AppColor.COLOR_BUTTON,
                  ),
                  label: TextApp(
                    text: "LOGOUT",
                    fontColor: AppColor.COLOR_BUTTON,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                    side: BorderSide.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void logout(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: AppColor.SUB_TITLE_PAGEVIEW,
      builder: (context) {
        return Container(
          height: SizeConfig.scaleHeight(378),
          width: double.infinity,
          padding: EdgeInsetsDirectional.only(
              start: SizeConfig.scaleWidth(24),
              end: SizeConfig.scaleWidth(24),
              top: SizeConfig.scaleHeight(20)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            children: [
              Image.asset("images/logo.png"),
              TextApp(
                text: "Log out",
                fontSize: 23,
                fontColor: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(26),
              ),
              TextApp(
                text: "Are you sure you want to logout?",
                fontSize: 16,
                fontColor: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonApp(
                    text: "No",
                    onPressed: () => Navigator.pop(context),
                    width: 116,
                    height: 48,
                    buttonColor: Colors.white,
                    fontColor: AppColor.INDICATOR_PAGEVIEW,
                    colorBorder: AppColor.INDICATOR_PAGEVIEW,
                  ),
                  ButtonApp(
                      text: "yes",
                      onPressed: () => performLogout(),
                      width: 116,
                      height: 48),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future performLogout() async {
    bool logout = await UserApiController().logout();

    if (logout) {
      Navigator.pushNamedAndRemoveUntil(
          context, "/login_screen", (route) => false);
    }
  }
}
