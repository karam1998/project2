import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project2/api/api_setting.dart';
import 'package:project2/models/favorite_product.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:project2/utils/helpers.dart';
import 'package:http/http.dart' as http;

class FavoriteProductController with Helper {
  Future<bool> addFavorite(BuildContext context,
      {required int productId}) async {
    var url = Uri.parse(ApiSettings.productsFavorite);
    var response = await http.post(
      url,
      body: {
        "product_id": productId.toString(),
      },
      headers: {
        "X-Requested-With": "XMLHttpRequest",
        HttpHeaders.authorizationHeader: UserPreferences().getToken(),
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      showSnackBar(context, jsonDecode(response.body)['message']);
      return true;
    } else {
      showSnackBar(context, jsonDecode(response.body)['message'], error: true);
      return false;
    }
  }

  Future<List<FavoriteProduct>> indexFavoriteProducts() async {
    var url = Uri.parse(ApiSettings.productsFavorite);
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: UserPreferences().getToken(),
        "X-Requested-With": "XMLHttpRequest",
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['list'] as List;
      List<FavoriteProduct> favoriteProducts =
          jsonResponse.map((e) => FavoriteProduct.fromJson(e)).toList();

      return favoriteProducts;
    }
    return [];
  }
}
