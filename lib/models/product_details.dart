class ProductsDetails {
late int id;
late String nameEn;
late String nameAr;
late String infoEn;
late String infoAr;
late num price;
late int quantity;
late num overalRate;
late int subCategoryId;
late bool is_favorite;
late num productRate;
late Null offerPrice;
late String imageUrl;
late List<Images>? images;
late SubCategory? subCategory;



  ProductsDetails.fromJson(Map<String, dynamic> json) {
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
    imageUrl = json['image_url'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    subCategory = json['sub_category'] != null
        ? new SubCategory.fromJson(json['sub_category'])
        : null;
  }

}

class Images {
late int id;
late String url;


  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}

class SubCategory {
late  int id;
late  String nameEn;
late  String nameAr;
late  int categoryId;
late  String image;
late  String imageUrl;


  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    categoryId = json['category_id'];
    image = json['image'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['image_url'] = this.imageUrl;
    return data;
  }



}