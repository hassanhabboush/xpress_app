import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xpress_app/view/screens/auth/screens/signIn.dart';
import 'package:xpress_app/view/screens/on_bording/widget/out_boarding_content1.dart';
import 'package:http/http.dart' as http;
import 'package:xpress_app/view/screens/on_bording/widget/page_view_indicator.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  int _currentPageIndex = 0;
  late PageController _pageController;
  bool isLoading = false;

  List<dynamic> dataList = [];

  Future<void> fetchData() async {
    setState(() {
      isLoading = true; // قم بتعيين isLoading إلى true قبل بدء الاستعلام
    });
    final response =
        await http.get(Uri.parse('https://sallah.hexacit.com/api/getAds'));

    if (response.statusCode == 200) {
      setState(() {
        dataList = json.decode(response.body)['ads'];
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Visibility(
            visible: isLoading,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int value) {
                    setState(() {
                      _currentPageIndex = value;
                    });
                  },
                  children: [
                    ...dataList
                        .map(
                          (data) => outBoardingContent(
                            title: dataList[_currentPageIndex]['title'] ??
                                'Fast Delivery',
                            body: dataList[_currentPageIndex]['details'] ??
                                'you can make your order easily',
                            image: dataList[_currentPageIndex]['image'] ??
                                'https://sallah.hexacit.com/uploads/images/ads/ha4t3UcyfIW8Hk820460211579696876_5362848.jpg',
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Visibility(
                visible: _currentPageIndex != 2,
                child: Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  margin: const EdgeInsetsDirectional.only(
                      top: 20, end: 20, bottom: 0),
                  child: TextButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    child: const Text(
                      'SKIP',
                      style: TextStyle(
                          color: Color(0xff1ABCBC),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PageViewIndicator(
                          marginEnd: 10,
                          selected: _currentPageIndex == 0,
                        ),
                        PageViewIndicator(
                          marginEnd: 10,
                          selected: _currentPageIndex == 1,
                        ),
                        PageViewIndicator(
                          selected: _currentPageIndex == 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Visibility(
            visible: _currentPageIndex == 2,
            maintainState: true,
            maintainSize: true,
            maintainAnimation: true,
            child: Container(
              alignment: AlignmentDirectional.bottomStart,
              margin: const EdgeInsetsDirectional.symmetric(
                  horizontal: 30, vertical: 30),
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignIn(),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1ABCBC),
                  minimumSize: const Size(130, 35),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                ),
                child: const Text('Get Started'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/**
 * Container : تعمل مسافة من جميع الجوانب
 * SizedBox : تعمل مسافة من جميع الجوانب
 * PageController : يعمل وسيط بين
 * f كول كونترولر يتم انشاءه يجب حذفه
 *  initState : tree داخل ال  widgit هي اول مرحلة تنفذ عندما ينعمل اضافةلل
 * dispose : initState تقوم بحذف و هي عكس ال , removeListener
 * PageController :الpage  يعمل حدث عند تغير
 * Visibility : تقوم باخفاء العنصر حسب الشرط او أخر
 * q يجب استخدام معها هؤلاء Visibility حتى نحافظ على المسافة تاعنتصر عند استخدام
 *  maintainAnimation: true, طبعا نستخدم هذه لترك المساحة و عدم التحكم بها
    maintainSize: true, عند ظهور العنصر المخفي Anm طبعا نستخدم هذه لتعمل
    maintainState: true, طبعا نستخدم هذه لترك الحالة على حالة الاخفاء و عدم التحكم بها
 * replacement : replacement تفوم بتبديل العنصر المخفي بالعنصر المحدد داخل ال
 * */
//  :
//

/*
*
*
*    // PageViewIndicator(
                    //   marginEnd: 10,
                    //   selected: _currenPageInde == 0,
                    // ),
                    // PageViewIndicator(
                    //   marginEnd: 10,
                    //   selected: _currenPageInde == 1,
                    // ),
                    // PageViewIndicator(
                    //   selected: _currenPageInde == 2,
                    // ),*/

/**
 *
 *
 *     Visibility(
    visible: _currenPageInde != 2,

    child: Container(

    child: TextButton(
    onPressed: () {
    _pageController.animateToPage(2,
    duration: Duration(milliseconds: 500),
    curve: Curves.easeIn);
    },
    child: Text('SKIP'),
    ),
    alignment: AlignmentDirectional.bottomEnd,
    margin: EdgeInsetsDirectional.only(top: 30, end: 20),
    ),
    ),
 */

/**
 *
 *
 *
 *    // Visibility(
    //   visible: _currenPageInde == 2,
    //   maintainState: true,
    //   maintainSize: true,
    //   maintainAnimation: true,
    //   child: Container(
    //     alignment: AlignmentDirectional.bottomEnd,
    //     margin:
    //     EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 0),
    //     child: ElevatedButton(
    //       onPressed: () =>
    //           Navigator.pushReplacementNamed(context, '/login_screen'),
    //       child: Text('START NOW'),
    //       style: ElevatedButton.styleFrom(
    //         minimumSize: Size(double.infinity, 50),
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(10),
    //         ),
    //       ),
    //     ),
    //   ),
    // ),*/

/*
*
*
*
*    //
          // Container(
          //   margin: EdgeInsets.only(bottom: 30),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       TextButton.icon(
          //           onPressed: () {
          //             _pageController.previousPage(
          //                 duration: Duration(seconds: 1), curve: Curves.easeIn);
          //           },
          //           icon: Icon(
          //             Icons.arrow_back_ios,
          //             color: _currenPageInde == 0 ? Colors.grey : Colors.blue,
          //           ),
          //           label: Text(
          //             '',
          //           )),
          //       TextButton.icon(
          //           onPressed: () {
          //             _pageController.nextPage(
          //                 duration: Duration(seconds: 1),
          //                 curve: Curves.easeInOut);
          //           },
          //           icon: Icon(
          //             Icons.arrow_forward_ios,
          //             color: _currenPageInde == 2 ? Colors.grey : Colors.blue,
          //           ),
          //           label: Text(
          //             '',
          //           )),
          //     ],
          //   ),
          // ),**/
