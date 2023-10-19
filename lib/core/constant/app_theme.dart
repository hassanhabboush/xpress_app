import 'package:flutter/material.dart';
import 'package:xpress_app/core/constant/color_app.dart';

ThemeData themeEnglish = ThemeData(
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
    bodyMedium: TextStyle(height: 2, color: AppColor.gray, fontSize: 18),
  ),
);


ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
    bodyMedium: TextStyle(height: 2, color: AppColor.gray, fontSize: 18),
  ),
);

