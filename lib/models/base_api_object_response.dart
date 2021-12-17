import 'package:project2/models/user.dart';

import 'base_api_response.dart';

class BaseApiObjectResponse<T> extends BaseApiResponse {

 late T object;
 late T data;

  BaseApiObjectResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if(json.containsKey('data')) {
      if(T == User) {
        object = User.fromJson(json['data']) as T;
      }
    }
    if(json.containsKey('object')) {

    }
  }
}