class FamousProducts {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late num price;
  late int quantity;
  late num overalRate;
  late bool is_favorite;
  late int subCategoryId;
  late num productRate;
  late Null offerPrice;
  late String image_url;

  FamousProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    is_favorite = json['is_favorite'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    image_url = json['image_url'];
  }
}
