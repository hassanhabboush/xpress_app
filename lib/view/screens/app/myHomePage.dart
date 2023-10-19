import 'package:flutter/material.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/view/widget/auth/customButton.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // GridView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: 10,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisSpacing: 5,
            //     mainAxisSpacing: 5,
            //     crossAxisCount: 2,
            //   ),
            //   itemBuilder: (context, index) {
            //     return Container(
            //       height: 220,
            //       width: 180,
            //       margin: const EdgeInsets.only(left: 10, right: 10),
            //       child: Card(
            //         elevation: 2,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(16),
            //           side: const BorderSide(
            //             color: Colors.grey,
            //           ),
            //         ),
            //         color: Colors.white,
            //         child: Column(
            //           children: [
            //             Container(
            //               height: 135,
            //               child: const Stack(
            //                 children: [
            //                   Padding(
            //                     padding: EdgeInsets.all(25.0),
            //                     child: Image(
            //                       image: AssetImage('assets/images/banana.png'),
            //                     ),
            //                   ),
            //                   Positioned(
            //                     top: 5,
            //                     right: 5,
            //                     child: Column(
            //                       children: [
            //                         Icon(
            //                           Icons.star_half_outlined,
            //                           color: Colors.black,
            //                         ),
            //                         Text('3.5'),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             Expanded(
            //               child: Container(
            //                 alignment: Alignment.centerLeft,
            //                 padding: const EdgeInsets.only(left: 5, right: 10),
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         Container(
            //                           width: 80,
            //                           margin: const EdgeInsets.only(left: 5),
            //                           child: const Text('dfdgfdg'),
            //                         ),
            //                         const Icon(Icons.favorite_outline),
            //                       ],
            //                     ),
            //
            //                     Expanded(
            //                       child: Padding(
            //                         padding: const EdgeInsets.only(
            //                           bottom: 5,
            //                           left: 10,
            //                         ),
            //                         child: Container(
            //                           width: 53,
            //                           height: 17,
            //                           alignment: Alignment.centerLeft,
            //                           decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(5),
            //                             color: const Color(0xfffff0f0),
            //                             border: Border.all(
            //                               color: const Color(0xffD2A6A6),
            //                             ),
            //                           ),
            //                           child: const Text('fgdfgfdsg'),
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // ),

            GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return Container(
                  // padding: EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.16),
                          offset: const Offset(0, 3),
                          blurRadius: 6),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                children: [
                                  Image(
                                    image: AssetImage(AppImageAsset.banana),
                                  ),
                                  Image(
                                    image:
                                    AssetImage(AppImageAsset.aspect_ratio),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 10,),
                              const Text('Banana'),
                              const Text(
                                "5.00 /K",
                                style: TextStyle(
                                    color: Colors.red,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.red,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decorationThickness: 1),
                              ),
                              const Text(
                                "5.00 K",
                                style: TextStyle(
                                  color: Color(0xff1ABCBC),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              CustomButton(
                                onPressed: () {},
                                text: 'Add To Cart',
                                fontSize: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//---------------------------------------------------------------------------------------------------

//
//
//
//
//
// import 'package:circular_bottom_navigation/tab_item.dart';
// import 'package:flutter/material.dart';
// import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
// import 'package:xpress/data/model/bn_screen.dart';
// import 'package:xpress/view/screens/app/carts/carts.dart';
// import 'package:xpress/view/screens/app/home/home.dart';
// import 'package:xpress/view/screens/app/offers/offers_controller.dart';
// import 'package:xpress/view/screens/app/profile/profile.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Circular Bottom Navigation Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Directionality(
//         // use this property to change direction in whole app
//         // CircularBottomNavigation will act accordingly
//         textDirection: TextDirection.ltr,
//         child: MyHomePage(title: 'circular_bottom_navigation'),
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({
//     Key? key,
//     this.title,
//   }) : super(key: key);
//   final String? title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int selectedPos = 0;
//
//   double bottomNavBarHeight = 60;
//
//   List<TabItem> tabItems = List.of([
//     TabItem(
//       Icons.home,
//       "Home",
//       Colors.blue,
//       labelStyle: TextStyle(
//         fontWeight: FontWeight.normal,
//       ),
//     ),
//     TabItem(
//       Icons.search,
//       "Search",
//       Colors.orange,
//       labelStyle: TextStyle(
//         color: Colors.red,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     TabItem(
//       Icons.layers,
//       "Reports",
//       Colors.red,
//       circleStrokeColor: Colors.black,
//     ),
//     TabItem(
//       Icons.notifications,
//       "Notifications",
//       Colors.cyan,
//     ),
//   ]);
//
//
//   late CircularBottomNavigationController _navigationController;
//
//   @override
//   void initState() {
//     super.initState();
//     _navigationController = CircularBottomNavigationController(selectedPos);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Padding(
//             child: bodyContainer(),
//             padding: EdgeInsets.only(bottom: bottomNavBarHeight),
//           ),
//           Align(alignment: Alignment.bottomCenter, child: bottomNav())
//         ],
//       ),
//     );
//   }
//
//   Widget bodyContainer() {
//     Color? selectedColor = tabItems[selectedPos].circleColor;
//     String slogan;
//     switch (selectedPos) {
//       case 0:
//         slogan = "Family, Happiness, Food";
//         break;
//       case 1:
//         slogan = "Find, Check, Use";
//         break;
//       case 2:
//         slogan = "Receive, Review, Rip";
//         break;
//       case 3:
//         slogan = "Noise, Panic, Ignore";
//         break;
//       default:
//         slogan = "";
//         break;
//     }
//
//     return GestureDetector(
//       child: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: selectedColor,
//         child: Center(
//           child: Text(
//             slogan,
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             ),
//           ),
//         ),
//       ),
//       onTap: () {
//         if (_navigationController.value == tabItems.length - 1) {
//           _navigationController.value = 0;
//         } else {
//           _navigationController.value = _navigationController.value! + 1;
//         }
//       },
//     );
//   }
//
//   Widget bottomNav() {
//     return CircularBottomNavigation(
//       tabItems,
//       controller: _navigationController,
//       selectedPos: selectedPos,
//       barHeight: bottomNavBarHeight,
//       // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
//       barBackgroundColor: Colors.white,
//       // barBackgroundGradient: LinearGradient(
//       //   begin: Alignment.bottomCenter,
//       //   end: Alignment.topCenter,
//       //   colors: [
//       //     Colors.blue,
//       //     Colors.red,
//       //   ],
//       // ),
//       backgroundBoxShadow: <BoxShadow>[
//         BoxShadow(color: Colors.black45, blurRadius: 10.0),
//       ],
//       animationDuration: Duration(milliseconds: 300),
//       selectedCallback: (int? selectedPos) {
//         setState(() {
//           this.selectedPos = selectedPos ?? 0;
//           print(_navigationController.value);
//         });
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _navigationController.dispose();
//   }
// // }
