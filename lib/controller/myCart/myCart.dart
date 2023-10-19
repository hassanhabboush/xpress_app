

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:xpress_app/core/class/api_setting.dart';
import 'package:xpress_app/core/utils/helpers.dart';
import 'package:xpress_app/data/model/myCart.dart';

class MyCartController extends GetxController with Helpers{
  // RxList<MyCarts> myCarts = <MyCarts>[].obs;
  List<dynamic> myCarts  = [];
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // getCarts(context);
  }

  // Future<List<Products>> getProducts() async {
  //   var url = Uri.parse(ApiSettings.MYCART);
  //   var response = await http.get(url);
  //   print('url: $url');
  //   if (response.statusCode == 200) {
  //     print(response.statusCode);
  //     var jsonResponse = jsonDecode(response.body);
  //     var jsonArray = jsonResponse['MyCart'] as List;
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


  // Future<void> getCarts() async {
  //   isLoading.value = true;
  //   final headers = {
  //     'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGEyMGE0ZjliNGY4YzlkZGI1YWI1ZjFiOTFiNWI4YTI0MGIwYWQ5ODMyZDVlOWQ4MDg1ZTg1YmU3YWI3OWNjMTk2ODdkNmY0Y2RhOTcwYmEiLCJpYXQiOjE2OTQ5Mzc2OTUuNzQxNTM4LCJuYmYiOjE2OTQ5Mzc2OTUuNzQxNTQzLCJleHAiOjE3MjY1NjAwOTUuNzI1MTk3LCJzdWIiOiI2OTMiLCJzY29wZXMiOltdfQ.UuLbxiLaTyayoLcCl2pGyC5rNzXU5QsCa-gNBSeaU_3V0bBKmtxHEnD5EnRIZrpe0907vTx9VTZqd69NUiBJ4T4iiXZHT_m8uHI2aLsSVmAiYAD-0EJ8W9IMq72yxQcxCwWy8wZMC7yaZZP9FgtgPDZJKkSlpQSVCjrwysyK6O6pk1tyUE4h5i6o6OO-_DAwTbEFdfRJM8wcvVfTcpxeNt_LJamSuRLYrXI5USaK9H2CrsiAvn3KW2LyGiZZDx69cZSrqbLDiScmm1yomkBfqJPi3kngqXeOt0lYE9fIGpFOxpIL1GSrDRY-mWMd_dYPdh0rJfAtI_zVHDYpcds8b59ETFTTl45JS1cKnpj3h72_vZpYWds-IVdFUGZWJFt5hFsvt5-a0kBM4D_q61NUJ9uHFkZ64ZUta9Sg7wYcUCyE8ngaFXsP411sMSJC6oH79ogqAOn6cZooy6OFRPHuyxSWe7IKjkZZrlaRLqc_NN3_FUJlkIUa55GOR3R5DyM0imKD3sSv8VeZXVkdrrW_EaSG1U8I_IVQIb__PBcdNYnfwqd8HJl3O-rkphM_DB2ScR-FHW4OAeHru-qAyQ0RPVWfAxa7f4lb_x6gpQ73SaDtZy-y4VuBYdiy_tzH80n0dZMhQ1Yuh9ZRjYqoVzP1Yj_tB5IlJK_Gw0APwkT4004', // استبدله بقيمة المفتاح الخاص بك
  //     'fcmToken' : 'Postman_fcm_token',
  //   };
  //   final response = await http.get(Uri.parse(ApiSettings.MYCART),headers: headers);
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     print('data $data');
  //     if (data != null) {
  //       myCarts.value = (data['MyCart'] as List<dynamic>).map((item) =>
  //           MyCarts.fromJson(item)).toList();
  //       print('myCarts(1): $myCarts');
  //       // تحديث واجهة المستخدم بعد استلام البيانات
  //     }
  //   }
  //   isLoading.value = false;
  // }

  Future<void> fetchData() async {
    isLoading.value = true;
    final url = ApiSettings.MYCART;
    final headers = {
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGEyMGE0ZjliNGY4YzlkZGI1YWI1ZjFiOTFiNWI4YTI0MGIwYWQ5ODMyZDVlOWQ4MDg1ZTg1YmU3YWI3OWNjMTk2ODdkNmY0Y2RhOTcwYmEiLCJpYXQiOjE2OTQ5Mzc2OTUuNzQxNTM4LCJuYmYiOjE2OTQ5Mzc2OTUuNzQxNTQzLCJleHAiOjE3MjY1NjAwOTUuNzI1MTk3LCJzdWIiOiI2OTMiLCJzY29wZXMiOltdfQ.UuLbxiLaTyayoLcCl2pGyC5rNzXU5QsCa-gNBSeaU_3V0bBKmtxHEnD5EnRIZrpe0907vTx9VTZqd69NUiBJ4T4iiXZHT_m8uHI2aLsSVmAiYAD-0EJ8W9IMq72yxQcxCwWy8wZMC7yaZZP9FgtgPDZJKkSlpQSVCjrwysyK6O6pk1tyUE4h5i6o6OO-_DAwTbEFdfRJM8wcvVfTcpxeNt_LJamSuRLYrXI5USaK9H2CrsiAvn3KW2LyGiZZDx69cZSrqbLDiScmm1yomkBfqJPi3kngqXeOt0lYE9fIGpFOxpIL1GSrDRY-mWMd_dYPdh0rJfAtI_zVHDYpcds8b59ETFTTl45JS1cKnpj3h72_vZpYWds-IVdFUGZWJFt5hFsvt5-a0kBM4D_q61NUJ9uHFkZ64ZUta9Sg7wYcUCyE8ngaFXsP411sMSJC6oH79ogqAOn6cZooy6OFRPHuyxSWe7IKjkZZrlaRLqc_NN3_FUJlkIUa55GOR3R5DyM0imKD3sSv8VeZXVkdrrW_EaSG1U8I_IVQIb__PBcdNYnfwqd8HJl3O-rkphM_DB2ScR-FHW4OAeHru-qAyQ0RPVWfAxa7f4lb_x6gpQ73SaDtZy-y4VuBYdiy_tzH80n0dZMhQ1Yuh9ZRjYqoVzP1Yj_tB5IlJK_Gw0APwkT4004', // استبدله بقيمة المفتاح الخاص بك
      'fcmToken' : 'Postman_fcm_token',
    };

    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);

       myCarts = jsonData['MyCart'] as List;
      return jsonData
              .map((jsonObject) => MyCarts.fromJson(jsonObject))
              .toList();

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    isLoading.value = false;
  }


  // Future<void> getCarts(BuildContext context) async {
  //   isLoading.value = true;
  //   final headers = {
  //     'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZjkzMjczMTlhNDkwYjkzODIxNDgyYWJlZjVmZjAxMDk4ZWM1ZDI4ODhkZmZmMWMzMDVkNmUzNGVhMjk1NWMzY2Y5ZDA3M2UwMjM2YTRiNzAiLCJpYXQiOjE2OTY0NTEzNjIuNTgzMjU2LCJuYmYiOjE2OTY0NTEzNjIuNTgzMjYxLCJleHAiOjE3MjgwNzM3NjIuNTM2NzkxLCJzdWIiOiI3MDIiLCJzY29wZXMiOltdfQ.Qg_7uyW2HDKqPUw9XUU3r0Ja5Ypfhd4ZsePpd8OjoCdZceNZX4UJGifpY47XW-1z6bKi784ULGwOGW7Ta1-gKKNtNDWRDa2SAcOCOZ9GsyBY7Kc2F6-FPd0iXP1nw0qpZlslVTNYrDp9RdHAICmX0mHeGtLR-YZOh3eHNUeetSaHj4_LakqCEj7b8PdLpmusQBhd-6fTSJf5QDOJnOn7FOZUMcQ2Sjndwe-X2QkLVr7B6LcQeSAmG7t6TlYhkuzIeVecrYWhOY3GdsskybnKdtunwRWE6yv-Luq60T2PVKuX9nHLUaPbxVzmWeGu1Sljm0C81t8IqvjLdMt-Uhci2wJxTfkz6EXxCkJR1qUJHKySb3Tw20DI9lSCHaDCnbxVoEDQyJbzZ1YPLacQD4b9EHfZ4quv8bf3yN4B3hxmFCSWpgGPPDAmcIXYrk-vlHdzHuQGbaIoGywm-RzPZK9cDAo6HbE4uijJGI25wrQGPXushyFTc8RK-YWhQEQ9AYWSm2_p_yO1HniQq5GHnlISV4WSsn8RXnjASvk1SGMq6YBvKZcLxcNsi5dFERFaQj8K94lqEJXSyXfYoBp41CmYe4lDMIHehUifEd16s5sUTwNsGVAj3pGS9JatVOP0-2-rtA1y7O2p5dF6ZKjA7wEGMMxDeGejbtzBEchYFvmyi-0',
  //     'fcmToken': 'Postman_fcm_token',
  //   };
  //   final response = await http.get(
  //       Uri.parse(ApiSettings.MYCART), headers: headers);
  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     myCarts.value = (jsonData['MyCart'] as List)
  //         .map((cartJson) => MyCarts.fromJson(cartJson))
  //         .toList();
  //
  //   } else {
  //     // isLoading.value = false;
  //     showSnakeBar(context: context, message: jsonDecode(response.body)['message']);
  //   }
  // }
}