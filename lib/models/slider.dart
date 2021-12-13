class Sliders {
  late int id;
  late String url;


  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

}