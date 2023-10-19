import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/core/constant/image_asset.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _tabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Orders',
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
          onPressed: () {
            Get.back;
          },
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
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                children: [
                  TabBar(
                    indicatorWeight: 0.1,
                    automaticIndicatorColorAdjustment: false,
                    indicatorColor: Colors.white,
                    controller: _tabController,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    onTap: (int value) {
                      setState(() {
                        _tabIndex = value;
                      });
                    },
                    tabs: [
                      Tab(
                        child: Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff1ABCBC),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xff000000).withOpacity(0.20),
                                offset: const Offset(0, 1),
                                blurRadius: 3,
                              )
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Open Orders',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: Color(0xff1ABCBC),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xff000000).withOpacity(0.20),
                                offset: const Offset(0, 1),
                                blurRadius: 3,
                              )
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Completed Orders',
                              style: TextStyle(
                                fontSize: 15,
                                // color: Colors.white,
                                color: Color(0xff1ABCBC),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  IndexedStack(
                    // هي عبارة عن اسلوب لاظهار العناصر داخل lisView ضمن موضع رقمي معين بدلا عن tabBarView في هذه الحالة
                    index: _tabIndex,
                    children: [
                      // Container(
                      //   child: Text('SIGN IN'),
                      // ),
                      Visibility(
                        visible: _tabIndex == 0,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 800,
                              child: ListView.builder(
                                itemCount: 12,
                                itemBuilder: (context, index) => const Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        Text(
                                          'Order ID : ',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          ' 12892222',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Text(
                                          '12/2/2019  ',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'Total : 100\$',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    leading: Padding(
                                      padding: EdgeInsets.only(top: 9.0),
                                      child: Image(
                                          image: AssetImage(
                                              AppImageAsset.delivery_truck)),
                                    ),
                                    trailing: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Row(
                                        children: [
                                          Text(
                                            'on Delivery',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xffFF0000),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Visibility(
                        visible: _tabIndex == 1,
                        child: Container(
                          child: const Text('SIGN UP'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
