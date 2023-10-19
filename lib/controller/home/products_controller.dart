import 'dart:convert';
import 'dart:io';

import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';
import 'package:xpress_app/core/class/api_setting.dart';
import 'package:xpress_app/data/model/Products.dart';
import 'package:xpress_app/data/model/products.dart';
import 'package:http/http.dart' as http;

class ProductsController {

  List<dynamic> products = [];
  // Future<List<Products>> getProducts() async {
  //   var url = Uri.parse(ApiSettings.PRODUCTS.replaceFirst('/{id}', ''));
  //   var response = await http.get(url , headers:{
  //   HttpHeaders.authorizationHeader: UserPreferencesController().accessToken
  //   // طلاما يوجد عملية لمستخدم لازم يكون في token
  //   });
  //   print('url: $url');
  //   if (response.statusCode == 200) {
  //     print(response.statusCode);
  //     var jsonResponse = jsonDecode(response.body);
  //     var jsonArray = jsonResponse['products'] as List;
  //     return jsonArray
  //         .map((jsonObject) => Products.fromJson(jsonObject))
  //         .toList();
  //
  //
  //   } else if (response.statusCode == 400) {
  //     //
  //   } else {
  //     //
  //   }
  //   return [];
  // }


  Future<void> fetchData() async {
    final response =
    await http.get(Uri.parse(ApiSettings.PRODUCTS));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      products = data['products'];

    }
  }
  //
  //
  // Future<List<Products>> fetchProductsByCategoryId() async {
  //   final url = 'https://sallah.hexacit.com/api/getProductsByCategoryId/1';
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //
  //     final List<Products> products = jsonDecode(response.body);
  //     print(response.body);
  //     return products;
  //   } else {
  //     throw Exception('فشل في جلب البيانات');
  //   }
  // }

}
