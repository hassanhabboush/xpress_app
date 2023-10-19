import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpress_app/controller/auth/sign_up_contrller.dart';
import 'package:xpress_app/controller/cities/cities_controller.dart';
import 'package:xpress_app/controller/prefs/user_preferences_controller.dart';
import 'package:xpress_app/core/class/api_setting.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/core/utils/helpers.dart';
import 'package:xpress_app/view/screens/auth/widgets/custom_text_formField.dart';
import 'package:http/http.dart' as http;

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> with Helpers {
  // List<Map<String,dynamic>> cities = [
  //   {
  //     'id' : 1 ,
  //   }
  // ];
  //-------
  CitiesController citiesController = Get.put(CitiesController());
  List<dynamic> cities = [];
  String? selectedCity;
  late SharedPreferences prefs;
  String? city;
  List<dynamic> myCartData = [];
  int? selectedCityId;
  UserPreferencesController _preferencesController =  UserPreferencesController();

  late TextEditingController _nameEditingController;
  late TextEditingController _addressEditingController;
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  void initState() {
    super.initState();
    getCity();
    fetchData();
    fetchCarts();
    _nameEditingController = TextEditingController();
    _addressEditingController = TextEditingController();
    _preferencesController =  UserPreferencesController();
  }

  @override
  void dispose() {
    _addressEditingController.dispose();
    super.dispose();
  }

  Future<void> fetchCarts() async {
    final url = ApiSettings.MYCART;
    final headers = {
      'Authorization': _preferencesController.accessToken,
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

  Future<void> getCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    city = prefs.getString('cities');
    print('city  :$city');
  }

  // Future<void> getPhone() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   phone = prefs.getString('mobile');
  //   print('phone  :$phone');
  // }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(ApiSettings.CITIES));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        cities = data['cities'];
        print('cities: $cities');
      });
    }
    prefs = await SharedPreferences.getInstance();
  }



  Future<void> checkPromo() async {
    var url = Uri.parse(ApiSettings.CHECKPROMO);
    var response = await http.post(url, body: {
      'name': _nameEditingController.text,
      'date': dateToday,
    }, headers: {
      'Authorization':_preferencesController.accessToken,
      'fcm_token': 'Postman_fcm_token',
    });
    if (response.statusCode == 201) {}
  }

  Future<void> checkOut() async {
    var url = Uri.parse(ApiSettings.CHECKOUT);
    var response = await http.post(url, body: {
      'delivery_address': _addressEditingController.text,
      'delivery_city_id': selectedCityId.toString(),
      'mobile': _preferencesController.phone,
    }, headers: {
      'Authorization': _preferencesController.accessToken,
      'fcm_token': 'Postman_fcm_token',
    });
    if (response.statusCode == 200) {
      print('statusCode: ${response.statusCode}');
      var jasonResponse = jsonDecode(response.body);
      print('jasonResponse: $jasonResponse');
      String massage = jsonDecode(response.body)['message'];
      if (massage != null) {
        print('massage: $massage');
        showSnakeBar(context: context, message: massage);
      }
    } else if (response.statusCode == 202) {
      print('error 202');
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('dateToday: $dateToday');
    // int cityId = cities[3]['id'];
// print('cityId: $cityId');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
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
      body: Stack(
        children: [
          const Image(
            image: AssetImage(AppImageAsset.bac),
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                  child: Text(
                    'Product :',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20),
                    itemCount: myCartData.length,
                    itemBuilder: (context, index) {
                      final item = myCartData[index];
                      final product = item['product'];
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
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      'Quantity',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      product['order'].toString(),
                                      style: const TextStyle(
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
                                    borderRadius: BorderRadius.circular(15)),
                                child: Image(

                                  image: NetworkImage(product['image']),
                                  height: MediaQuery.of(context).size.height * 0.15,
                                  width: MediaQuery.of(context).size.width * 0.15,
                                ),
                              ),
                            ],
                          ),
                           SizedBox(
                            width: MediaQuery.of(context).size.width * 0.07,
                            // width: 11,
                          ),
                          Text(
                            product['name'],
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ),
                           SizedBox(
                            width: MediaQuery.of(context).size.width * 0.07,
                            // width: 11,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${product['price'].toString()}\$/k',

                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xff959894),
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Phone Number : ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Text(
                          _preferencesController.phone,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Address :',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<dynamic>(
                        hint: const Text(
                          'City',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Color(0xff1ABCBC),
                        ),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Color(0xff1ABCBC),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Color(0xff1ABCBC),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Color(0xff1ABCBC),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Color(0xff1ABCBC),
                            ),
                          ),
                        ),
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        value: selectedCity,
                        items: cities
                            .map<DropdownMenuItem<String>>((dynamic city) {
                          return DropdownMenuItem<String>(
                            value: city['name'],
                            child: Text(city['name']),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedCity = newValue!;
                            selectedCityId = cities.firstWhere(
                                (city) => city['name'] == selectedCity)['id'];
                            print('selectedCityId: $selectedCityId');
                            print('newValue: $newValue');
                            prefs.setString('cities', newValue);
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(

                        onChanged: (value) {
                          print('Address: $value');
                          setState(() {
                            _addressEditingController.text = value;
                          });
                        },

                        text: 'Address',
                        color: const Color(0xff000000),
                        opacityText: 1,
                        fontSize: 15,
                        enabled: true,
                        prefixIcon: Icons.pin_drop,
                        isNumber: true,
                        myController: _addressEditingController,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 213,
                        width: 335,
                        decoration: BoxDecoration(
                          color: const Color(0xffF0F5E0),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    const Color(0xff000000).withOpacity(0.16),
                                offset: const Offset(0, 3),
                                blurRadius: 6),
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total :',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '20 \$',
                                    style: TextStyle(
                                        color: Color(0xff1ABCBC), fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Discount :',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '20 \$',
                                    style: TextStyle(
                                        color: Color(0xff1ABCBC), fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              indent: 20,
                              endIndent: 20,
                              color: Color(0xff1ABCBC),
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total :',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '200 \$',
                                    style: TextStyle(
                                        color: Color(0xff1ABCBC), fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          content: const SizedBox(
                                            height: 180,
                                            width: 250,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Image(
                                                  image: AssetImage(
                                                      AppImageAsset
                                                          .shoppingBasket),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Operation completed Order \nsuccessfully',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          actions: <Widget>[
                                            Center(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xff1ABCBC),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                      ),
                                                    ),
                                                    minimumSize:
                                                        const Size(120, 35)),
                                                child: const Text(
                                                  'Got Home',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
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
                                        minimumSize: const Size(120, 40)),
                                    child: const Text(
                                      'Order Now',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      checkOut();
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          content: SizedBox(
                                            height: 180,
                                            width: 250,
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text(
                                                  'Discount Code',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color(0xffAECB1B),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Please enter a valid code to get\na discount .',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black
                                                          .withOpacity(0.50)),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                CustomTextFormField(
                                                  text: 'Discount code',
                                                  color:
                                                      const Color(0xff000000),
                                                  fontSize: 15,
                                                  // prefixIcon: Icons.discount,
                                                  isNumber: true,
                                                  // myController: controller
                                                  //     .passwordController,
                                                  // textError:
                                                  //     'Discount code is not correct',
                                                ),
                                              ],
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          actions: <Widget>[
                                            Center(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context);
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                      content: const SizedBox(
                                                        height: 180,
                                                        width: 250,
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            Image(
                                                              image: AssetImage(
                                                                  AppImageAsset
                                                                      .success_check),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                              'The valid discount code will be 20% \ndiscount on total order',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14),
                                                      ),
                                                      actions: <Widget>[
                                                        Center(
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    backgroundColor:
                                                                        const Color(
                                                                            0xff1ABCBC),
                                                                    shape:
                                                                        const RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(15),
                                                                        topRight:
                                                                            Radius.circular(15),
                                                                      ),
                                                                    ),
                                                                    minimumSize:
                                                                        const Size(
                                                                            120,
                                                                            35)),
                                                            child: const Text(
                                                              'Ok',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xff1ABCBC),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                      ),
                                                    ),
                                                    minimumSize:
                                                        const Size(120, 35)),
                                                child: const Text(
                                                  'Check',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
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
                                        minimumSize: const Size(120, 40)),
                                    child: const Text(
                                      'Discount code',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
