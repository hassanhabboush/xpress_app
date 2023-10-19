import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpress_app/controller/cities/cities_controller.dart';
import 'package:xpress_app/core/class/api_setting.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/core/constant/routes.dart';
import 'package:xpress_app/data/model/cities.dart';
import 'package:xpress_app/view/widget/auth/customButton.dart';
import 'package:http/http.dart' as http;

class CitysScreen extends StatefulWidget {
  const CitysScreen({super.key});

  @override
  State<CitysScreen> createState() => _CitysScreenState();
}

class _CitysScreenState extends State<CitysScreen> {
  CitiesController citiesController = Get.put(CitiesController());
  List<dynamic> cities = [];
  List<dynamic> myCartData = [];
  String? selectedCity;
  late SharedPreferences prefs;
  String? city;

  @override
  void initState() {
    super.initState();
    getCity();
    fetchData();
  }



  Future<void> getCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    city = prefs.getString('cities');
    print('city  :$city');
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse(ApiSettings.CITIES));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        cities = data['cities'];
      });
    }
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    // citiesController.getCities();
    getCity();
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            height: double.infinity,
            fit: BoxFit.cover,
            width: double.infinity,
            image: AssetImage(AppImageAsset.backgroundCity),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage(AppImageAsset.logo),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Choose the city',
                style: TextStyle(
                  fontStyle: FontStyle.values.first,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff000000),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'It is a long established fact that a reader will\nbe distracted layout.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: DropdownButtonFormField<dynamic>(
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
                  items: cities.map<DropdownMenuItem<String>>((dynamic city) {
                    return DropdownMenuItem<String>(
                      value: city['name'],
                      child: Text(city['name']),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedCity = newValue!;
                      print('newValue: $newValue');
                      prefs.setString('cities', newValue);
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              CustomButton(onPressed: () {
                Get.offNamed(AppRoutes.onBoarding);
              }, text: 'OK', fontSize: 15),
            ],
          ),
        ],
      ),
    );
  }
}

/*
*  DropdownButton<String>(
          value: selectedCity,
          onChanged: (String? newValue) {
            setState(() {
              selectedCity = newValue!;
            });
          },
          items: cities.map<DropdownMenuItem<String>>((dynamic city) {
            return DropdownMenuItem<String>(
              value: city['name'],
              child: Text(city['name']),
            );
          }).toList(),
        ),
* */
