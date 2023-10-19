import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/auth/get_profile.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/view/screens/app/drawer/menu/drawer.dart';
import 'package:xpress_app/view/screens/app/drawer/menu/g.dart';
import 'package:xpress_app/view/screens/app/profile/editeProfile.dart';
import 'package:xpress_app/view/screens/app/profile/widget/container_profile.dart';
import 'package:xpress_app/view/widget/auth/customButton.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GetProfileController _getProfile = Get.put(GetProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          const Image(
            image: AssetImage(
              AppImageAsset.profile_bac,
            ),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // SizedBox(
          //   height: 130,
          //   width: 60,
          //   child: IconButton(
          //     icon: const Icon(
          //       Icons.menu,
          //       color: Color(0xffFFFFFF),
          //     ),
          //     onPressed: () {
          //       DD();
          //       print('object');
          //     },
          //   ),
          // ),

          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 150, left: 0),
                  child: const Image(
                    image: AssetImage(AppImageAsset.profile),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0),
                  child: Text(
                    _getProfile.userPreferencesController.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff1ABCBC),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Column(
                  children: [
                    ContainerProfile(
                      marginBottom: 10,
                      marginEnd: 10,
                      marginStart: 10,
                      marginTop: 29,
                      icon: Icons.email,
                      title: 'Email',
                      textEmail: _getProfile.userPreferencesController.email,
                    ),
                    ContainerProfile(
                      marginEnd: 10,
                      marginStart: 10,
                      icon: Icons.phone,
                      title: 'Phone number ',
                      textEmail: _getProfile.userPreferencesController.phone,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                CustomButton(
                  onPressed: () {
                    // Get.toNamed(AppRoutes.editeProfile);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditeProfile(),
                        ));
                  },
                  text: 'Edite profile',
                  fontSize: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
