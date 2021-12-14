import 'package:flutter/material.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/button_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'on_boarding_content.dart';
import 'on_boarding_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;

  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int currentPage) {
              setState(() {
                _currentPage = currentPage;
              });
            },
            children: [
              OnBoardingContent(
                  image: "images/StartUpScreen1.png",
                  currentPage: _currentPage,
                  title: AppLocalizations.of(context)?.title_page_view1 ?? "",
                  subTitle:
                      AppLocalizations.of(context)?.desc_page_view1 ?? ""),
              OnBoardingContent(
                  image: "images/StartUpScreen2.png",
                  currentPage: _currentPage,
                  title: AppLocalizations.of(context)?.title_page_view2 ?? "",
                  subTitle:
                      AppLocalizations.of(context)?.desc_page_view2 ?? ""),
              OnBoardingContent(
                  image: "images/StartUpScreen3.png",
                  currentPage: _currentPage,
                  title: AppLocalizations.of(context)?.title_page_view_3 ?? "",
                  subTitle:
                      AppLocalizations.of(context)?.desc_page_view3 ?? ""),
            ],
          ),
          Positioned(
            bottom: SizeConfig.scaleHeight(115),
            left: SizeConfig.scaleWidth(20),
            right: SizeConfig.scaleWidth(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OnBoardingIndicator(_currentPage == 0),
                SizedBox(
                  width: SizeConfig.scaleWidth(5),
                ),
                OnBoardingIndicator(_currentPage == 1),
                SizedBox(
                  width: SizeConfig.scaleWidth(5),
                ),
                OnBoardingIndicator(_currentPage == 2),
              ],
            ),
          ),
          Positioned(
            bottom: SizeConfig.scaleHeight(28),
            left: 0,
            right: 0,
            child: Center(
              child: ButtonApp(
                text: _currentPage == 2
                    ? AppLocalizations.of(context)?.get_started ?? ""
                    : AppLocalizations.of(context)?.next ?? "",
                width: 168,
                height: 45,
                onPressed: () => goToNextPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  goToNextPage() {
    _currentPage == 0 || _currentPage == 1
        ? _pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn)
        : Navigator.pushReplacementNamed(context, "/login_screen");
  }
}
