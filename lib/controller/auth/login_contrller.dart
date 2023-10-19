import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';
import 'package:xpress_app/core/class/api_setting.dart';
import 'package:xpress_app/core/constant/routes.dart';
import 'package:xpress_app/data/model/user.dart';
import 'package:xpress_app/view/screens/app/main_screen.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail(BuildContext context) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(ApiSettings.LOGIN);
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        User user = User.fromJson(json['user']);
        print('user.accessToken: ${user.accessToken}');
        UserPreferencesController().saveUser(user: user);
        emailController.clear();
        passwordController.clear();
        Get.toNamed(AppRoutes.main_screen);
        // if (json['code'] == 200) {
        //   var token = json['user']['access_token'];
        //   final SharedPreferences? prefs = await _prefs;
        //   await prefs?.setString('access_token', token);
        //
        //   emailController.clear();
        //   passwordController.clear();
        //   // Get.toNamed(AppRoutes.main_screen);
        //   Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),) );
        // } else if (json['code'] == 200) {
        //   throw jsonDecode(response.body)['message'];
        // }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      // Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              // children: [Text(error.toString())],
              children: [Text('المستخدم غير موجود اعد المحاولة')],
            );
          });
    }
  }
}
