import 'package:flutter/material.dart';
import 'package:xpress_app/core/constant/image_asset.dart';

class MyOrdersDetails extends StatefulWidget {
  const MyOrdersDetails({super.key});

  @override
  State<MyOrdersDetails> createState() => _MyOrdersDetailsState();
}

class _MyOrdersDetailsState extends State<MyOrdersDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orders Details',
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
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const Image(
              image: AssetImage(AppImageAsset.bac),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: Color(0xffF0F5E0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: ListTile(
                          title: Row(
                            children: [
                              Text(
                                'Order ID : ',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  color: Color(0xff1ABCBC),
                                ),
                              ),
                              Text(
                                '12892222',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                  color: Color(0xff1ABCBC),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                '12/2/2019  ',
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                'Total : 100\$',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          trailing: Text(
                            'on Delivery',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffFF0000),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            'Phone Number : ',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          Text(
                            '+972 595935907',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        children: [
                          Text(
                            'City : ',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          Text(
                            '+Gaza',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Text(
                        'Address : ',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Text(
                        '+Al Thalathini Street - Al Noor Building - 2nd Floor',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Product :',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 20),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 75,
                                    width: 100,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff1ABCBC),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomRight: Radius.circular(14),
                                      ),
                                    ),
                                    child: const Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Quantity',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '50',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Roboto',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 78),
                                    width: 100,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Image(
                                      image: AssetImage(AppImageAsset.apple),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 11,
                              ),
                              const Text(
                                'Apple',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              const SizedBox(
                                width: 62,
                              ),
                              const Text(
                                '5.00\$/k',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff959894),
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
