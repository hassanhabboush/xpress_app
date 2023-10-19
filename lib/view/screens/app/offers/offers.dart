import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/offers_controller.dart';
import 'package:xpress_app/core/constant/image_asset.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    final OffersController offersController = Get.put(OffersController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Offers',
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
        leading: IconButton(
          onPressed: () {},
          color: Colors.white,
          icon: const Icon(
            Icons.menu,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const Image(
              image: AssetImage(AppImageAsset.bac),
              height: double.infinity,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Obx(() {
                if (offersController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (offersController.offers.isEmpty) {
                  return const Center(
                    child: Text('No offers available'),
                  );
                } else {
                  return GridView.builder(
                    itemCount: offersController.offers.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 12,
                      crossAxisCount: 2,
                      // mainAxisExtent: 270,
                          childAspectRatio: 160 / 233,
                    ),
                    itemBuilder: (context, index) {
                      if(offersController.isLoading.value){
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xff000000).withOpacity(0.16),
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
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }else{
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xff000000).withOpacity(0.16),
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
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15.0, right: 25.0, left: 25.0),
                                    child: Image(
                                      image: NetworkImage(
                                          offersController.offers[index].image),
                                      width:
                                      MediaQuery.of(context).size.width * 0.20,
                                      height: MediaQuery.of(context).size.height *
                                          0.15,
                                    ),
                                  ),
                                  Positioned(
                                    // left: 2,
                                    top: 10,
                                    right: 0,
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            const Image(
                                              image: AssetImage(
                                                  AppImageAsset.aspect_ratio),
                                            ),
                                            Positioned(
                                              top: 2,
                                              right: 10,
                                              child: Text(
                                                '${offersController.offers[index].discount}\n%',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(offersController.offers[index].name),
                              Text(
                                "${offersController.offers[index].priceOffer}\$ /K",
                                style: const TextStyle(
                                    color: Colors.red,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.red,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decorationThickness: 1),
                              ),
                              Text(
                                "${offersController.offers[index].price}\$ /K",
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
                                  offersController.addProductToCart(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff1ABCBC),
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
                      }
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
