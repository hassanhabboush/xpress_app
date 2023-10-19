import 'package:faqflutter/faqflutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          FaqFlutter(
            data: [
              [
                'Question one',
                'the method is very easy, you just choose the category advisor, and choose the professional you want to consult after seeing the professional details you can buy the available timeslot, and after the purchase is confirmed please wait for the consultation time, the professional will immediately call you'
              ],
              [
                'Question two',
                'the method is very easy, you just choose the category advisor, and choose the professional you want to consult after seeing the professional details you can buy the available timeslot, and after the purchase is confirmed please wait for the consultation time, the professional will immediately call you'
              ]
            ],
            title: 'FAQ',
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}