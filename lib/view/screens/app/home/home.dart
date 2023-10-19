import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/home/home_controller.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/core/constant/routes.dart';
import 'package:xpress_app/view/screens/app/drawer/menu/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _categoryController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      drawer: MyDrawer(),
      // appBar: AppBar(
      //   iconTheme: const IconThemeData(color: Color(0xff1ABCBC)),
      //   title: const Text(
      //     'Home',
      //     style: TextStyle(
      //       fontSize: 20,
      //       color: Color(0xff1ABCBC),
      //     ),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   centerTitle: true,
      //   actions: [
      //     Container(
      //
      //       constraints: BoxConstraints(
      //       minHeight: 20,
      //       maxHeight: 20,
      //         maxWidth: 70,
      //         minWidth: 70,
      //     ),
      //       color: Colors.grey,
      //       child: IconButton(
      //
      //         onPressed: () {
      //           Get.toNamed(AppRoutes.search);
      //         },
      //         icon: const Align(
      //           alignment: Alignment.centerRight,
      //           child: Icon(
      //             Icons.search,
      //             size: 20,
      //           ),
      //         ),
      //         color: const Color(0xff1ABCBC),
      //       ),
      //     ),
      //   ],
      // ),

      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              AppImageAsset.home,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),


            Obx(() {
              if (_categoryController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (_categoryController.categories.isEmpty) {
                return const Center(
                  child: Text('No offers available'),
                );
              } else {
                return Column(
                  children: [

                    AppBar(
                      iconTheme: const IconThemeData(color: Color(0xff1ABCBC)),
                      title: const Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff1ABCBC),
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      centerTitle: true,
                      actions: [
                        Container(

                          margin: EdgeInsets.only(right: 17),
                            height: 28,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              // color: Color(0xffEDEFED),
                            ),
                          child: IconButton(

                            onPressed: () {
                              Get.toNamed(AppRoutes.search);
                            },
                            icon: const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.search,
                                size: 20,
                              ),
                            ),
                            color: const Color(0xff1ABCBC),
                          ),
                        ),
                      ],

                    ),
                    // Container(
                    //   // margin: EdgeInsets.only(right: 17),
                    //   height: 56,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(18),
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       IconButton(onPressed: () {
                    //         MyDrawer();
                    //       }, icon: Icon(Icons.menu)),
                    //       const Text(
                    //         'Home',
                    //         style: TextStyle(
                    //           fontSize: 20,
                    //           color: Color(0xff1ABCBC),
                    //         ),
                    //       ),
                    //       Container(
                    //         decoration: BoxDecoration(
                    //           color: const Color(0xffEDEFED),
                    //           borderRadius: BorderRadius.circular(14),
                    //         ),
                    //         height: 30,
                    //         width: 70,
                    //         child: IconButton(
                    //           onPressed: () {
                    //             Get.toNamed(AppRoutes.search);
                    //           },
                    //           icon: const Align(
                    //             alignment: Alignment.centerRight,
                    //             child: Icon(
                    //               Icons.search,
                    //               size: 18,
                    //             ),
                    //           ),
                    //           color: const Color(0xff1ABCBC),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _categoryController.categories
                            .map(
                              (category) => Container(
                                margin: const EdgeInsets.all(10),
                                child: FilterChip(
                                  padding: const EdgeInsets.all(10),
                                  labelStyle: const TextStyle(),
                                  // backgroundColor: ,
                                  label: Text(category.name),
                                  // selected:_categoryController.predictions.isNotEmpty &&
                                  //     _categoryController.predictions.any((prediction) => prediction.id == category.id),
                                  onSelected: (value) {
                                    setState(() {
                                      _categoryController
                                          .fetchPredictions(category.id);
                                    });
                                  },
                                  avatar: Image.network(category.image),
                                  // backgroundColor:  _categoryController.predictions.isNotEmpty &&
                                  //     _categoryController.predictions.any((prediction) => prediction.id == category.id)
                                  //     ? Color(0xff1ABCBC)
                                  //     : Colors.white,
                                  backgroundColor: Colors.white,
                                  elevation: 5,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Obx(() {
                      if (_categoryController.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (_categoryController.categories.isEmpty) {
                        return const Center(
                          child: Text('No offers available'),
                        );
                      } else {
                        return Expanded(
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: _categoryController.predictions.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 12,
                                    crossAxisCount: 2 != 0 ? 2 : 1,
                                    childAspectRatio: 160 / 204),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff000000)
                                          .withOpacity(0.16),
                                      offset: const Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  color: Colors.white,
                                ),
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Image(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.16,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      image: NetworkImage(
                                        _categoryController
                                                    .predictions[index].image ==
                                                null
                                            ? 'https://sallah.hexacit.com/uploads/images/category/X5NEQW9QN0bMnY571652921574170885_1634706.png'
                                            : _categoryController
                                                .predictions[index].image!,
                                      ),
                                    ),
                                    Text(
                                      _categoryController
                                              .predictions[index].name ??
                                          'apple',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      "${_categoryController.predictions[index].price}\$ /K",
                                      style: const TextStyle(
                                        color: Color(0xff1ABCBC),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _categoryController
                                            .addProductToCart(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xff1ABCBC),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                          ),
                                          minimumSize: const Size(89, 25)),
                                      child: const Text(
                                        'Add To Cart',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
