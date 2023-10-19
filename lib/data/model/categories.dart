class Categories {
  late int id;
  late String image;
  late String status;
  late String createdAt;
  late String name;

  // List<Translations>? translations;

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    name = json['name'];
    if (json['translations'] != null) {
      // translations = <Translations>[];
      // json['translations'].forEach((v) {
      //   translations!.add(new Translations.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    // if (this.translations != null) {
    //   data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
