import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/auth/edit_profile_contrller.dart';
import 'package:xpress_app/controller/auth/sign_up_contrller.dart';
import 'package:xpress_app/controller/auth/user_controller.dart';
import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/core/function/alert_exit_app.dart';
import 'package:xpress_app/core/utils/helpers.dart';
import 'package:xpress_app/view/screens/app/profile/profile.dart';
import 'package:xpress_app/view/screens/auth/widgets/custom_text_formField.dart';
import 'package:xpress_app/view/widget/auth/customButton.dart';

class EditeProfile extends StatefulWidget {
  const EditeProfile({super.key});

  @override
  State<EditeProfile> createState() => _EditeProfileState();
}

class _EditeProfileState extends State<EditeProfile> with Helpers {

  final EditProfileController _editProfileController = Get.put(EditProfileController());

  // late TextEditingController _userNameEditingController;
  //
  // late TextEditingController _emailEditingController;
  //
  // late TextEditingController _phoneEditingController;
  //
  late UserPreferencesController userPreferencesController;

  // var accessToken;
  //
  // var email;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  //   _userNameEditingController = TextEditingController();
  //   _emailEditingController = TextEditingController();
  //   _phoneEditingController = TextEditingController();
    userPreferencesController = UserPreferencesController();
  //   accessToken = userPreferencesController.accessToken;
  //   email = userPreferencesController.email;
  //   print('accessToken: $accessToken');
  //   print('email: $email');
  }
  //
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _userNameEditingController.dispose();
  //   _emailEditingController.dispose();
  //   _phoneEditingController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
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

            Stack(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 150, left: 215,),
                    child: const Image(
                      image: AssetImage(AppImageAsset.edit),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 150, left: 110),
                  child: const Image(
                    image: AssetImage(AppImageAsset.profile),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 20,top: 10),
                height:  MediaQuery.of(context).size.height * 0.53,
                width: MediaQuery.of(context).size.width * 0.9,
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
                          height: 0,
                        ),
                        const Text(
                          'Edite Profile',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff1ABCBC),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormField(
                          enabled: true,
                          text: 'User Name',
                          color: const Color(0xff000000),
                          fontSize: 15,
                          prefixIcon: Icons.person,
                          isNumber: true,
                          myController: _editProfileController.nameController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          text: 'Email',
                          color: const Color(0xff000000),
                          fontSize: 15,
                          prefixIcon: Icons.email,
                          isNumber: true,
                          myController: _editProfileController.emailController,
                          enabled: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          enabled: true,
                          text: 'Phone number ',
                          color: const Color(0xff000000),
                          fontSize: 15,
                          prefixIcon: Icons.phone,
                          isNumber: true,
                          myController: _editProfileController.mobileController,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                          onPressed: () {
                            _editProfileController.editProfile(context);
                            print('accessToken: ${userPreferencesController.name}');
                          },
                          text: 'save',
                          fontSize: 20,
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
  //
  //
  // Future<void> performLogin() async {
  //   if (checkData()) {
  //     editProfile();
  //   }
  // }
  //
  // bool checkData() {
  //   if (_emailEditingController.text.isNotEmpty &&
  //       _userNameEditingController.text.isNotEmpty &&
  //       _phoneEditingController.text.isNotEmpty) {
  //     return true;
  //   }
  //
  //   return false;
  // }
  //
  // Future<void> editProfile() async {
  //   bool status = await UserApiController().editProfile(
  //       _userNameEditingController.text, _emailEditingController.text,
  //       _phoneEditingController.text, context, accessToken);
  //
  //   if (status) {
  //     // Get.toNamed(AppRoutes.main_screen);
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => Profile(),));
  //   } else {
  //     // ignore: use_build_context_synchronously
  //     showSnakeBar(
  //         context: context, message: 'Login failed, try again', error: true);
  //   }
  // }


}
