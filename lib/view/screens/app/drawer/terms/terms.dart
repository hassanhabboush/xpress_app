import 'package:flutter/material.dart';
import 'package:xpress_app/core/constant/image_asset.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms',
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
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: ListView(
                children: const [
                  Text(
                    'Terms and conditions',
                    style: TextStyle(
                      color: Color(0xff1ABCBC),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Contrary to popular belief, Lorem Ipsum is not simply\n random text. It has roots in a piece of classical Latin\n literature from 45 BC, making\nit over 2000 years old. Richard McClintock, a Latin\n professor at Hampden-Sydney College in Virginia, looked\n up one of the more obscure\nLatin words, consectetur, from a Lorem Ipsum passage,\n and going through the\n cites of theword in classical literature, discovered the undoubtable\n source. Lorem Ipsum comes from sections 1.10.32 and\n 1.10.33 of "de Finibus Bonorum et Malorum" (The\n Extremes of Good and Evil) by Cicero, written in 45 BC.\n This book is a treatise on the theory of ethics, very\n popular during the Renaissance. The first line of Lorem\n Ipsum, "Lorem ipsum dolor sit amet..", comes from a line\n in section 1.10.32.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff4A4A4A),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
