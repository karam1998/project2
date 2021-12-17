import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/api/api_setting.dart';
import 'package:project2/getx_controller/language_getx_controller.dart';
import 'package:project2/models/base_api_object_response.dart';
import 'package:project2/models/user.dart';
import 'package:project2/preferences/user_preferences.dart';
import 'package:project2/utils/helpers.dart';

import 'package:http/http.dart' as http;

class UserApiController with Helper {
  Future<bool> register(BuildContext context,
      {required String mobile,
      required int cityId,
      required String gender,
      required String name,
      required String password}) async {
    var url = Uri.parse(ApiSettings.registerUser);

    var response = await http.post(url, body: {
      "mobile": mobile,
      "password": password,
      "name": name,
      "gender": gender,
      "STORE_API_KEY": ApiSettings.apiKeyStore,
      "city_id": cityId.toString()
    });
    if (response.statusCode == 201) {
      var code = jsonDecode(response.body)['code'];
      var baseApiResponse = BaseApiObjectResponse.fromJson(jsonDecode(response.body));
      showSnackBar(context, baseApiResponse.message);
      showCode(context, "verification Code : $code");
      print("Code : ${jsonDecode(response.body)['code']}");
      return true;
    }

    // Get.snackbar("Success", jsonDecode(response.body)['message']);
    showSnackBar(context, jsonDecode(response.body)['message']);
    return false;
  }

  Future<bool> activeAccount(String code, String mobile) async {
    var url = Uri.parse(ApiSettings.activeAccountUser);
    var response = await http.post(url, body: {
      "mobile": mobile,
      "code": code,
    });
    if (response.statusCode == 200) {
      Get.snackbar("Active account", "account successfully verify");
      return true;
    } else {
      Get.snackbar("Not active account", "code is not match");
      return false;
    }
  }

  Future<User?> login(BuildContext context,
      {required String mobile,
      required String password,
      required String token}) async {
    var url = Uri.parse(ApiSettings.loginUser);
    var response = await http.post(url, body: {
      "mobile": mobile,
      "password": password,
      "fcm_token": token,
    }, headers: {
      "lang": LanguageGetXController().languageCode.value,
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['data'];
      return User.fromJson(jsonResponse);
    } else {
      showSnackBar(context, jsonDecode(response.body)['message'], error: true);

      return null;
    }
  }

  Future<bool> refreshToken({
    required String token,
  }) async {
    var url = Uri.parse(ApiSettings.refreshToken);
    var response = await http.post(
      url,
      body: {
        "fcm_token": token,
      },
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      return true;
    }
    print("Erorr : ${response.body}");
    return false;
  }

  Future<bool> forgetPassword(BuildContext context,
      {required String mobile}) async {
    var url = Uri.parse(ApiSettings.forgetPassword);
    var response = await http.post(url, body: {"mobile": mobile});

    if (response.statusCode == 200) {
      showSnackBar(context, jsonDecode(response.body)['message']);
      return true;
    }
    showSnackBar(context, jsonDecode(response.body)['message'], error: true);

    return false;
  }

  Future<bool> resetPassword(BuildContext context,
      {required String mobile,
      required String password,
      required String code}) async {
    var url = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(url, body: {
      "mobile": mobile,
      "password": password,
      "password_confirmation": password,
      "code": code,
      "lang": LanguageGetXController.to.languageCode.value,
    });
    if (response.statusCode == 200) {
      showSnackBar(context, jsonDecode(response.body)["message"]);

      return true;
    }
    showSnackBar(context, jsonDecode(response.body)["message"], error: true);
    return false;
  }

  Future<bool> changePassword(BuildContext context,
      {required String currentPassword, required String newPassword}) async {
    var url = Uri.parse(ApiSettings.changePassword);
    var response = await http.post(url, body: {
      "current_password": currentPassword,
      "new_password": newPassword,
      "new_password_confirmation": newPassword,
    }, headers: {
      HttpHeaders.authorizationHeader: UserPreferences().getToken(),
      "lang": LanguageGetXController.to.languageCode.value,
    });
    if (response.statusCode == 200) {
      showSnackBar(context, jsonDecode(response.body)["message"]);

      return true;
    }
    showSnackBar(context, jsonDecode(response.body)["message"], error: true);
    return false;
  }

  Future<bool> updateProfile(BuildContext context,
      {required int city_id,
      required String name,
      required String gender}) async {
    var url = Uri.parse(ApiSettings.updateProfile);
    var response = await http.post(url, body: {
      "city_id": city_id.toString(),
      "name": name,
      "gender": gender,
    }, headers: {
      HttpHeaders.authorizationHeader: UserPreferences().getToken(),
      "lang": LanguageGetXController.to.languageCode.value,
    });
    if (response.statusCode == 200) {
      showSnackBar(context, jsonDecode(response.body)["message"]);

      return true;
    }
    showSnackBar(context, jsonDecode(response.body)["message"], error: true);
    return false;
  }

  Future logout() async {
    var url = Uri.parse(ApiSettings.logoutUser);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: UserPreferences().getToken(),
    });
    if (response.statusCode == 200) {
      UserPreferences().logout();
      return true;
    }
    return false;
  }
}
