import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xpress_app/controller/home/home_controller.dart';
import 'package:xpress_app/core/class/api_setting.dart';
import 'package:xpress_app/core/constant/routes.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  void _performSearch() async {
    final results = await searchAPI(_searchQuery);
    setState(() {
      _searchResults = results;
    });
  }

  String _searchQuery = '';
  List<dynamic> _searchResults = [];

  final TextEditingController _textEditingController = TextEditingController();
  late FocusNode _focusNode;

  HomeController _controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void handleClose() {
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 36,
                    width: 300,
                    child: TextField(
                      controller: _textEditingController,
                      focusNode: _focusNode,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                        _performSearch();
                      },
                      cursorColor: Colors.black,
                      cursorHeight: 15,
                      cursorWidth: 1.5,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        // hintText:
                        //   'App',
                        // hintStyle:  TextStyle(
                        //   fontSize: 15,
                        //   color: Color(0xff000000),
                        //
                        // ),

                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xff1ABCBC),
                        ),
                        fillColor: const Color(0xffEDEFED),
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    color: const Color(0xffFC3346),
                    onPressed: handleClose,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        String name = _searchResults[index]['name'];
                        print('name: $name');
                        int categoryId = _searchResults[index]['category_id'];
                        print('id: $categoryId');

                        _controller.fetchProducts(categoryId);
                        Get.toNamed(AppRoutes.main_screen);
                      },
                      title: Text(_searchResults[index]['name']),
                      // title: Text('title'),
                      subtitle: Text(_searchResults[index]['type_name']),
                      // subtitle: Text('subtitle'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<dynamic>> searchAPI(String text) async {
    final response = await http.post(
        Uri.parse(
          ApiSettings.SEARCH,
        ),
        body: {
          'text': text,
        });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        final data = jsonDecode(response.body);
        var json = data['products'];
        print('Json: $json');
        return json;
      } else {
        throw Exception('Failed to search API');
      }
    }
    return [];
  }
}
//
// Container(
// height: 36,
// width: 300,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(18),
// color: Color(0xffEDEFED),
// ),
// child: Row(
// children: [
// Padding(
// padding: const EdgeInsets.only(
// left: 20.0, top: 0, bottom: 0),
// child: Icon(
// Icons.search,
// color: Color(0xff1ABCBC),
// ),
// ),
// SizedBox(
// width: 20,
// ),
// Padding(
// padding: const EdgeInsets.only(bottom: 10.0),
// child: Text(
// 'App',
// style: TextStyle(
// fontSize: 15,
// color: Color(0xff000000),
// ),
// ),
// ),
// ],
// ),
// ),
