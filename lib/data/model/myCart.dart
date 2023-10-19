class MyCarts {
 late int id;
 late int categoryId;
 late double price ;
 late String image;
 late int discount;
 late String offerFrom;
 late String offerTo;
 late int type;
 late int order;
 late int available;
 late String status;
 late String createdAt;
 late String availableOffer;
 late double priceOffer;
 late String typeName;
 late int availableInt;
 late String name;
 late String? description;
  // List<Translations>? translations;

  MyCarts.fromJson(Map<String, dynamic> json) {
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
