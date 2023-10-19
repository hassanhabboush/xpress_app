import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';
import 'package:xpress_app/core/class/api_setting.dart';
import 'package:xpress_app/core/constant/routes.dart';
import 'package:xpress_app/data/model/user.dart';
import 'package:xpress_app/view/screens/auth/screens/success_sign_up.dart';

class RegisterationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail(BuildContext context) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiSettings.SIGNUP);
      Map body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text,
        'mobile': mobileController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        User user = User.fromJson(json['user']);
        print('user.accessToken: ${user.accessToken}');
        UserPreferencesController().saveUser(user: user);
        nameController.clear();
          emailController.clear();
          passwordController.clear();
        Get.toNamed(AppRoutes.main_screen);

        // if (json['code'] == 210) {
        //   var token = json['user']['access_token'];
        //   print(token);
        //   final SharedPreferences? prefs = await _prefs;
        //   await prefs?.setString('access_token', token);
        //   nameController.clear();
        //   emailController.clear();
        //   passwordController.clear();
        //   // Get.toNamed(AppRoutes.main_screen);
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => const SuccessSignup(),
        //       ));
        // } else {
        //   throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
        // }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      // Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error ggg'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
    update();
  }
}
