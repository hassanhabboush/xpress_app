import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';
import 'package:xpress_app/core/class/api_setting.dart';
import 'package:http/http.dart' as http;
import 'package:xpress_app/core/utils/helpers.dart';
import 'package:xpress_app/data/model/user.dart';
import 'package:xpress_app/view/screens/app/profile/profile.dart';

class EditProfileController extends GetxController with Helpers{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final UserPreferencesController _preferencesController = UserPreferencesController();

  Future<void> editProfile(BuildContext context) async {
    try {
      var headers = {

        // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNzkwYjY2OTRiYTVlODYzNzEzNGNmMGMzNzMzMmQ2MWIxZmNlMjU3OThhNmZhZjc3YWZhZWY2NGJlMjdkNjc1MTdkNTMzODc1MDRiOTkxNzYiLCJpYXQiOjE2OTU4NDU5NjYuMTMwMjQ4LCJuYmYiOjE2OTU4NDU5NjYuMTMwMjUzLCJleHAiOjE3Mjc0NjgzNjYuMTE2NjIxLCJzdWIiOiI3MDYiLCJzY29wZXMiOltdfQ.TxMUCkp8aoq69219uTSznCE641nQYQ4bC5gRRWjr79-n267iaxKO8ISYKUOc77ipRT2W86EO4g99KhA4kbMcts2IP6rT5Ja49Rh9ARVnmawI8KKqFQQtwSlKNJVLEhGrwq2FkJgetHsjzVHZfNLuAYlqnK3Or03K2U3t9Jj15JIGs-WLd4rKAWWvLlrAqobYbDd4zwUXFwcE-66CWVX44he8WeO_as7j95LUtiNYsOrfHtV7L3wDIoXpEpD6FIMzTeo9otxm_HA0iqJLZi_Mw8lHEGwb_xHhIAMQOa2NOYcCSkVmw-AivSjU7iozt9iY2xhasNuGxjbqYoFfWzAz2oQH6hLBzh84JaIP-zE4i6h57sT7_20aEhSEpgyM_dpXC4g8JnjSwCUzg38rdcE-bVmWkKbJ4Hdfsardf6O6ycgqmMLlkJW6RO41ssSQwIAH2KEXZh3-bGenu_yWDBj7BjW48ZlH--8tuWAtkhqGjsEbqJXuvPRZ8aTbGUVKcQL-Bs4aLvmplwiDaLyusQxnOlT81fOTiuXuZacH4OZXxAI8WWp4bVqb0WKZc-eLFdbFbrqtm4SNDcLxXtLofQji8-QYHrUOfNIL1546dH79TVsXMoDecpaKamnPrbuLhIIqCnlpxK3AT8BOg4OCDSFH_OItFLjqfZdLdy3R2B-Nois',
        'Authorization' : _preferencesController.accessToken,
      };
      var url = Uri.parse(ApiSettings.EDITPROFILE);
      Map body = {
        'name': nameController.text,
        'email': emailController.text,
        'mobile': mobileController.text,
        'password': '123456',
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print('json: $json');

        User user = User.fromJson(json['user']);
        print('userToken: ${user.accessToken}');
        UserPreferencesController().saveUserEdit(user: user);
        nameController.clear();
        emailController.clear();
        mobileController.clear();
        showSnakeBar(context: context, message: jsonDecode(response.body)["message"] );
        // Get.toNamed(AppRoutes.profile);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
    update();
  }
}
