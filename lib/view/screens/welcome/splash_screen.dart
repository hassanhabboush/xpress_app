import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/core/constant/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(Duration(seconds: 3), () {
    //   Get.toNamed(AppRoutes.onBoarding);
    // });

    Future.delayed(Duration(seconds: 3), () {

      String route =
      UserPreferencesController().getValueFor<bool>(PrefKeys.loggedIn) ??
          false
          ?AppRoutes.main_screen
          : AppRoutes.city;

      Get.offAllNamed(route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF8FCF7),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image(
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            image: AssetImage(
              AppImageAsset.background,
            ),
          ),
        ],
      ),
    );
  }
}
