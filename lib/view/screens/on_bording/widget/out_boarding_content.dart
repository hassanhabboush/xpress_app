// import 'package:flutter/material.dart';
// class OnBoardingViewPage extends StatefulWidget {
//   final String? image;
//   final String title;
//   final String body;
//   void Function()? onPressed;
//   Color? color;
//   final bool selected;
//
//   OnBoardingViewPage({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.body,
//     required this.onPressed,
//     required this.color,
//     required this.selected,
//   });
//
//   @override
//   State<OnBoardingViewPage> createState() => _OnBoardingViewPageState();
// }
//
// class _OnBoardingViewPageState extends State<OnBoardingViewPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Image(
//           height: double.infinity,
//           fit: BoxFit.cover,
//           image: AssetImage(widget.image!),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 widget.title,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff1ABCBC),
//                     fontSize: 50),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 widget.body,
//                 textAlign: TextAlign.start,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black,
//                   fontSize: 13,
//                 ),
//               ),
//               const SizedBox(
//                 height: 43,
//               ),
//               Row(
//                 children: [
//                   TextButton(
//                     onPressed: widget.onPressed,
//                     child: const Text(
//                       'Skip',
//                       style:
//                       TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 200,
//                   ),
//                   Container(
//                     height: 10,
//                     width: 10,
//                     margin: const EdgeInsetsDirectional.only(end: 10),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: widget.selected ? Colors.blue : Colors.yellow.shade500,
//                       // color: color,
//                     ),
//                   ),
//                   Container(
//                     height: 10,
//                     width: 10,
//                     margin: const EdgeInsetsDirectional.only(end: 10),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: widget.selected ? Colors.blue : Colors.grey.shade500,
//                       // color: color,
//                     ),
//                   ),
//                   Container(
//                     height: 10,
//                     width: 10,
//                     margin: const EdgeInsetsDirectional.only(end: 10),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: widget.selected ? Colors.blue : Colors.grey.shade500,
//                       // color: color,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
