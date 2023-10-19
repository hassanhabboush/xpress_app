import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpress_app/controller/auth/sign_up_contrller.dart';
import 'package:xpress_app/controller/auth/user_controller.dart';
import 'package:xpress_app/core/constant/image_asset.dart';
import 'package:xpress_app/core/utils/helpers.dart';
import 'package:xpress_app/view/screens/auth/widgets/custom_text_formField.dart';
import 'package:xpress_app/view/widget/auth/customButton.dart';

class Contactus extends StatefulWidget {
  const Contactus({super.key});

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> with Helpers {
  RegisterationController controller = Get.put(RegisterationController());

  late TextEditingController _emailNameEditingController;

  late TextEditingController _mobileEditingController;

  late TextEditingController _nameEditingController;
  late TextEditingController _messageEditingController;
  late TextEditingController _typeEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _emailNameEditingController = TextEditingController();
    _mobileEditingController = TextEditingController();
    _nameEditingController = TextEditingController();
    _messageEditingController = TextEditingController();
    _typeEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailNameEditingController.dispose();
    _mobileEditingController.dispose();
    _nameEditingController.dispose();
    _messageEditingController.dispose();
    _typeEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     List<Map<String , dynamic>> data = [
       {'id': 1, 'text': 'خيار 1'},
       {'id': 2, 'text': 'خيار 2'},
       {'id': 3, 'text': 'خيار 3'},
    ];


    // String? selectedItemData; // العنصر المحدد في الـ DropdownButton
    int? selectedItemData; // العنصر المحدد في الـ DropdownButton

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact us',
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
              fit: BoxFit.fill,
            ),
            const Column(
              children: [
                Text(
                  'Contact Info :',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1ABCBC),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Icon(
                            Icons.email_outlined,
                            color: Color(0xff1ABCBC),
                            size: 15,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Saudi Arabia @gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Icon(
                            Icons.local_phone_outlined,
                            color: Color(0xff1ABCBC),
                            size: 15,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '5215654856922',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Icon(
                            Icons.phone_iphone,
                            color: Color(0xff1ABCBC),
                            size: 15,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '5215654856922',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 0,
                    ),
                    Row(
                      children: [
                        Image(image: AssetImage(AppImageAsset.facbook)),
                        SizedBox(
                          width: 14,
                        ),
                        Image(image: AssetImage(AppImageAsset.instagram)),
                        SizedBox(
                          width: 14,
                        ),
                        Image(image: AssetImage(AppImageAsset.twitter)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 120, bottom: 20),
                height: 560,
                width: 335,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.20),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 23,
                        ),
                        const Text(
                          'Contact Form',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff1ABCBC),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormField(
                          text: 'User Name',
                          color: const Color(0xff000000),
                          fontSize: 15,
                          // prefixIcon: Icons.key,
                          isNumber: false,
                          myController: _nameEditingController,
                          // textError: '',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          text: 'Email',
                          color: const Color(0xff000000),
                          fontSize: 15,
                          // prefixIcon: Icons.key,
                          isNumber: false,
                          myController: _emailNameEditingController,
                          // textError: '',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          text: 'Phone number',
                          color: const Color(0xff000000),
                          fontSize: 15,
                          // prefixIcon: Icons.key,
                          isNumber: false,
                          myController: _mobileEditingController,
                          // textError: '',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Container(
                            // margin: EdgeInsets.zero,
                            height: 45,

                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              border: Border.all(
                                color: const Color(0xff1ABCBC),
                                width: 1.0,
                              ),
                            ),
                            child: DropdownButton<int>(
                              isDense: true,
                              padding: const EdgeInsets.only(
                                  left: 54, right: 20, top: 11.2),
                              hint: const Text(
                                'Suggestion',
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
                              isExpanded: true,
                              dropdownColor: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                              value: selectedItemData,
                              onChanged: (int? newValue) {
                                setState(() {
                                {
                                    selectedItemData =
                                        newValue ; // تحديث العنصر المحدد عند تغييره

                                  }
                                });
                              },
                              items: data.map((item) {
                                return DropdownMenuItem<int>(
                                  value: item['id'],
                                  child: Text(item['text']),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          text: 'Message',
                          color: const Color(0xff000000),
                          fontSize: 15,
                          // prefixIcon: Icons.mark_unread_chat_alt_outlined,
                          isNumber: false,
                          myController: _messageEditingController,
                          // textError: '',
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                          onPressed: () {
                            performContactUs();
                          },
                          text: 'Sand',
                          fontSize: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> performContactUs() async {
    if (checkData()) {
      contactUs();
    }
  }

  bool checkData() {
    if (_emailNameEditingController.text.isNotEmpty &&
        _messageEditingController.text.isNotEmpty &&
        _nameEditingController.text.isNotEmpty &&
        _messageEditingController.text.isNotEmpty) {
      return true;
    }

    return false;
  }

  Future<void> contactUs() async {
    bool status = await UserApiController().contactUs(
        context: context,
        email: _emailNameEditingController.text,
        mobile: _mobileEditingController.text,
        name: _nameEditingController.text,
        message: _messageEditingController.text,
        type: 'id');

    if (status) {
      // Get.toNamed(AppRoutes.main_screen);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Profile(),));
    } else {
      // ignore: use_build_context_synchronously
      showSnakeBar(
          context: context, message: 'contactUs failed, try again', error: true);
    }
  }
}
