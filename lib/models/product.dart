class Product {

late int id;
late String nameEn;
late String nameAr;
late String infoEn;
late String infoAr;
late num price;
late int quantity;
late num overalRate;
late int subCategoryId;
late num productRate;
late Null offerPrice;
late String image_url;
late bool is_favorite;



  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    image_url = json['image_url'];
    is_favorite = json['is_favorite'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['info_en'] = this.infoEn;
    data['info_ar'] = this.infoAr;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['overal_rate'] = this.overalRate;
    data['sub_category_id'] = this.subCategoryId;
    data['product_rate'] = this.productRate;
    data['offer_price'] = this.offerPrice;
    data['image_url'] = this.image_url;
    data['is_favorite'] = this.is_favorite;
    return data;
  }

}

