import 'package:flutter/material.dart';
import 'package:project2/utils/app_color.dart';
import 'package:project2/utils/size_config.dart';
import 'package:project2/widgets/button_app.dart';
import 'package:project2/widgets/text_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  RangeValues _currentRangeValues = const RangeValues(20, 140);
  String startValue = "20";
  String endValue = "140";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextApp(
          text: AppLocalizations.of(context)!.search,
          fontSize: 18,
          fontColor: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(
          start: SizeConfig.scaleWidth(20),
          end: SizeConfig.scaleWidth(20),
          top: SizeConfig.scaleHeight(50),
          bottom: SizeConfig.scaleHeight(5),
        ),
        children: [
          TextApp(
            text: AppLocalizations.of(context)!.price,
            fontSize: 18,
            fontColor: AppColor.COLOR_DETAILS_PAGE_TEXT,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(2),
          ),
          TextApp(
            text: "\$ $startValue  -  \$ $endValue",
            fontSize: 14,
            fontColor: AppColor.SUB_TITLE_PAGEVIEW,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(5),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.scaleWidth(15),
              vertical: SizeConfig.scaleHeight(10),
            ),
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RangeSlider(
                  values: _currentRangeValues,
                  min: 0,
                  max: 450,
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                  onChangeEnd: (RangeValues values) {
                    setState(() {
                      endValue = values.end.floor().toString();
                    });
                  },
                  onChangeStart: (RangeValues values) {
                    setState(() {
                      startValue = values.start.floor().toString();
                    });
                  },
                  activeColor: AppColor.INDICATOR_PAGEVIEW,
                  inactiveColor: AppColor.UNSELECTED_ICON,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextApp(
                      text: "\$ $startValue",
                      fontSize: 16,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    TextApp(
                      text: "\$ $endValue",
                      fontSize: 16,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(10),
          ),
          TextApp(
            text: AppLocalizations.of(context)!.color,
            fontSize: 18,
            fontColor: AppColor.COLOR_DETAILS_PAGE_TEXT,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(2),
          ),
          TextApp(
            text: "blue",
            fontSize: 14,
            fontColor: AppColor.SUB_TITLE_PAGEVIEW,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(5),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.scaleWidth(15),
              vertical: SizeConfig.scaleHeight(10),
            ),
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 24,
                ),
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 24,
                ),
                CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 24,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 24,
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(10),
          ),
          TextApp(
            text: AppLocalizations.of(context)!.category,
            fontSize: 18,
            fontColor: AppColor.COLOR_DETAILS_PAGE_TEXT,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(2),
          ),
          TextApp(
            text: "T-shirt",
            fontSize: 14,
            fontColor: AppColor.SUB_TITLE_PAGEVIEW,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(5),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.scaleWidth(15),
              vertical: SizeConfig.scaleHeight(10),
            ),
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    value: true,
                    onChanged: (bool? value) {
                      setState(() {});
                    },
                    activeColor: AppColor.INDICATOR_PAGEVIEW,
                    title: TextApp(
                      text: "T-shirt",
                      fontSize: 17,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.start,
                    ),
                    dense: true,
                    contentPadding: EdgeInsetsDirectional.zero,
                  );
                }),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(10),
          ),
          TextApp(
            text: AppLocalizations.of(context)!.size,
            fontSize: 18,
            fontColor: AppColor.COLOR_DETAILS_PAGE_TEXT,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(2),
          ),
          TextApp(
            text: "Medium",
            fontSize: 14,
            fontColor: AppColor.SUB_TITLE_PAGEVIEW,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(5),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.scaleWidth(15),
              vertical: SizeConfig.scaleHeight(10),
            ),
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: SizedBox(
              height: SizeConfig.scaleHeight(80),
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsetsDirectional.all(8),
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      width: SizeConfig.scaleWidth(56),
                      height: SizeConfig.scaleHeight(56),
                      margin: const EdgeInsetsDirectional.all(8),
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(6)),
                      child: TextApp(
                        text: "S",
                        fontSize: 17,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(100),
          ),
          ButtonApp(
              text: AppLocalizations.of(context)!.apply,
              onPressed: () {
                Navigator.pop(context);
              },
              width: double.infinity,
              height: 59),
        ],
      ),
    );
  }
}
