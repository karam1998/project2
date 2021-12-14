import 'dart:convert';
import 'dart:io';

import 'package:project2/api/api_setting.dart';
import 'package:project2/models/product_details.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:project2/utils/helpers.dart';

import 'package:http/http.dart' as http;
class FamousProductController with Helper{

  Future<ProductsDetails?> indexProduct(int productId) async {
    print("productID : ${productId.toString()}");
    var url = Uri.parse(ApiSettings.productDetails + productId.toString());
    print("Url : ${url.toString()}");
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader : UserPreferences().getToken(),
      "X-Requested-With" : "XMLHttpRequest",
    });

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body)['object'];
        return ProductsDetails.fromJson(jsonResponse);
    }
    return null;
  }

}