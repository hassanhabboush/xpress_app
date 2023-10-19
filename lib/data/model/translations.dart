class Translations {
 late int id;
 late int productId;
 late String locale;
 late String name;
 late String createdAt;
 late String updatedAt;
 // late Null? deletedAt;



  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    locale = json['locale'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['locale'] = locale;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    // data['deleted_at'] = this.deletedAt;
    return data;
  }
}