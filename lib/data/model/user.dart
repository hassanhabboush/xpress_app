class User {
 late int id;
 late String name;
 late String email;
 late String mobile;
 late String imageProfile;
 // late Null rememberToken;
 late String status;
 late String type;
 late String accessToken;


  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    imageProfile = json['image_profile'];
    // rememberToken = json['remember_token'];
    status = json['status'];
    type = json['type'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['image_profile'] = imageProfile;
    // data['remember_token'] = this.rememberToken;
    data['status'] = status;
    data['type'] = type;
    data['access_token'] = accessToken;
    return data;
  }
}
