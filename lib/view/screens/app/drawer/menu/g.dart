import 'package:flutter/material.dart';
import 'package:xpress_app/view/screens/app/drawer/menu/drawer.dart';

class DD extends StatelessWidget {
  const DD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
    );
  }
}
