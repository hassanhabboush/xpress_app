import 'package:get/get.dart';
import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';

class GetProfileController extends GetxController {
  UserPreferencesController userPreferencesController =
      UserPreferencesController();


  @override
  void onInit() {
    super.onInit();
    userPreferencesController = Get.put(UserPreferencesController());
  }

  // Future<void> getProfile() async {
  //   var email;
  //   var userName;
  //   var phone;
  //
  //   email = userPreferencesController.email;
  //   phone = userPreferencesController.phone;
  //   userName = userPreferencesController.name;
  // }



  // Future<Map<String, dynamic>> getProfile() async {
  //   var email = userPreferencesController.email;
  //   var phone = userPreferencesController.phone;
  //   var userName = userPreferencesController.name;
  //
  //   return {
  //     'email': email,
  //     'phone': phone,
  //     'userName': userName,
  //   };
  // }
}