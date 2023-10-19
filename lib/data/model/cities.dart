
class Cities {
 late int id;
 late int deliveryCost;
 late String status;
 late String createdAt;
 late String updatedAt;
 // late Null deletedAt;
 late String name;
 late List<Translations> translations;


  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deliveryCost = json['deliveryCost'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
    name = json['name'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations.add( Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['deliveryCost'] = deliveryCost;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    // data['deleted_at'] = this.deletedAt;
    data['name'] = name;
    data['translations'] = translations.map((v) => v.toJson()).toList();
      return data;
  }
}

class Translations {
  int? id;
  int? cityId;
  String? locale;
  String? name;
  // Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Translations(
      {this.id,
        this.cityId,
        this.locale,
        this.name,
        // this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    locale = json['locale'];
    name = json['name'];
    // deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['city_id'] = cityId;
    data['locale'] = locale;
    data['name'] = name;
    // data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
