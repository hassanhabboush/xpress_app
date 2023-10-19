import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xpress_app/core/constant/image_asset.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  List<dynamic> dataList = [];
  bool _isLoading = true;

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://sallah.hexacit.com/api/allQuestions'));

    if (response.statusCode == 200) {
      setState(() {
        dataList = json.decode(response.body)['questions'];
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAQ',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        elevation: 0,
        shadowColor: const Color(0xff000000).withOpacity(0.10),
        backgroundColor: const Color(0xff1ABCBC),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
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
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) => ExpansionPanelList(
                elevation: 1,
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: [
                  ExpansionPanel(
                    headerBuilder:
                        (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(dataList[index]['question']),

                      );
                    },
                    body: ListTile(
                      title: Text(dataList[index]['answer']),
                    ),
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
