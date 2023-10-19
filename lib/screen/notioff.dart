// import 'package:flutter/material.dart';

// class notioff extends StatefulWidget {
//   const notioff({Key? key});

//   @override
//   State<notioff> createState() => _notioffState();
// }

// class _notioffState extends State<notioff> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFe6ebe0),
//       appBar: AppBar(
//         title: Row(
//           children: [
//             SizedBox(width: 8),
//             Image.asset(
//               'assets/images/pro.png',
//               width: 30,
//               height: 30,
//               fit: BoxFit.contain,
//             ),
//             SizedBox(width: 8),
//             Text('Notifications '),
//           ],
//         ),
//         backgroundColor: Color(0xFF5ca4a9),
//       ),
//       body: SingleChildScrollView(
//         // ใช้ SingleChildScrollView แทน Column เพื่อให้สามารถเลื่อนเนื้อหาได้
//         child: Column(
//           children: [
//             Container(
//               padding:
//                   EdgeInsets.only(top: 45, left: 20, right: 20, bottom: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Notifications',
//                     style: TextStyle(
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF5ca4a9),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(width: 10), // กำหนดระยะห่างระหว่างข้อความกับรูปภาพ
//                   Image.asset(
//                     'assets/images/noti4.png', // ตำแหน่งของไฟล์รูปภาพที่คุณต้องการใช้
//                     width: 40, // ปรับขนาดรูปภาพตามที่คุณต้องการ
//                     height: 40,
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
//               color: Colors.white, // สีของเส้น (ปรับตามที่คุณต้องการ)
//               margin: EdgeInsets.symmetric(horizontal: 20),
//             ),
//             Container(
//               padding:
//                   EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
//               child: RichText(
//                 text: TextSpan(
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF5ca4a9),
//                   ),
//                   children: <TextSpan>[
//                     TextSpan(
//                       text: '621431010',
//                       style: TextStyle(
//                         fontSize:
//                             20, // Adjust the font size for "There is" here
//                         color: Color(0xFFed6a5a),
//                       ),
//                     ),
//                     TextSpan(
//                       text:
//                           ' There is a request for reservation of the information security course.',
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             Container(
//               height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
//               color: Colors.white, // สีของเส้น (ปรับตามที่คุณต้องการ)
//               margin: EdgeInsets.symmetric(horizontal: 20),
//             ),
//             Container(
//               padding:
//                   EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
//               child: RichText(
//                 text: TextSpan(
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF5ca4a9),
//                   ),
//                   children: <TextSpan>[
//                     TextSpan(
//                       text: '611431023',
//                       style: TextStyle(
//                         fontSize:
//                             20, // Adjust the font size for "There is" here
//                         color: Color(0xFFed6a5a),
//                       ),
//                     ),
//                     TextSpan(
//                       text:
//                           ' There is a request for reservation of the Web Technology course.',
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             Container(
//               height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
//               color: Colors.white, // สีของเส้น (ปรับตามที่คุณต้องการ)
//               margin: EdgeInsets.symmetric(horizontal: 20),
//             ),
//             Container(
//               padding:
//                   EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
//               child: RichText(
//                 text: TextSpan(
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF5ca4a9),
//                   ),
//                   children: <TextSpan>[
//                     TextSpan(
//                       text: '631431550',
//                       style: TextStyle(
//                         fontSize:
//                             20, // Adjust the font size for "There is" here
//                         color: Color(0xFFed6a5a),
//                       ),
//                     ),
//                     TextSpan(
//                       text:
//                           ' There is a request for reservation of the Information Technology Services Management course.',
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             Container(
//               height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
//               color: Colors.white, // สีของเส้น (ปรับตามที่คุณต้องการ)
//               margin: EdgeInsets.symmetric(horizontal: 20),
//             ),
//             Container(
//               padding:
//                   EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
//               child: RichText(
//                 text: TextSpan(
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF5ca4a9),
//                   ),
//                   children: <TextSpan>[
//                     TextSpan(
//                       text: '601432345',
//                       style: TextStyle(
//                         fontSize:
//                             20, // Adjust the font size for "There is" here
//                         color: Color(0xFFed6a5a),
//                       ),
//                     ),
//                     TextSpan(
//                       text:
//                           ' There is a request for reservation of the Computer Programming course.',
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             Container(
//               height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
//               color: Colors.white, // สีของเส้น (ปรับตามที่คุณต้องการ)
//               margin: EdgeInsets.symmetric(horizontal: 20),
//             ),
//             // Container(
//             //   padding:
//             //       EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
//             //   child: RichText(
//             //     text: TextSpan(
//             //       style: TextStyle(
//             //         fontSize: 15,
//             //         fontWeight: FontWeight.bold,
//             //         color: Color(0xFF5ca4a9),
//             //       ),
//             //       children: <TextSpan>[
//             //         TextSpan(
//             //           text: '611437710',
//             //           style: TextStyle(
//             //             fontSize:
//             //                 20, // Adjust the font size for "There is" here
//             //             color: Color(0xFFed6a5a),
//             //           ),
//             //         ),
//             //         TextSpan(
//             //           text:
//             //               ' There is a request for reservation of the Network I course.',
//             //         ),
//             //       ],
//             //     ),
//             //     textAlign: TextAlign.left,
//             //   ),
//             // ),
//             // Container(
//             //   height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
//             //   color: Color(0xFFed6a5a), // สีของเส้น (ปรับตามที่คุณต้องการ)
//             //   margin: EdgeInsets.symmetric(horizontal: 20),
//             // ),
//             // Container(
//             //   padding:
//             //       EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
//             //   child: RichText(
//             //     text: TextSpan(
//             //       style: TextStyle(
//             //         fontSize: 15,
//             //         fontWeight: FontWeight.bold,
//             //         color: Color(0xFF5ca4a9),
//             //       ),
//             //       children: <TextSpan>[
//             //         TextSpan(
//             //           text: '631431453',
//             //           style: TextStyle(
//             //             fontSize:
//             //                 20, // Adjust the font size for "There is" here
//             //             color: Color(0xFFed6a5a),
//             //           ),
//             //         ),
//             //         TextSpan(
//             //           text:
//             //               ' There is a request for reservation of the Computer Platform Technology course.',
//             //         ),
//             //       ],
//             //     ),
//             //     textAlign: TextAlign.left,
//             //   ),
//             // ),
//             // Container(
//             //   height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
//             //   color: Color(0xFFed6a5a), // สีของเส้น (ปรับตามที่คุณต้องการ)
//             //   margin: EdgeInsets.symmetric(horizontal: 20),
//             // ),
//             // Container(
//             //   padding:
//             //       EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
//             //   child: RichText(
//             //     text: TextSpan(
//             //       style: TextStyle(
//             //         fontSize: 15,
//             //         fontWeight: FontWeight.bold,
//             //         color: Color(0xFF5ca4a9),
//             //       ),
//             //       children: <TextSpan>[
//             //         TextSpan(
//             //           text: '631434533',
//             //           style: TextStyle(
//             //             fontSize:
//             //                 20, // Adjust the font size for "There is" here
//             //             color: Color(0xFFed6a5a),
//             //           ),
//             //         ),
//             //         TextSpan(
//             //           text:
//             //               ' There is a request for reservation of the Software Development Process II course.',
//             //         ),
//             //       ],
//             //     ),
//             //     textAlign: TextAlign.left,
//             //   ),
//             // ),
//             // Container(
//             //   height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
//             //   color: Color(0xFFed6a5a), // สีของเส้น (ปรับตามที่คุณต้องการ)
//             //   margin: EdgeInsets.symmetric(horizontal: 20),
//             // ),
//             // Container(
//             //   padding:
//             //       EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
//             //   child: RichText(
//             //     text: TextSpan(
//             //       style: TextStyle(
//             //         fontSize: 15,
//             //         fontWeight: FontWeight.bold,
//             //         color: Color(0xFF5ca4a9),
//             //       ),
//             //       children: <TextSpan>[
//             //         TextSpan(
//             //           text: '621433421',
//             //           style: TextStyle(
//             //             fontSize:
//             //                 20, // Adjust the font size for "There is" here
//             //             color: Color(0xFFed6a5a),
//             //           ),
//             //         ),
//             //         TextSpan(
//             //           text:
//             //               ' There is a request for reservation of the Social Issues and Ethics for IT Professional course.',
//             //         ),
//             //       ],
//             //     ),
//             //     textAlign: TextAlign.left,
//             //   ),
//             // ),
//             // Container(
//             //   height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
//             //   color: Color(0xFFed6a5a), // สีของเส้น (ปรับตามที่คุณต้องการ)
//             //   margin: EdgeInsets.symmetric(horizontal: 20),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
