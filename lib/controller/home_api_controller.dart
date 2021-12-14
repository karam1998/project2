import 'dart:convert';
import 'dart:io';
import 'package:project2/api/api_setting.dart';
import 'package:project2/models/categories.dart';
import 'package:project2/models/famous_products.dart';
import 'package:project2/models/last_products.dart';
import 'package:project2/models/slider.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:http/http.dart' as http;

class HomeApiController {
  Future<List<Sliders>> indexSlider() async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: UserPreferences().getToken(),
    });

    if (response.statusCode == 200) {
      var jsonSlider = jsonDecode(response.body)['data']['slider'] as List;
      List<Sliders> sliders =
          jsonSlider.map((e) => Sliders.fromJson(e)).toList();
      return sliders;
    }
    return [];
  }

  Future<List<LatestProducts>> indexLastProducts() async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: UserPreferences().getToken(),
    });

    if (response.statusCode == 200) {
      var jsonLastProducts =
          jsonDecode(response.body)['data']['latest_products'] as List;
      List<LatestProducts> lastProducts =
          jsonLastProducts.map((e) => LatestProducts.fromJson(e)).toList();
      return lastProducts;
    }

    return [];
  }

  Future<List<Categories>> indexCategories() async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: UserPreferences().getToken(),
    });

    if (response.statusCode == 200) {
      var jsonCategories =
          jsonDecode(response.body)['data']['categories'] as List;
      List<Categories> categories =
          jsonCategories.map((e) => Categories.fromJson(e)).toList();
      return categories;
    }

    return [];
  }

  Future<List<FamousProducts>> indexFamousProducts() async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: UserPreferences().getToken(),
      },
    );

    if (response.statusCode == 200) {
      var jsonFamousProducts =
          jsonDecode(response.body)['data']['famous_products'] as List;
      List<FamousProducts> famousProducts =
          jsonFamousProducts.map((e) => FamousProducts.fromJson(e)).toList();
      return famousProducts;
    }

    return [];
  }
}
