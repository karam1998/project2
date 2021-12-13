import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/user_api_controller.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:project2/utils/size_config.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3) , (){
      if(UserPreferences().isLoggedIn){
        Navigator.pushReplacementNamed(context, "/main_screen");
      }else{
        Navigator.pushReplacementNamed(context, "/on_boarding_screen");

      }

    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset("images/launch_screen.png"),
      ),
    );
  }
}
