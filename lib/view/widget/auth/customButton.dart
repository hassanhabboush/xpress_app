import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  void Function()? onPressed;
  final String text;
  final double fontSize;

  CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1ABCBC),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          minimumSize: const Size(130, 35)),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
