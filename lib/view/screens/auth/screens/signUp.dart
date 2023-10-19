import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/core/constant/routes.dart';
import 'package:xpress_app/core/function/alert_exit_app.dart';
import 'package:xpress_app/view/screens/auth/widgets/signUp_container.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Stack(
          children: [
            // Icon(Icons.arrow_back_ios),
            Stack(
              children: [
                const Image(
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                  image: AssetImage(
                    AppImageAsset.signIn_bac,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 22,
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(bottom: 30),
                    child: IconButton(
                      icon: const Icon(
                        // size: 10,
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                const Positioned(
                  top: 80,
                  left: 20,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
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
              ],
            ),
            const Center(
              child: SignUpContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
