import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/auth/sign_up_contrller.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/core/function/alert_exit_app.dart';
import 'package:xpress_app/view/screens/auth/widgets/custom_text_formField.dart';
import 'package:xpress_app/view/widget/auth/customButton.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {

    RegisterationController controller = Get.put(RegisterationController());
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Stack(
          children: [
            // Icon(Icons.arrow_back_ios),
            const Image(
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              image: AssetImage(
                AppImageAsset.signIn_bac,
              ),
            ),
            const Positioned(
              top: 55,
              left: 20,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 0),
                height: 400,
                width: 335,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.20),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          AppImageAsset.logo,
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        const Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextFormField(
                          text: 'Password',
                          color: const Color(0xff000000),
                          fontSize: 15,
                          // prefixIcon: Icons.key,
                          isNumber: false,
                          myController: controller.passwordController,
                          // textError: '',
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        CustomButton(
                          onPressed: () {
                            // controller.goToSignIn();

                          },
                          text: 'Resend',
                          fontSize: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
