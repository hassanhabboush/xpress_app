import 'package:flutter/material.dart';
import 'package:xpress_app/view/screens/app/drawer/menu/widget/custom_drawer.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 70, top: 110),
            height: 40,
            width: 82,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withOpacity(0.16),
                  offset: Offset(3, 0),
                  blurRadius: 6,
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close),
              color: Colors.black,
            ),
          ),
        ),
        Drawer(

            backgroundColor: Colors.red, elevation: 0, child: CustomDrawer(),shape: RoundedRectangleBorder(

        )),
      ],
    );
  }
}
