import 'dart:convert';
import 'dart:io';

import 'package:project2/api/api_setting.dart';
import 'package:project2/models/product.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:project2/utils/helpers.dart';

import 'package:http/http.dart' as http;
class ProductController with Helper{

  Future<List<Product>> indexProduct(int subCategoryId) async {
    var url = Uri.parse(ApiSettings.PRODUCTS_INDEX + subCategoryId.toString());
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader : UserPreferences().getToken(),
      "X-Requested-With" : "XMLHttpRequest",
    });

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body)['list'] as List;
      List<Product> product = jsonResponse.map((e) => Product.fromJson(e)).toList();
      return product;
    }
    return [];
  }
  // Future<bool> indexProduct(int subCategoryId) async {
  //   var url = Uri.parse(ApiSettings.PRODUCTS_INDEX + subCategoryId.toString());
  //   var response = await http.get(url, headers: {
  //     HttpHeaders.authorizationHeader : UserPreferences().getToken(),
  //     "X-Requested-With" : "XMLHttpRequest",
  //     "Accept": "*/*",
  //     "Accept-Encoding" : "gzip, deflate, br",
  //     //  "Connection" : "keep-alive",
  //   });
  //
  //   print(response.statusCode);
  //   if(response.statusCode == 200){
  //     final  jsonResponse = jsonDecode(response.body);
  //     final x = jsonResponse['list'] as List;
  //     print("Code : ${response.statusCode}");
  //
  //     List<Product> product = x.map((e) => Product.fromJson(e)).toList();
  //     print("Success : ${jsonDecode(response.body)['message']}");
  //
  //     return true;
  //   }else{
  //     print("Code : ${response.statusCode}");
  //
  //     return false;
  //   }
  //
  // }
}