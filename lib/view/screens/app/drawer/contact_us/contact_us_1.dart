import 'package:flutter/material.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/view/widget/auth/customButton.dart';

class ContactUs1 extends StatelessWidget {
  const ContactUs1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage(AppImageAsset.bac),
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 150,),
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(AppImageAsset.oBJECTS,
                    alignment: Alignment.center),
              ),
              const SizedBox(height: 80,),
              const Text(
                'Thank you',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1ABCBC),
                ),
              ),
              Text(
                'I Will Reply To You The Fastest\n  Available Time',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.50),
                ),
              ),
              const SizedBox(height: 40,),
              CustomButton(
                onPressed: () {
                  // controller.goToSignIn();
                },
                text: 'OK',
                fontSize: 20,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
