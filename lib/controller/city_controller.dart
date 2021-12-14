import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project2/api/api_setting.dart';
import 'package:project2/models/cities.dart';
class CityController{

  Future<List<City>> indexCities() async {

    var url = Uri.parse(ApiSettings.indexCities);

    var response = await http.get(url, headers: {
      "Accept" : "application/json",
    });

    if(response.statusCode == 200){
      var jsonCity = jsonDecode(response.body)["list"] as List;
      List<City> city = jsonCity.map((e) => City.fromJson(e)).toList();

      return city;
    }else{
      return [];
    }
}
}