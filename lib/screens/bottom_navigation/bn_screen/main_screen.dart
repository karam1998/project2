import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project2/getx_controller/home_getx_controller.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:project2/screens/bottom_navigation/bn_screen/profile_screen.dart';
import 'package:project2/screens/categories_screen.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/text_app.dart';
import 'package:get/get.dart';
import 'bn_screen.dart';
import 'favorite_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<BnScreen> screens = <BnScreen>[
    BnScreen(const HomeScreen(), "Home"),
    BnScreen(const FavoriteScreen(), "Favorite"),
    BnScreen(CategoriesScreen(2), "Categories"),
    BnScreen(const ProfileScreen(), "Profile"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  HomeGetXController home = Get.put(HomeGetXController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: TextApp(
          text: _getTitle(),
          fontSize: 18,
          fontColor: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        leading: Visibility(
          visible: _currentIndex == 0,
          child: IconButton(
            icon: const Icon(Icons.subject),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      drawer: Visibility(
        visible: _currentIndex == 0,
        child: Drawer(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            fit: StackFit.expand,
            children: [
              Image.asset(
                "images/bg.png",
                fit: BoxFit.fill,
              ),
              PositionedDirectional(
                top: SizeConfig.scaleHeight(40),
                start: SizeConfig.scaleWidth(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          const AssetImage("images/person_zara.png"),
                      radius: SizeConfig.scaleWidth(50),
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(15),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: SizeConfig.scaleWidth(30)),
                      child: TextApp(
                        text: "Hello ${UserPreferences().userName}",
                        fontSize: 20,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              PositionedDirectional(
                top: SizeConfig.scaleHeight(280),
                start: SizeConfig.scaleWidth(40),
                end: SizeConfig.scaleWidth(40),
                child: SizedBox(
                  height: SizeConfig.scaleHeight(500),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: TextApp(
                          text: "Home",
                          fontSize: 17,
                          fontColor: AppColor.INDICATOR_PAGEVIEW,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                        leading: const Icon(
                          Icons.home_outlined,
                          color: AppColor.INDICATOR_PAGEVIEW,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () =>
                            // Navigator.pushNamed(context, "/categories_screen"),
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoriesScreen(1),
                          ),
                        ),
                        title: TextApp(
                          text: "Categories",
                          fontSize: 17,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                        leading: const Icon(
                          Icons.widgets_outlined,
                          color: Colors.black,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () =>
                            Navigator.pushNamed(context, "/search_screen"),
                        title: TextApp(
                          text: "Search",
                          fontSize: 17,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                        leading: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      ListTile(
                        onTap: () =>
                            Navigator.pushNamed(context, "/settings_screen"),
                        contentPadding: EdgeInsets.zero,
                        title: TextApp(
                          text: "Settings",
                          fontSize: 17,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                        leading: const Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 30,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: TextApp(
                          text: "karm.shaat@gmail.com",
                          fontSize: 15,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                        leading: const Icon(
                          Icons.mail_outline,
                          color: Colors.black,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: TextApp(
                          text: "0595783031",
                          fontSize: 15,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                        leading: const Icon(
                          Icons.call,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        )),
        child: BottomNavigationBar(
          elevation: 10,
          unselectedItemColor: AppColor.UNSELECTED_ICON,
          selectedItemColor: AppColor.COLOR_BUTTON,
          currentIndex: _currentIndex,
          onTap: (int selectedItem) {
            print(selectedItem);
            setState(() {
              _currentIndex = selectedItem;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.widgets_outlined), label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "Profile"),
          ],
        ),
      ),
      body: _getScreen(),
    );
  }

  Widget _getScreen() => screens.elementAt(_currentIndex).screen;

  String _getTitle() => screens.elementAt(_currentIndex).title;
}
