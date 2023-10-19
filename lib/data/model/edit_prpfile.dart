import 'package:xpress_app/data/model/user.dart';

class EditProfile {
 late bool status;
 late int code;
 late User user;
 late String message;
 late String validator;


  EditProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
    message = json['message'];
    validator = json['validator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['user'] = user.toJson();
      data['message'] = message;
    data['validator'] = validator;
    return data;
  }
}