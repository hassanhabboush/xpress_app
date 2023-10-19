import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(MaterialApp(
    home: MyWidget(),
  ));
}


class MyData {
   String title;
   String description;

  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  set isExpanded(bool value) {
    _isExpanded = value;
  }

  MyData({required this.title, required this.description});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      title: json['question'],
      description: json['answer'],
    );
  }

}


class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<MyData> _dataList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://sallah.hexacit.com/api/allQuestions'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        _dataList = List<MyData>.from(
          jsonData.map((data) => MyData.fromJson(data)).toList(),
        );

        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Panel List'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
        children: _dataList.map((data) {
          return ExpansionPanelList(
            elevation: 1,
            expandedHeaderPadding: EdgeInsets.all(0),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                data.isExpanded = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(data.title),
                  );
                },
                body: ListTile(
                  title: Text(data.description),
                ),
                isExpanded: data.isExpanded,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
