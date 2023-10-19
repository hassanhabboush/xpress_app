import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/home/test/category_controller1.dart';

class CategoryPage extends StatelessWidget {
  final CategoryController1 _categoryController = Get.put(CategoryController1());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: _categoryController.categories.length,
          itemBuilder: (context, index) {
            final category = _categoryController.categories[index];
            return ListTile(
              title: Text(category.name),
              onTap: () {
                print("categoryID:${category.id}");
                _categoryController.fetchPredictions(category.id);

                Get.to(PredictionPage());
              },
            );
          },
        ),
      ),
    );
  }
}

class PredictionPage extends StatelessWidget {
  final CategoryController1 _categoryController = Get.put(CategoryController1());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predictions'),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: _categoryController.predictions.length,
          itemBuilder: (context, index) {
            final prediction = _categoryController.predictions[index];
            return ListTile(
              title: Text(prediction.name),
            );
          },
        ),
      ),
    );
  }
}
