import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:xpress_app/controller/home/test/Category.dart';
import 'package:xpress_app/core/class/api_setting.dart';

class CategoryController1 extends GetxController {
  RxList<Category> categories = <Category>[].obs;
  RxList<Prediction> predictions = <Prediction>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final response = await http.get(Uri.parse(ApiSettings.CATEGORIES));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> categoryList = data['categories'];
      categories.value = categoryList
          .map((category) => Category(
        id: category['id'],
        name: category['name'],
      ))
          .toList();
    }
  }

  Future<void> fetchPredictions(int categoryId) async {
    final response = await http.get(Uri.parse('${ApiSettings.PRODUCTS}/$categoryId'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> predictionList = data['products'];
      predictions.value = predictionList
          .map((prediction) => Prediction(
        id: prediction['id'],
        name: prediction['name'],
      ))
          .toList();
      print('categoryId: ${categoryId.toString()}');
    }
  }
}
