import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this; //يقوم برأرجاع object
  }

}


initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
