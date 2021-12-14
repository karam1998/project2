import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project2/api/api_setting.dart';
import 'package:project2/getx_controller/language_getx_controller.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:project2/utils/helpers.dart';
import 'package:http/http.dart' as http;
class ProductRateController with Helper{

  Future<bool> productRate(BuildContext context , {required int productId,required double rate}) async{
      var url = Uri.parse(ApiSettings.productsRate);
      var response = await http.post(url, body: {
        "product_id": productId .toString(),
         "rate" :  rate.toString(),
      },
      headers: {
        "X-Requested-With" : "XMLHttpRequest",
        HttpHeaders.authorizationHeader : UserPreferences().getToken(),
        "lang" : LanguageGetXController().languageCode.value,
      }
      );

      if(response.statusCode == 200){
        showSnackBar(context, jsonDecode(response.body)['message']);

        return true;
      }else{
        showSnackBar(context, jsonDecode(response.body)['message'], error: true);

        return false;
      }
  }
}