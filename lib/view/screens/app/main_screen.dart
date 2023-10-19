import 'package:flutter/material.dart';
import 'package:xpress_app/data/model/bn_screen.dart';
import 'package:xpress_app/view/screens/app/carts/carts.dart';
import 'package:xpress_app/view/screens/app/home/home.dart';
import 'package:xpress_app/view/screens/app/offers/offers.dart';
import 'package:xpress_app/view/screens/app/profile/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<BnScreen> _bnScreen = <BnScreen>[
    const BnScreen(
      widget: Home(),
    ),
    const BnScreen(
      widget: Profile(),
    ),
    const BnScreen(
      widget: Offers(),
    ),
    const BnScreen(
      widget: Carts(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bnScreen[_selectedIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          // يعملعند الضغط على tap
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        //...3 , تعمل بناءا على Index يعني 0 ,2
        showSelectedLabels: false,
        // هنا تتحكم ب ظهور label
        showUnselectedLabels: false,
        // يوجد فيها انيميشن و أيضا تتحكم في ظهور label
        // fixedColor: Colors.red, //  خاصية تتحك في لون ال BottomNaviga المختار و نفس الاسفل
        selectedItemColor: Colors.orange,
        //   selectedItemColor  اوfixedColor و توجد قاعدة اما تستخدم
        selectedIconTheme: const IconThemeData(color: Colors.red),
        // فإن الذي يحصل  selectedItemColor توجد قاعدة عند استخدام selectedIconTheme و
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        selectedFontSize: 14,
        // خاصية تتحكم في حجم النص
        unselectedFontSize: 12,
        // خاصية تتحكم ب حجم النص الذي لم يحدد
        unselectedIconTheme: const IconThemeData(color: Colors.black),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w300),
        unselectedItemColor: Colors.grey.shade800,
        backgroundColor: Colors.white,
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        // يعمل على تفعيل ظهور الخلفية لل BottomNavigationBar
        // iconSize: 25, //  خاصية تتحكم في حجم جميع الايقون بحجم واحد
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: Container(
              padding: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                  color: Color(0xff1ABCBC),
                  width: 3,
                ))),
                child: const Icon(
                  Icons.home,
                  color: Color(0xff1ABCBC),
                  size: 24,
                )),
            // activeIcon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.person_2_outlined),
            activeIcon: Container(
                padding: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                          color: Color(0xff1ABCBC),
                          width: 3,
                        ))),
                child: const Icon(
                  Icons.person,
                  color: Color(0xff1ABCBC),
                  size: 24,
                )),
            // activeIcon: Icon(Icons.home),
            label: 'Profile',
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.local_offer_outlined),
            activeIcon: Container(
                padding: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                          color: Color(0xff1ABCBC),
                          width: 3,
                        ))),
                child: const Icon(
                  Icons.local_offer,
                  color: Color(0xff1ABCBC),
                  size: 24,
                )),
            // activeIcon: Icon(Icons.home),
            label: 'Offers',
          ),


          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            activeIcon: Container(
              alignment: Alignment.center,
              height: 50,
                width: 50,

                decoration: const BoxDecoration(
                    color:Color(0xff1ABCBC),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25),topLeft: Radius.circular(25),)
                   ),
                child: const Stack(
                  alignment: Alignment.topRight,
                  children: [

                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 30,
                    ),

                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 7.5,
                      child: Text('5',style: TextStyle(fontSize: 9,color: Color(0xff1ABCBC)),),

                    ),
                  ],
                )),
            // activeIcon: Icon(Icons.home),
            label: 'Carts',
          ),
        ],
      ),
    );
  }
}
