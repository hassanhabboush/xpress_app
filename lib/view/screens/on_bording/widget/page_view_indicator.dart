import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {

  final double marginEnd;
  final bool selected;


  const PageViewIndicator({super.key, this.marginEnd = 0,required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:selected ? Color(0xff1ABCBC) : Colors.white,
      ),
    );
  }
}
