import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';
import 'package:xpress_app/core/class/api_setting.dart';
import 'package:xpress_app/core/utils/helpers.dart';
import 'package:xpress_app/data/model/Products.dart';
import 'package:xpress_app/data/model/categories.dart';

import 'package:http/http.dart' as http;
import 'package:xpress_app/data/model/offers.dart';

class HomeController extends GetxController with Helpers{
  RxList<Categories> categories = <Categories>[].obs; // عرض
  RxList<Prediction> predictions = <Prediction>[].obs; //categories عرض باستخدام id الخاص بالمنتج(product_id)  نأخذه من ال
  RxBool isLoading = false.obs;
  UserPreferencesController _userPreferencesController =
  UserPreferencesController();
  int productId = 1;
  RxList<Translation> translations = <Translation>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
    _userPreferencesController = UserPreferencesController();
    fetchPro();
  }

  // لعرض التصنيفات
  Future<void> fetchCategories() async {
    isLoading.value = true;
    final response = await http.get(Uri.parse(ApiSettings.CATEGORIES));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('data $data');
      if (data != null) {
        categories.value =
            (data['categories'] as List<dynamic>).map((item) =>
            Categories.fromJson(item)).toList();
        print('categories(1): $categories');

      }
    }
    isLoading.value = false;
  }

  // لعرض المنجات
  Future<void> fetchPredictions(int categoryId ) async {
    isLoading.value = true;
    final response = await http.get(Uri.parse('https://sallah.hexacit.com/api/getProductsByCategoryId/${categoryId }'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> predictionList = data['products'];
      predictions.value = predictionList
          .map((prediction) => Prediction(
        categoryId: prediction['category_id'],
        image:  prediction['image'],
        price:  prediction['price'],
        id: prediction['id'],
        name: prediction['name'],
      ))
          .toList();
      print('categoryId: ${categoryId.toString()}');
    }
    isLoading.value = false;
  }

  Future<void> fetchProducts(int categoryId ) async {
    isLoading.value = true;
    final response = await http.get(Uri.parse('https://sallah.hexacit.com/api/getProductsByCategoryId/${categoryId }'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> predictionList = data['products'];
      predictions.value = predictionList
          .map((prediction) => Prediction(


        categoryId: prediction['category_id'],
        image:  prediction['image'],
        price:  prediction['price'],
        id: prediction['id'],
        name: prediction['name'],
      ))
          .toList();
      print('categoryId: ${categoryId.toString()}');
    }
    isLoading.value = false;
  }

  Future<void> getCategories() async {
    isLoading.value = true;
    final response = await http.get(Uri.parse(ApiSettings.CATEGORIES));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('data $data');
      if (data != null) {
        categories.value = (data['categories'] as List<dynamic>).map((item) =>
            Categories.fromJson(item)).toList();
        print('categories(1): $categories');
        update(); // تحديث واجهة المستخدم بعد استلام البيانات
      }
    }
    isLoading.value = false;
  }



// productId لجلب ال
  Future<List<int>> fetchPro() async {
    final response = await http.get(Uri.parse('https://sallah.hexacit.com/api/getProductsByCategoryId/$productId'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data != null) {
        final products = data['products'];
        if (products != null && products.isNotEmpty) {
          List<int> productIds = [];
          for (var products in products) {
            final translations = products['translations'];
            if (translations != null && translations.isNotEmpty) {
              for (var translation in translations) {
                if (translation['product_id'] != null) {
                  productId = translation['product_id'];
                  productIds.add(productId);
                  print('product_id: $productId');
                }
              }
            }
          }
          return productIds;
        }
      }
    }
    return [];
  }


  // لاضافة منتج للسلة
  Future<void> addProductToCart(BuildContext context) async {
    try {
      var headers = {
        'Authorization': _userPreferencesController.accessToken,
        'fcmToken': 'Postman_fcm_token'
      };
      var url = Uri.parse(ApiSettings.ADDPRODUCTTOCART);
      Map body = {
        'product_id': productId.toString(),
      };

      http.Response response =
      await http.post(url, body: body, headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        for (var translations in translations) {
          print(translations.productId);
        }

        print('json: $json');

        showSnakeBar(context: context, message:  jsonDecode(response.body)["message"]);
        // print('accessToken: ${_userPreferencesController.accessToken}');
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

