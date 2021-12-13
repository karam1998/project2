import 'dart:convert';
import 'dart:io';

import 'package:project2/api/api_setting.dart';
import 'package:project2/models/product_details.dart';
import 'package:project2/preferences/user_preferences.dart';

import 'package:http/http.dart' as http;
import 'package:project2/utils/helpers.dart';
class SubCategoryController with Helper{

  Future<List<SubCategory>> indexSubCategory(int categoryId) async {
    var url = Uri.parse(ApiSettings.CATEGORIES_INDEX + "/" + categoryId.toString());
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader : UserPreferences().getToken(),
      "X-Requested-With" : "XMLHttpRequest",
    });

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body)['list'] as List;
      List<SubCategory> category = jsonResponse.map((e) => SubCategory.fromJson(e)).toList();

      return category;
    }
    return [];
  }
}