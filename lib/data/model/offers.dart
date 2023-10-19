class OffersM {
  late bool status;
  late int code;
  late String message;
  late List<Offers> offers;

  OffersM.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers.add(Offers.fromJson(v));
      });
    }
  }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['code'] = this.code;
//     data['message'] = this.message;
//     if (this.offers != null) {
//       data['offers'] = this.offers!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
}

class Offers {
  late int id;
  late int categoryId;
  late int price;
  late String image;
  late int discount;
  late String offerFrom;
  late String offerTo;
  late int type;
  late int order;
  late int available;
  late String status;
  late String createdAt;
  late String isCart;
  late String availableOffer;
  late num priceOffer;
  late String typeName;
  late int availableInt;
  late String name;
  late // Null description;
      List<Translation> translations;

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    price = json['price'];
    image = json['image'];
    discount = json['discount'];
    offerFrom = json['offer_from'];
    offerTo = json['offer_to'];
    type = json['type'];
    order = json['order'];
    available = json['available'];
    status = json['status'];
    createdAt = json['created_at'];
    isCart = json['is_cart'];
    availableOffer = json['available_offer'];
    priceOffer = json['price_offer'];
    typeName = json['type_name'];
    availableInt = json['available_int'];
    name = json['name'];
    // description = json['description'];
    // if (json['translations'] != null) {
    //   translations = <Translation>[];
    //   json['translations'].forEach((v) {
    //     translations.add(Translation.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['price'] = price;
    data['image'] = image;
    data['discount'] = discount;
    data['offer_from'] = offerFrom;
    data['offer_to'] = offerTo;
    data['type'] = type;
    data['order'] = order;
    data['available'] = available;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['is_cart'] = isCart;
    data['available_offer'] = availableOffer;
    data['price_offer'] = priceOffer;
    data['type_name'] = typeName;
    data['available_int'] = availableInt;
    data['name'] = name;
    // data['description'] = this.description;
    data['translations'] = translations.map((v) => v.toJson()).toList();
      return data;
  }
}

class Translation {
  late int id;
  late int productId;
  late String locale;
  late String name;
  late String createdAt;
  late String updatedAt;

  // Null deletedAt;

  Translation.fromJson(Map<String, dynamic> json) {
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
