import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/core/constant/routes.dart';
import 'package:xpress_app/core/localization/change_local.dart';
import 'package:xpress_app/view/screens/auth/widgets/custom_button_lang.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1'.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            CustomButtonLang(
              textButton: 'Ar',
              onPressed: () {
                controller.changeLang('ar');
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
            CustomButtonLang(
              textButton: 'En',
              onPressed: () {
                controller.changeLang('en');
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
