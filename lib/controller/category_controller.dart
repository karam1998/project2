import 'dart:convert';
import 'dart:io';

import 'package:project2/api/api_setting.dart';
import 'package:project2/models/category.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:project2/utils/helpers.dart';
class CategoryController with Helper{

  Future<List<Category>> indexCategory() async {
  var url = Uri.parse(ApiSettings.categorisesIndex);
  var response = await http.get(url, headers: {
    HttpHeaders.authorizationHeader : UserPreferences().getToken(),
    "X-Requested-With" : "XMLHttpRequest",
  });

  if(response.statusCode == 200){
    var jsonResponse = jsonDecode(response.body)['list'] as List;

    List<Category> category = jsonResponse.map((e) => Category.fromJson(e)).toList();
    return category;
  }

  return [];
  }

}