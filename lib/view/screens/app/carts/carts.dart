import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/myCart/myCart.dart';
import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';
import 'package:xpress_app/core/class/api_setting.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:http/http.dart' as http;
import 'package:xpress_app/core/constant/routes.dart';
import 'package:xpress_app/view/screens/app/drawer/menu/drawer.dart';

class Carts extends StatefulWidget {
  const Carts({super.key});

  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  final MyCartController _myCartController = Get.put(MyCartController());
  List<dynamic> myCartData = [];
 UserPreferencesController _userPreferencesController = UserPreferencesController();
  int counte = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
    _userPreferencesController = UserPreferencesController();
    // getCarts();
    // _myCartController.fetchData();
  }

  Future<void> fetchData() async {
    final url = ApiSettings.MYCART;
    final headers = {
      'Authorization': _userPreferencesController.accessToken,
      // استبدله بقيمة المفتاح الخاص بك
      'fcmToken': 'Postman_fcm_token',
    };

    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
      setState(() {
        myCartData = jsonData['MyCart'];
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        // iconTheme: IconThemeData(c),
        title: const Text(
          'My cart',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        elevation: 0,
        shadowColor: const Color(0xff000000).withOpacity(0.10),
        backgroundColor: const Color(0xff1ABCBC),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(
              25,
            ),
          ),
        ),
        centerTitle: true,

        actions: const [
          Row(
            children: [
              Text(
                'Total :',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
              Text(
                '380\$',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          const Image(
            image: AssetImage(AppImageAsset.bac),
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          // Obx(() {
          //   if(myCartData.isLoading.value){
          //     return const Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   }else if(_myCartController.myCarts.isEmpty){
          //     return const Center(
          //       child: Text('No offers available'),
          //     );
          //   }else{
          //     return Container(
          //       margin: const EdgeInsets.only(top: 10),
          //       child: ListView.separated(
          //         itemCount: myCartData.length != null ? myCartData.length :1,
          //         // itemCount: _myCartController.myCarts.length,
          //         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          //
          //
          //         itemBuilder: (context, index) {
          //           final item = myCartData[index];
          //           final product = item['product'];
          //           return  Container(
          //             padding: const EdgeInsets.only(bottom: 4 ,right: 20,left: 20),
          //             width: double.infinity,
          //             height: 160,
          //             decoration: BoxDecoration(
          //               borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24),topRight: Radius.circular(24),),
          //
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: const Color(0xff000000).withOpacity(0.16),
          //                   blurRadius: 6,
          //                   offset: const Offset(0, 3),
          //                 )
          //               ],
          //
          //               color: Colors.white,
          //             ),
          //             child: Column(
          //               children: [
          //                 Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          //                   IconButton(icon:const Icon( Icons.close,color: Colors.red),onPressed: (){},),
          //                 ]),
          //                 Row(children: [
          //                   Image(image:
          //                   // NetworkImage(_myCartController.myCarts[index].image ?? 'https://sallah.hexacit.com/uploads/images/products/yXwrNEBiwT9qzwj93926661574932046_4409767.png')
          //                   NetworkImage(product['image'] ?? 'https://sallah.hexacit.com/uploads/images/products/yXwrNEBiwT9qzwj93926661574932046_4409767.png')
          //                     ,height: MediaQuery.of(context).size.height * 0.10,
          //                     width: MediaQuery.of(context).size.width * 0.25,),
          //                   SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
          //                   Column(
          //                     children: [
          //                       Text(_myCartController.myCarts[index].name ?? '555'),
          //                       Text(
          //                         // "${_myCartController.myCarts[index].price ?? '55'}\$ /K",
          //                         "${product['price'] ?? '55'}\$ /K",
          //                         // 's',
          //                         style: const TextStyle(
          //                           color: Color(0xff1ABCBC),
          //                           fontSize: 18,
          //                           fontWeight: FontWeight.w500,
          //                         ),),
          //                     ],
          //                   ),
          //                 ]),
          //                 Row(
          //                     mainAxisAlignment: MainAxisAlignment.end,
          //                     children: [
          //                       const Image(image: AssetImage('assets/images/plus.png')),
          //                       SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
          //                       // Text(_myCartController.myCarts[index].order.toString() ?? '55'),
          //                       Text(product['order'].toString() ?? '55'),
          //                       const SizedBox(
          //                         width: 0,
          //                       ),
          //                       SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
          //                       const Image(image: AssetImage('assets/images/minus.png'))
          //                     ]),
          //               ],
          //             ),
          //           );
          //         }, separatorBuilder: (context, index) {
          //         return   const Divider(color: Colors.white,);
          //       },
          //       ),
          //     );
          //   }
          // }),

          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView.separated(
              itemCount: myCartData.length != null ? myCartData.length : 1,
              // itemCount: _myCartController.myCarts.length,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

              itemBuilder: (context, index) {
                final item = myCartData[index];
                final product = item['product'];
                return Container(
                  padding:
                      const EdgeInsets.only(bottom: 4, right: 20, left: 20),
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.16),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () {},
                        ),
                      ]),
                      Row(children: [
                        Image(
                          image:
                              // NetworkImage(_myCartController.myCarts[index].image ?? 'https://sallah.hexacit.com/uploads/images/products/yXwrNEBiwT9qzwj93926661574932046_4409767.png')
                              NetworkImage(product['image'] ??
                                  'https://sallah.hexacit.com/uploads/images/products/yXwrNEBiwT9qzwj93926661574932046_4409767.png'),
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Column(
                          children: [
                            Text(
                                // _myCartController.myCarts[index].name ?? '555'),
                                product['name']?? '555'),
                            Text(
                              // "${_myCartController.myCarts[index].price ?? '55'}\$ /K",
                              "${product['price'] ?? '55'}\$ /K",
                              // 's',
                              style: const TextStyle(
                                color: Color(0xff1ABCBC),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ]),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        const Image(
                            image: AssetImage('assets/images/plus.png')),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        // Text(_myCartController.myCarts[index].order.toString() ?? '55'),
                        Text(product['order'].toString() ?? '55'),
                        const SizedBox(
                          width: 0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        InkWell(
                          onTap: (){

                          },
                          child: const Image(
                              image: AssetImage('assets/images/minus.png')),
                        )
                      ]),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.white,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.checkout);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1ABCBC),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    minimumSize: const Size(170, 38)),
                child: const Text(
                  'Checkout (5)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Container(
// height: 102,
// width: 50,
// decoration: BoxDecoration(
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// color: Color(0xff000000).withOpacity(0.16),
// offset: Offset(0, 3),
// blurRadius: 6,
// ),
// ],
// borderRadius: BorderRadius.only(
// bottomRight: Radius.circular(24),
// bottomLeft: Radius.circular(24),
// topRight: Radius.circular(24),
// ),
// ),
//
// );

/*
* Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  elevation: 2,
                  shadowColor: const Color(0xff000000),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.close),
                            color: Colors.red,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                             Image(
                              image:  NetworkImage(product['image']),
                               height: 100,
                               width: 40,
                            ),
                            const SizedBox(width: 20),
                             Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(product['name']),
                                Text(
                                  "${product['price']}\$ /K",
                                  style: TextStyle(
                                    color: Color(0xff1ABCBC),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 45,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      child:  Image(
                                        image: AssetImage(AppImageAsset.minus),

                                      ),
                                      onTap: () {},
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(product['order'].toString()),
                                    const SizedBox(
                                      width: 0,
                                    ),
                                    InkWell(
                                      child: const Image(
                                        image: AssetImage(AppImageAsset.plus),
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );*/
