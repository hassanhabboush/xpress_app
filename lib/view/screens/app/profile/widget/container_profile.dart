import 'package:flutter/material.dart';

class ContainerProfile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String textEmail;
  final double marginTop;
  final double marginStart;
  final double marginEnd;
  final double marginBottom;


  ContainerProfile({
   required this.icon,
   required this.title,
   required this.textEmail,
    this.marginTop = 0,
    this.marginStart = 0,
    this.marginEnd = 0,
    this.marginBottom = 0,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsetsDirectional.only(top: marginTop, start: marginStart,end: marginEnd,bottom: marginBottom),
      alignment: AlignmentDirectional.center,
      // constraints: const BoxConstraints(maxHeight: 70),
      height: 48,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
           Icon(
           icon,
            color: const Color(0xff1ABCBC),
          ),
          const SizedBox(width: 20),
           Text(
           title,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xff1ABCBC),
            ),
          ),
          const Spacer(),
          Text(
            textEmail,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black.withOpacity(0.50),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
