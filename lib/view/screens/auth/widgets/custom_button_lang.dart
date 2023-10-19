import 'package:flutter/material.dart';
import 'package:xpress_app/core/constant/color_app.dart';

class CustomButtonLang extends StatelessWidget {
  final String textButton;

  final void Function()? onPressed;

  const CustomButtonLang({
    super.key,
    required this.textButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(
          textButton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
