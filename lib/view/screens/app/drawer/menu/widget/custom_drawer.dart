import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xpress_app/core/constant/icon_asset.dart';
import 'package:xpress_app/core/constant/routes.dart';
import 'package:xpress_app/view/screens/app/drawer/FAQ/faq.dart';
import 'package:xpress_app/view/screens/app/drawer/contact_us/contact_us.dart';
import 'package:xpress_app/view/screens/app/drawer/menu/custom_listTile_drawer.dart';
import 'package:xpress_app/view/screens/app/drawer/privacy_policy/privacy_policy.dart';
import 'package:xpress_app/view/screens/app/drawer/terms/terms.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: const BoxDecoration(
                        color: Color(0xff1ABCBC),
                        borderRadius:  BorderRadius.only(
                            bottomRight: Radius.circular(100))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.17,
                  ),
                  const Text(
                    'Menu',
                    style: TextStyle(color: Color(0xff1ABCBC), fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Column(
                  children: [
                    CustomListTileDrawer(
                      width: 20,
                      height: 20,
                      text: 'My Orders',
                      icon: AppIconAsset.shopping_basket,
                      onPressed: () {
                        Get.back();
                        Get.toNamed(AppRoutes.my_orders);

                      },
                    ),
                    CustomListTileDrawer(
                      width: 20,
                      height: 20,
                      text: 'Change Languags',
                      icon: AppIconAsset.translation,
                      onPressed: () {
                        Get.back();
                        // Get.toNamed(AppRoutes.my_orders);
                      },
                    ),

                    // ListTile(
                    //   leading: SvgPicture.asset(
                    //     AppIconAsset.shopping_basket,
                    //     width: 20,
                    //     height: 20,
                    //   ),
                    //   title: Text(
                    //     'Change Languags',
                    //     style: const TextStyle(fontSize: 15, color: Colors.black),
                    //   ),
                    //   trailing: IconButton(
                    //     onPressed: () {},
                    //     icon: SvgPicture.asset(
                    //       AppIconAsset.right_arrow,
                    //       height: 13,
                    //       width: 7,
                    //     ),
                    //   ),
                    // ),

                    CustomListTileDrawer(
                      width: 20,
                      height: 20,
                      text: 'Change Password',
                      icon: AppIconAsset.padlock,
                      onPressed: () {
                        Get.back();
                        Get.toNamed(AppRoutes.change_password);
                      },
                    ),

                    CustomListTileDrawer(
                      width: 20,
                      height: 20,
                      text: 'Change Country',
                      icon: AppIconAsset.placeholder,
                      onPressed: () {
                        Get.back();
                        Get.toNamed(AppRoutes.city);
                      },
                    ),
                    CustomListTileDrawer(
                      width: 20,
                      height: 20,
                      text: 'About us',
                      icon: AppIconAsset.warning,
                      onPressed: () {
                        Get.back();
                        Get.toNamed(AppRoutes.about_us);
                      },
                    ),
                    CustomListTileDrawer(
                      width: 20,
                      height: 20,
                      text: 'Contact us',
                      icon: AppIconAsset.contact,
                      onPressed: () {
                        Get.back();
                        // Get.toNamed(AppRoutes.contact_us);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Contactus(),));
                      },
                    ),
                    CustomListTileDrawer(
                      width: 20,
                      height: 20,
                      text: 'Share App',
                      icon: AppIconAsset.application,
                      onPressed: () {
                        Get.back();
                        // Get.toNamed(AppRoutes.my_orders);
                      },
                    ),
                    CustomListTileDrawer(
                      width: 20,
                      height: 20,
                      text: 'FQA',
                      icon: AppIconAsset.info,
                      onPressed: () {
                        Get.back();
                        // Get.toNamed(AppRoutes.faq);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FAQ(),));
                      },
                    ),
                    CustomListTileDrawer(
                      width: 20,
                      height: 20,
                      text: 'Terms of use',
                      icon: AppIconAsset.write_letter,
                      onPressed: () {
                        Get.back();
                        // Get.toNamed(AppRoutes.terms);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Terms(),));
                      },
                    ),
                    CustomListTileDrawer(
                      width: 20,
                      height: 20,
                      text: 'Privacy policy',
                      icon: AppIconAsset.list,
                      onPressed: () {
                        Get.back();
                        // Get.toNamed(AppRoutes.privacy_policy);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy(),));
                      },
                    ),
                    CustomListTileDrawer(
                      width: 20,
                      height: 20,
                      text: 'Logout',
                      icon: AppIconAsset.logout,
                      onPressed: () {
                        Get.back();
                        Get.toNamed(AppRoutes.signIn);
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIconAsset.facbook),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIconAsset.instagram),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIconAsset.twitter),
                  ),
                ],
              ),
              const Text(
                'Powered by HEXA',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
