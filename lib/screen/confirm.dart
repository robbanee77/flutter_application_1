// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_application_1/screen/STDPage.dart';
// import 'package:flutter_application_1/screen/Search.dart';
// import 'package:flutter_application_1/screen/histostu.dart';
// import 'package:flutter_application_1/screen/notistu.dart';
// import 'package:flutter_application_1/screen/successfull.dart';
// import 'package:flutter_application_1/screen/login.dart'; // แทนตามที่ได้ระบุเส้นทาง

// class ConfirmPage extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> _showConfirmationDialog(
//       BuildContext context, String userEmail) async {
//     try {
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('Users1')
//           .where('email', isEqualTo: userEmail)
//           .get();

//       if (querySnapshot.docs.isNotEmpty) {
//         var userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
//         // เรียกใช้ Firestore เพื่อบันทึกข้อมูลผู้จอง
//         var bookingData = {
//           'code': userData['code'], // รหัสผู้ใช้
//           'name': userData['name'], // ชื่อผู้ใช้
//           'email': userData['email'],
//           // เพิ่มข้อมูลอื่น ๆ ที่คุณต้องการบันทึก
//         };
//         await FirebaseFirestore.instance
//             .collection('Booking') // ชื่อคอลเล็กชันสำหรับข้อมูลการจอง
//             .doc(userData['userId']) // ใช้ userId เป็นรหัสเอกสาร
//             .set(bookingData); // บันทึกข้อมูลในเอกสารนี้

//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Booking Successful'),
//               content: Text('Your booking has been confirmed and saved.'),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('OK'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF5ca4a9),
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       } else {
//         // ไม่พบข้อมูลผู้ใช้
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('No user information found.'),
//               content: Text(
//                   'No user information found matching this email address.'),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(); // ปิดป็อปอัพ Dialog
//                   },
//                   child: Text('close'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF5ca4a9),
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     } catch (e) {
//       // แสดงข้อความข้อผิดพลาดหากเกิดข้อผิดพลาดในการดึงข้อมูล
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('An error occurred fetching data: $e'),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // ปิดป็อปอัพ Dialog
//                 },
//                 child: Text('close'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF5ca4a9),
//                 ),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFe6ebe0),
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Image.asset(
//               'assets/images/pro.png',
//               width: 30,
//               height: 30,
//               fit: BoxFit.contain,
//             ),
//             SizedBox(width: 8),
//             Text('Course resevetion'),
//           ],
//         ),
//         backgroundColor: Color(0xFF5ca4a9),
//         actions: [
//           IconButton(
//             icon: Image.asset(
//               'assets/images/noti1.png',
//               width: 30,
//               height: 30,
//               fit: BoxFit.contain,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => notistu()),
//               );
//               // ดักเหตุการณ์เมื่อกดปุ่ม Info ที่อยู่ฝั่งซ้ายของ AppBar
//               // คุณสามารถใส่โค้ดที่คุณต้องการทำเมื่อกดปุ่มนี้ได้ที่นี่
//             },
//           ),
//           IconButton(
//             icon: Image.asset(
//               'assets/images/histo.png',
//               width: 30,
//               height: 30,
//               fit: BoxFit.contain,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => historystu()),
//               );
//               // ดักเหตุการณ์เมื่อกดปุ่ม Info ที่อยู่ฝั่งซ้ายของ AppBar
//               // คุณสามารถใส่โค้ดที่คุณต้องการทำเมื่อกดปุ่มนี้ได้ที่นี่
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 275),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // เรียกใช้งาน Firestore เพื่อดึงข้อมูลผู้ใช้
//                   FirebaseFirestore.instance
//                       .collection('Users')
//                       .get()
//                       .then((querySnapshot) {
//                     if (querySnapshot.docs.isNotEmpty) {
//                       // ดึงข้อมูลผู้ใช้แรกจาก QuerySnapshot
//                       var userData = querySnapshot.docs.first.data()
//                           as Map<String, dynamic>;
//                       // เรียกใช้ _showConfirmationDialog พร้อมส่งข้อมูลผู้ใช้
//                       _showConfirmationDialog(context, userData['email']);
//                     }
//                   });
//                 },
//                 child: Text(
//                   'Confirm booking',
//                   style: TextStyle(
//                     fontSize: 20, // ปรับขนาดตัวอักษรตามที่คุณต้องการ
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize:
//                       Size(180, 100), // ปรับขนาดของปุ่มตามที่คุณต้องการ
//                   backgroundColor: Color(0xFF5ca4a9),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/STDPage.dart';
import 'package:flutter_application_1/screen/Search.dart';
import 'package:flutter_application_1/screen/histostu.dart';
import 'package:flutter_application_1/screen/notistu.dart';
import 'package:flutter_application_1/screen/successfull.dart';
import 'package:flutter_application_1/screen/login.dart';

class ConfirmPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _showConfirmationDialog(
      BuildContext context, String userEmail) async {
    try {
      var user = _auth.currentUser;

      if (user != null) {
        // เรียกใช้งาน Firestore เพื่อดึงข้อมูลผู้ใช้
        FirebaseFirestore.instance
            .collection('Users1')
            .doc(user.uid)
            .get()
            .then((docSnapshot) {
          if (docSnapshot.exists) {
            var userData = docSnapshot.data() as Map<String, dynamic>;

            var bookingData = {
              'code': userData['code'], // รหัสผู้ใช้
              'name': userData['name'], // ชื่อผู้ใช้
              'email': userData['email'],
              // เพิ่มข้อมูลอื่น ๆ ที่คุณต้องการบันทึก
            };
            FirebaseFirestore.instance
                .collection('Booking') // ชื่อคอลเล็กชันสำหรับข้อมูลการจอง
                .doc(user.uid) // ใช้ userId เป็นรหัสเอกสาร
                .set(bookingData) // บันทึกข้อมูลในเอกสารนี้
                .then((_) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Booking Successful'),
                    content: Text('Your booking has been confirmed and saved.'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5ca4a9),
                        ),
                      ),
                    ],
                  );
                },
              );
            });
          } else {
            // ไม่พบข้อมูลผู้ใช้
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('No user information found.'),
                  content: Text(
                      'No user information found matching this email address.'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // ปิดป็อปอัพ Dialog
                      },
                      child: Text('close'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5ca4a9),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        });
      } else {
        // ผู้ใช้ยังไม่ได้ล็อคอิน
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('User not logged in.'),
              content: Text('Please log in before confirming booking.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5ca4a9),
                  ),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // แสดงข้อความข้อผิดพลาดหากเกิดข้อผิดพลาดในการดึงข้อมูล
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred fetching data: $e'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5ca4a9),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe6ebe0),
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/pro.png',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8),
            Text('Course reservation'),
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/noti1.png',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => notistu()),
              );
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/histo.png',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => historystu()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 275),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // เรียกใช้งาน Firestore เพื่อดึงข้อมูลผู้ใช้
                  FirebaseFirestore.instance
                      .collection('Users')
                      .get()
                      .then((querySnapshot) {
                    if (querySnapshot.docs.isNotEmpty) {
                      // ดึงข้อมูลผู้ใช้แรกจาก QuerySnapshot
                      var userData = querySnapshot.docs.first.data()
                          as Map<String, dynamic>;
                      // เรียกใช้ _showConfirmationDialog พร้อมส่งข้อมูลผู้ใช้
                      _showConfirmationDialog(context, userData['email']);
                    }
                  });
                },
                child: Text(
                  'Confirm booking',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(180, 100),
                  backgroundColor: Color(0xFF5ca4a9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
