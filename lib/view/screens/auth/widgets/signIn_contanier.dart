import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/auth/login_contrller.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/core/function/valid_Input.dart';
import 'package:xpress_app/core/utils/helpers.dart';
import 'package:xpress_app/view/screens/auth/widgets/custom_text_formField.dart';
import 'package:xpress_app/view/widget/auth/customButton.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({super.key});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> with Helpers {
  String? email;
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  bool isShowPassword = true;
  LoginController controller = Get.put(LoginController());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, right: 20, left: 20),
      height: MediaQuery.of(context).size.height * .660,
      width: double.infinity,
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              AppImageAsset.logo,
            ),
            const SizedBox(
              height: 45,
            ),

            loginWidget(),

            const SizedBox(
              height: 0,
            ),
            // GetBuilder<LoginControllerImp>(
            //   builder: (controller) => CustomTextFormField(
            //     isNumber: true,
            //     valid: (val) {
            //       return validInput(val!, 5, 30, "password");
            //     },
            //     obscureText: controller.isShowPassword,
            //     myController: controller.password,
            //     text: 'Password',
            //     color: const Color(0xff000000),
            //     fontSize: 15,
            //     prefixIcon: Icons.key,
            //     // textError: '',
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () {
                controller.loginWithEmail(context);
              },
              text: 'Sign in',
              fontSize: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Text(
                      'Don’t have an account ?',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 1,
                ),
                InkWell(
                  onTap: () {
                    // controller.goToSignUp();
                    Navigator.pushNamed(context, '/signUp');
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Color(0xff1ABCBC),
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget loginWidget() {
    return Column(
      children: [
        CustomTextFormField(
          onChanged: (value) {
            email = value;
          },
          // validator: (value) {
          //   if (value!.isEmpty) {
          //     return 'يرجى إدخال البريد الإلكتروني';
          //   } else if (!emailRegex.hasMatch(value)) {
          //     return 'يرجى إدخال البريد الإلكتروني';
          //   }
          //   return null;
          // },

          validator: (val) {
            return validInput(val!, 5, 30, "email");
          },
          isNumber: false,
          myController: controller.emailController,
          text: 'Email',
          prefixIcon: Icons.email,
          autofocus: true,
          enabled: true,
          color: const Color(0xff000000),
          fontSize: 15,
          // textError: _emailError,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          // onChanged: (value) {
          //   password = value;
          // },
          isNumber: false,
          myController: controller.passwordController,
          text: 'Password',
          prefixIcon: Icons.lock,
          // autofocus: true,
          enabled: true,
          color: const Color(0xff000000),
          fontSize: 15,
          // textError: _passwordError,
        ),
        // const SizedBox(
        //   height: 20,
        // ),
      ],
    );
  }
}
