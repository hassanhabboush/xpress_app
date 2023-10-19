import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/core/constant/routes.dart';
import 'package:xpress_app/core/function/alert_exit_app.dart';
import 'package:xpress_app/view/screens/auth/widgets/signIn_contanier.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            const Image(
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              image: AssetImage(
                AppImageAsset.signIn_bac,
              ),
            ),

            // Image(
            //
            //   fit: BoxFit.fitWidth,
            //   width: double.infinity,
            //   image: AssetImage(
            //     AppImageAsset.bakToSign,
            //   ),
            // ),
          const Positioned(
            top: 79,
            left: 20,
            child: Text(
              'Sign In',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                Get.offNamed(AppRoutes.main_screen);
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
            const Center(
              child: SingleChildScrollView(child: CustomContainer()),
            ),
          ],
        ),
      ),
    );
  }
}
