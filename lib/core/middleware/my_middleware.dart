import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/core/constant/routes.dart';
import 'package:xpress_app/core/services/services.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.sharedPreferences.getString("OnBoarding") == "1"){
      return const RouteSettings(name: AppRoutes.city);
    }
    return null;
  }
}