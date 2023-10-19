import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpress_app/core/constant/icon_asset.dart';

class CustomListTileDrawer extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final String icon;
final  void Function() onPressed;

  const CustomListTileDrawer({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
       icon,
        width: width,
        height: height,
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          AppIconAsset.right_arrow,
          height: 13,
          width: 7,
        ),
      ),
    );
  }
}
