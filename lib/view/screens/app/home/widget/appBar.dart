import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 11,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.menu,
              color: Color(0xff1ABCBC),
            ),
            const Text(
              'Home',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff1ABCBC),
              ),
            ),
            SizedBox(
              height: 28,
              width: 70,
              child: TextFormField(
                cursorHeight: 15,
                cursorColor: const Color(0xffEDEFED),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  fillColor: const Color(0xffEDEFED),
                  filled: true,
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Color(0xff1ABCBC),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  errorStyle: const TextStyle(color: Colors.red),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Container(
//   // margin:
//   //     const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//   height: 28,
//   width: 70,
//   decoration: BoxDecoration(
//     color: const Color(0xffEDEFED),
//     borderRadius: BorderRadius.circular(14),
//   ),
//   child: const Align(
//     alignment: Alignment.centerRight,
//     child: Padding(
//       padding: EdgeInsets.only(right: 10.0,top: 2,bottom: 2),
//       child: Icon(
//         Icons.search,
//         color: Color(0xff1ABCBC),
//       ),
//     ),
//   ),
// ),
