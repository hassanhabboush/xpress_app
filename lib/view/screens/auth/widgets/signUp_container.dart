import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/auth/sign_up_contrller.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/core/function/valid_Input.dart';
import 'package:xpress_app/view/screens/auth/widgets/custom_text_formField.dart';
import 'package:xpress_app/view/widget/auth/customButton.dart';

class SignUpContainer extends StatefulWidget {
  const SignUpContainer({super.key});

  @override
  State<SignUpContainer> createState() => _SignUpContainerState();
}

class _SignUpContainerState extends State<SignUpContainer> {
  RegisterationController controller = Get.put(RegisterationController());

  bool isChecked = false;

  // String? _userNameError;
  //
  // String? _emailError;
  //
  // String? _mobileError;
  //
  // String? _passwordError;

  String? userName;

  String? email;

  String? mobile;

  String? password;

  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 120),
      height: 500,
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                height: 45,
              ),
              registerWidget(),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: Colors.yellow,
                      // tristate: true,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Text(
                      'you agree to the Terms& Privacy Policy ',
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              CustomButton(
                onPressed: () {
                  controller.registerWithEmail(context);
                },
                text: 'Sign Up',
                fontSize: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        CustomTextFormField(
          onChanged: (value) {
            userName = value;
          },
          isNumber: false,
          myController: controller.nameController,
          text: 'User Name',
          prefixIcon: Icons.person,
          autofocus: true,
          enabled: true,
          color: const Color(0xff000000),
          fontSize: 15,
          // textError: _userNameError,
        ),
        const SizedBox(
          height: 20,
        ),
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

          validator: validInput('email@gmail.com', 5, 20, 'email'),
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
          onChanged: (value) {
            mobile = value;
          },
          isNumber: false,
          myController: controller.mobileController,
          text: 'Phone',
          prefixIcon: Icons.phone_android,
          autofocus: true,
          enabled: true,
          color: const Color(0xff000000),
          fontSize: 15,
          // textError: _mobileError,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          onChanged: (value) {
            password = value;
          },
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
