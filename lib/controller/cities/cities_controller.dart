import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpress_app/core/class/api_setting.dart';
import 'package:http/http.dart' as http;
import 'package:xpress_app/data/model/cities.dart';

class CitiesController extends GetxController {
  List<Cities> cities = [];
  late SharedPreferences prefs;


  Future<List<Cities>> fetchData() async {
    final response =
    await http.get(Uri.parse(ApiSettings.CITIES));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      var jsonArray = data['cities'] as List;
      print('jsonArray: $jsonArray');

      return cities = jsonArray

          .map((jsonObject) => Cities.fromJson(jsonObject))
          .toList();
    }
    prefs = await SharedPreferences.getInstance();
    return [];
  }

  Future<void> getCities() async {
    final response = await http.get(Uri.parse(ApiSettings.CITIES));
    if (response.statusCode == 200) {
      print('statusCode: ${response.statusCode}');
      final data = jsonDecode(response.body);
      print('data: $data');
      var jsonArray = data['cities'];
      print('jsonArray: $jsonArray');
      return jsonArray;
    }
    update();
  }
}
