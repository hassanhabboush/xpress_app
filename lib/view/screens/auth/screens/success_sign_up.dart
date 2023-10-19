import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/core/constant/routes.dart';
import 'package:xpress_app/view/widget/auth/customButton.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    // SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Image(
              image: AssetImage(AppImageAsset.bac),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Text('Welcome',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Color(0xff1ABCBC),),),
                  Text('Thank You For Registering With\nThe Express Application',textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const Image(image: AssetImage(AppImageAsset.successSignup)),
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    width: 150,
                    child: CustomButton(
                      onPressed: () {
                        // controller.goToSignIn();
                        Get.offAllNamed(AppRoutes.main_screen);
                      },
                      text: 'Home',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
