class BaseApiResponse {
  late bool status;
  late String message;

  BaseApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
