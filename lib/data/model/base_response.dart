import 'package:xpress_app/data/model/user.dart';

class BaseResponse {
 late bool status;
 late int code;
 late User user;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['user'] = user.toJson();
      return data;
  }
}
