class Translation {
  final int id;
  final int productId;
  final String locale;
  final String name;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  Translation({
    required this.id,
    required this.productId,
    required this.locale,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      id: json['id'],
      productId: json['product_id'],
      locale: json['locale'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}

class Product {
  final int id;
  final int categoryId;
  final double price;
  final String image;
  final double discount;
  final String offerFrom;
  final String offerTo;
  final String type;
  final int order;
  final int available;
  final String status;
  final String createdAt;
  final bool isCart;
  final bool availableOffer;
  final double priceOffer;
  final String typeName;
  final int availableInt;
  final String name;
  final String description;
  final List<Translation> translations;

  Product({
    required this.id,
    required this.categoryId,
    required this.price,
    required this.image,
    required this.discount,
    required this.offerFrom,
    required this.offerTo,
    required this.type,
    required this.order,
    required this.available,
    required this.status,
    required this.createdAt,
    required this.isCart,
    required this.availableOffer,
    required this.priceOffer,
    required this.typeName,
    required this.availableInt,
    required this.name,
    required this.description,
    required this.translations,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<Translation> translations = [];
    if (json['translations'] != null) {
      json['translations'].forEach((translation) {
        translations.add(Translation.fromJson(translation));
      });
    }

    return Product(
      id: json['id'],
      categoryId: json['category_id'],
      price: json['price'].toDouble(),
      image: json['image'],
      discount: json['discount'].toDouble(),
      offerFrom: json['offer_from'],
      offerTo: json['offer_to'],
      type: json['type'].toString(),
      order: json['order'],
      available: json['available'],
      status: json['status'],
      createdAt: json['created_at'],
      isCart: json['is_cart'],
      availableOffer: json['available_offer'],
      priceOffer: json['price_offer'].toDouble(),
      typeName: json['type_name'],
      availableInt: json['available_int'],
      name: json['name'],
      description: json['description'],
      translations: translations,
    );

  }
}