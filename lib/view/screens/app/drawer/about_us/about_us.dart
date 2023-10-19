import 'package:flutter/material.dart';
import 'package:xpress_app/core/constant/image_asset.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage(AppImageAsset.about_us),
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          const Image(
            image: AssetImage(AppImageAsset.about_us_black),
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          const Positioned(
            top: 33,
            left: 17,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                height: 550,
                child: Stack(
                  children: [
                    const Image(
                      image: AssetImage(AppImageAsset.about_us_bac),
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0, top: 45),
                          child: Text(
                            'About Us',
                            style: TextStyle(
                                color: Color(0xff1ABCBC),
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          ),
                        ),
                        const SizedBox(height: 20),
                      SizedBox(
                        height: 425,
                        child: ListView(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Contrary to popular belief, Lorem Ipsum is not simp\ntext. It has roots in a piece of classical Latin literature\n from 45 BC, making',
                                style: TextStyle(fontSize: 13, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Contrary to popular belief, Lorem Ipsum is not simply rand\n text. It has roots in a piece of classical Latin literature\n from 45 BC, making\nit over 2000 years old. Richard McClintock, a Latin profess\n at Hampden-Sydney College in Virginia, looked up one of\n the more obscure\nLatin words, consectetur, from a Lorem Ipsum passage,\n and going through the cites of the\nword in classical literature, discovered the undoubtable s.\n Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of\n "de Finibus Bonorum et Malorum" (The Extremes of Good\n and Evil) by Cicero, written in 45 BC. This book is a treatise\n on the theory of ethics, very popular during the\n Renaissance. The first line of Lorem Ipsum, "Lorem ipsum\n dolor sit amet..", comes from a line in section 1.10.32.',
                                style: TextStyle(fontSize: 13, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
