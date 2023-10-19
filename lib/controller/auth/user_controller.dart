import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';
import 'package:xpress_app/core/class/api_setting.dart';
import 'package:xpress_app/core/utils/helpers.dart';
import 'package:xpress_app/data/model/user.dart';

class UserApiController with Helpers {
  Future<bool> login({
    required String email,
    required String password,
   required BuildContext context,
  }) async {
    var url = Uri.parse(ApiSettings.LOGIN);
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      User user = User.fromJson(jsonResponse['user']);
      UserPreferencesController().saveUser(user: user);
      showSnakeBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: false);
      return true;

    } else if (response.statusCode == 400) {
      showSnakeBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    } else {
      showSnakeBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    }
    return false;
  }

  Future<bool> register({
    required BuildContext context,
    required String name,
    required String email,
    required String mobile,
    required String password,
  }) async {
    var url = Uri.parse(ApiSettings.SIGNUP);
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
      'name': name,
      'mobile': mobile,
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      User user = User.fromJson(jsonResponse['user']);
      UserPreferencesController().saveUser(user: user);
      return true;
    } else if (response.statusCode == 400) {
      // ignore: use_build_context_synchronously
      showSnakeBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
      // انا اجانيresponse.body String
      // وانا حولت  على شكلjsonDecode String
      // و أخذت منه Map json ال  message key
    } else {
      // ignore: use_build_context_synchronously
      showSnakeBar(
          context: context,
          message: 'something went wrong, please try again',
          error: true);
    }
    return false;
  }


  Future<bool> logOut() async {
    var url = Uri.parse(ApiSettings.LOGIN);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: UserPreferencesController().accessToken,
      HttpHeaders.acceptHeader: 'application/json'
      // هذه حتى لا يرجع خطأ يرجع دائما json بدل html مثل في api التي في ال postman عندما تزيل كلمة
      // Accept
    });

    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 401) {
      await UserPreferencesController().logOut(); //يقوم بحذف جميع البيانات
      return true;
    } else {
      //
    }

    return false;
  }

  Future<bool> editProfile(
    // int userId,
    String name,
    String email,
    String mobile,
    BuildContext context,
    // String imageProfile,
    String accessToken,
  ) async {
    const url = ApiSettings.EDITPROFILE;

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$accessToken',
    };

    final body = jsonEncode({
      // 'id': userId,
      'name': name,
      'email': email,
      'mobile': mobile,
      // 'image_profile': imageProfile,
    });

    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      User user = User.fromJson(responseData['user']);
      UserPreferencesController().saveUser(user: user);
      print(responseData);
      return true;
    } else if (response.statusCode == 400) {
      showSnakeBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    } else {
      showSnakeBar(
          context: context,
          message: 'something went wrong, please try again',
          error: true);
    }
    return false;
  }

  Future<bool> changePassword(
      // int userId,
      String password,
      String old_password,
      String confirm_password,
      BuildContext context,
      String accessToken,
      ) async {
    const url = ApiSettings.CHANGEPASSWORD;

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$accessToken',
    };

    final body = jsonEncode({
      // 'id': userId,
      'password': password,
      'old_password': old_password,
      'confirm_password': confirm_password,
    });

    final response =
    await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      // User user = User.fromJson(responseData['user']);
      // UserPreferencesController().saveUser(user: user);
      print(responseData);
      showSnakeBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: false);
      return true;
    } else if (response.statusCode == 400) {
      showSnakeBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    } else {
      showSnakeBar(
          context: context,
          message: 'something went wrong, please try again',
          error: true);
    }
    return false;
  }





  Future<bool> contactUs({
    required BuildContext context,
    required String email,
    required String mobile,
    required String name,
    required String message,
    required String type,
  }) async {
    var url = Uri.parse(ApiSettings.CONTACTUS);
    var response = await http.post(url, body: {
      'email': email,
      'mobile': mobile,
      'name': name,
      'message': message,
      'type': type,
    });

    if (response.statusCode == 200) {
      showSnakeBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: false);
      return true;
    } else if (response.statusCode == 400) {
      // ignore: use_build_context_synchronously
      showSnakeBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
      // انا اجانيresponse.body String
      // وانا حولت  على شكلjsonDecode String
      // و أخذت منه Map json ال  message key
    } else {
      // ignore: use_build_context_synchronously
      showSnakeBar(
          context: context,
          message: 'something went wrong, please try again',
          error: true);
    }
    return false;
  }
// Future<bool> forgetPassword({
//   required BuildContext context,
//   required String email,
// }) async {
//   var url = Uri.parse(ApiSettings.FORGET_PASSWORD);
//   var response = await http.post(url, body: {'email': email});
//   if (response.statusCode == 200) {
//     var jsonObject = jsonDecode(response.body);
//     showSnakeBar(context: context, message: jsonObject['message']);
//     print('Code: ${jsonObject['code']}');
//     return true;
//   } else if (response.statusCode == 400) {
//     var jsonObject = jsonDecode(response.body);
//     showSnakeBar(
//         context: context, message: jsonObject['message'], error: true);
//   } else {
//     showSnakeBar(
//         context: context,
//         message: 'something went wrong, please try again',
//         error: true);
//   }
//   return false;
// }

// Future<bool> resetPassword({
//   required BuildContext context,
//   required String email,
//   required String code,
//   required String password,
// }) async {
//   var url = Uri.parse(ApiSettings.RESET_PASSWORD);
//   var response = await http.post(url, body: {
//     'email': email,
//     'code': code,
//     'password': password,
//     'password_confirmation': password,
//   });
//   if (response.statusCode == 200) {
//     var jsonObject = jsonDecode(response.body);
//     showSnakeBar(context: context, message: jsonObject['message']);
//     return true;
//   } else if (response.statusCode == 400) {
//     var jsonObject = jsonDecode(response.body);
//     showSnakeBar(
//         context: context, message: jsonObject['message'], error: true);
//   } else {
//     showSnakeBar(
//         context: context,
//         message: 'something went wrong, please try again',
//         error: true);
//   }
//   return false;
// }




}
