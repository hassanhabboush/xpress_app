import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';
import 'package:xpress_app/core/localization/change_local.dart';
import 'package:xpress_app/core/localization/translation.dart';
import 'package:xpress_app/core/services/services.dart';
import 'package:xpress_app/routes.dart';
import 'package:xpress_app/view/screens/app/checkout/checkout.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  final userPreferencesController = UserPreferencesController();
  await userPreferencesController.intSharedPreferences();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      translations: MyTranslation(),
      theme: controller.appTheme,
      // getPages: routes,
      home:Checkout (),
    );
  }
}