import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/auth/sign_up_contrller.dart';
import 'package:xpress_app/controller/auth/user_controller.dart';
import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/core/utils/helpers.dart';
import 'package:xpress_app/view/screens/app/profile/profile.dart';
import 'package:xpress_app/view/screens/auth/widgets/custom_text_formField.dart';
import 'package:xpress_app/view/widget/auth/customButton.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> with Helpers{
  // SignUpControllerImp controller = Get.put(SignUpControllerImp());

  late TextEditingController _passwordNameEditingController;

  late TextEditingController _oldPasswordEditingController;

  late TextEditingController _confirmPasswordEditingController;

  late UserPreferencesController userPreferencesController;

  var accessToken;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _passwordNameEditingController = TextEditingController();
    _oldPasswordEditingController = TextEditingController();
    _confirmPasswordEditingController = TextEditingController();
    userPreferencesController = UserPreferencesController();
    accessToken = userPreferencesController.accessToken;
    print('accessToken: $accessToken');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordNameEditingController.dispose();
    _oldPasswordEditingController.dispose();
    _confirmPasswordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        elevation: 0,
        shadowColor: const Color(0xff000000).withOpacity(0.10),
        backgroundColor: const Color(0xff1ABCBC),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(
              25,
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          color: Colors.white,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const Image(
              image: AssetImage(AppImageAsset.bac),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                height: 450,
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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                          height: 50,
                        ),
                        CustomTextFormField(
                          text: 'Old Password',
                          color: const Color(0xff000000),
                          fontSize: 15,
                          // prefixIcon: Icons.key,
                          isNumber: false,
                          myController: _oldPasswordEditingController,
                          // textError: '',
                        ),
                        SizedBox(height: 20),
                        CustomTextFormField(
                          text: 'New Password',
                          color: const Color(0xff000000),
                          fontSize: 15,
                          // prefixIcon: Icons.key,
                          isNumber: false,
                          myController:_passwordNameEditingController ,
                          // textError: '',
                        ),
                        SizedBox(height: 20),
                        CustomTextFormField(
                          text: 'Confirm Password',
                          color: const Color(0xff000000),
                          fontSize: 15,
                          // prefixIcon: Icons.key,
                          isNumber: false,
                          myController: _confirmPasswordEditingController,
                          // textError: '',
                        ),
                        SizedBox(height: 50),
                        CustomButton(
                          onPressed: () {
                            performChangePassword();
                          },
                          text: 'Change',
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



  Future<void> performChangePassword() async {
    if (checkData()) {
      changePassword();
    }
  }

  bool checkData() {
    if (_passwordNameEditingController.text.isNotEmpty &&
        _oldPasswordEditingController.text.isNotEmpty &&
        _confirmPasswordEditingController.text.isNotEmpty) {
      return true;
    }

    return false;
  }

  Future<void> changePassword() async {
    bool status = await UserApiController().changePassword(_passwordNameEditingController.text, _oldPasswordEditingController.text, _confirmPasswordEditingController.text, context, accessToken);

    if (status) {
      // Get.toNamed(AppRoutes.main_screen);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Profile(),));
    } else {
      // ignore: use_build_context_synchronously
      showSnakeBar(
          context: context, message: 'Login failed, try again', error: true);
    }
  }
}
