class Prediction {
  int? id;
  int? categoryId;
  num? price;
  String? image;
  int? discount;
  String? offerFrom;
  String? offerTo;
  int? type;
  int? order;
  int? available;
  String? status;
  String? createdAt;
  int? isCart;
  String? availableOffer;
  num? priceOffer;
  String? typeName;
  int? availableInt;
  String? name;
  String? description;

  Prediction({
    this.id,
    this.categoryId,
    this.price,
    this.image,
    this.discount,
    this.offerFrom,
    this.offerTo,
    this.type,
    this.order,
    this.available,
    this.status,
    this.createdAt,
    this.isCart,
    this.availableOffer,
    this.priceOffer,
    this.typeName,
    this.availableInt,
    this.name,
    this.description,
  }); // late // List<Translations>? translations;

  Prediction.fromJson(Map<String, dynamic> json) {
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
    description = json['description'];
    // if (json['translations'] != null) {
    //   translations = <Translations>[];
    //   json['translations'].forEach((v) {
    //     translations!.add(new Translations.fromJson(v));
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
    data['description'] = description;
    // if (this.translations != null) {
    //   data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

// class Prediction {
//   final int id;
//   // final int categoryId;
//   //  double price;
//    String image;
//   final String name;
//
//   Prediction({
//     required this.id,
//     required this.name,
//     // required this.price ,
//     required this.image,
//     // required this.categoryId,
//   });
// }
