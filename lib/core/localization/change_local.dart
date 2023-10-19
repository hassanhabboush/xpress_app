import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/core/constant/app_theme.dart';
import 'package:xpress_app/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? language; //

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString('lang', langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPreflLang = myServices.sharedPreferences.getString('lang');
    if (sharedPreflLang == 'ar') {
      language = const Locale('ar');
      appTheme = themeArabic;
    } else if (sharedPreflLang == 'en') {
      language = const Locale('en');
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
