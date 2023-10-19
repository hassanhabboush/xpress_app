import 'package:flutter/material.dart';

class outBoardingContent extends StatelessWidget {
  final String title;
  final String body;
  final String? image;

  const outBoardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          height: double.infinity,
          fit: BoxFit.cover,
          width: double.infinity,
          image: NetworkImage(image!),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1ABCBC),
                    fontSize: 25),
              ),
              SizedBox(height: 10),
              Text(
                body,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 65),
            ],
          ),
        ),
      ],
    );
  }
}
