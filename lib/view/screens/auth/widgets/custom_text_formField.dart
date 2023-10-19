import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xpress_app/core/constant/icon_asset.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final TextEditingController? myController;
  final String? Function(String?)? validator;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  // final String? textError;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final bool autocorrect;
  bool enabled = false;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;

  // String? prefixIcon;
  IconData? prefixIcon;
  final double opacityText;

  // final void Function(String)? onChang;
  final void Function(String?)? onSaved;

  CustomTextFormField({
    super.key,
    this.text = 'Email',
    this.focusNode,
    this.style,
    this.opacityText = 0.30,
    this.autofocus = false,
    this.readOnly = false,
    this.enabled = false,
    this.autocorrect = true,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.strutStyle,
    this.onTap,
    this.onSaved,
    this.textAlignVertical,
    this.color = Colors.black,
    this.fontSize = 20,
    // this.prefixIcon = AppIconAsset.email,
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.myController,
    this.validator,
    this.isNumber = false,
    this.obscureText,
    this.onTapIcon,
    this.onChanged,
    // this.textError,
    // this.onChang,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      focusNode: focusNode,
      style: style,
      autofocus: autofocus,
      readOnly: readOnly,
      enabled: enabled,
      autocorrect: autocorrect,
      textAlign: textAlign,
      textDirection: textDirection,
      strutStyle: strutStyle,
      onTap: onTap,
      onSaved: onSaved,
      textInputAction: textInputAction,
      textAlignVertical: textAlignVertical,
      onChanged: onChanged,
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: validator,
      controller: myController,
      obscureText: obscureText == null || obscureText == false ? false : true,
      decoration: InputDecoration(
        // error: Text(
        //   textError ?? '',
        //   style: const TextStyle(
        //     fontSize: 12,
        //     color: Color(0xffFC3346),
        //   ),
        // ),

        prefixIcon: Icon(
          prefixIcon,
          color: Color(0xff1ABCBC),
          size: 25,
        ),

        // prefixIcon: SvgPicture.asset(
        //   semanticsLabel: 'My SVG Image',
        //   prefixIcon ?? '',
        //   // height: 20,
        //     height: 6, width: 6,
        //     // fit: BoxFit.scaleDown,
        //   // placeholderBuilder: (context) {
        //   //   return Container(
        //   //     padding: const EdgeInsets.all(25),
        //   //     child: const CircularProgressIndicator(),
        //   //   );
        //   // },
        //   color: const Color(0xff1ABCBC),
        // ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        label: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: (color).withOpacity(opacityText),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff1ABCBC),
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff1ABCBC),
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff1ABCBC),
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff1ABCBC),
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
