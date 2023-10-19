import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';
import 'package:xpress_app/core/class/api_setting.dart';
import 'package:xpress_app/core/utils/helpers.dart';
import 'package:xpress_app/data/model/offers.dart';

class OffersController extends GetxController with Helpers{
  RxList<Offers> offers = <Offers>[].obs;
  RxList<Translation> translations = <Translation>[].obs;
  UserPreferencesController _userPreferencesController =
      UserPreferencesController();
  RxBool isLoading = false.obs;
  int productId = 1;
  @override
  void onInit() {
    super.onInit();
    fetchPro();
    _userPreferencesController = UserPreferencesController();
    fetchOffers();
  }

  Future<void> fetchOffers() async {
    isLoading.value = true;
    final response = await http.get(Uri.parse(ApiSettings.OFFERS));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('data $data');
      if (data != null) {
        offers.value = (data['offers'] as List<dynamic>)
            .map((item) => Offers.fromJson(item))
            .toList();
        print('offers(1): $offers');
      }
    }
    isLoading.value = false;
  }


  Future<List<int>> fetchPro() async {
    final response = await http.get(Uri.parse(ApiSettings.OFFERS));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data != null) {
        final offers = data['offers'];
        if (offers != null && offers.isNotEmpty) {
          List<int> productIds = [];
          for (var offer in offers) {
            final translations = offer['translations'];
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
