import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/LogoutPage.dart';
import 'package:flutter_application_1/screen/Newnotifstudent.dart';
import 'package:flutter_application_1/screen/STDPage.dart';
import 'package:flutter_application_1/screen/Search.dart';
import 'package:flutter_application_1/screen/histostu.dart';
import 'package:flutter_application_1/screen/notistu.dart';
import 'package:flutter_application_1/screen/successfull.dart';
import 'package:flutter_application_1/screen/login.dart';

// class ConfirmPage extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> _showConfirmationDialog(
//       BuildContext context, String userEmail) async {
//     try {
//       var user = _auth.currentUser;

//       if (user != null) {
//         // เรียกใช้งาน Firestore เพื่อดึงข้อมูลผู้ใช้
//         FirebaseFirestore.instance
//             .collection('Users1')
//             .doc(user.uid)
//             .get()
//             .then((docSnapshot) {
//           if (docSnapshot.exists) {
//             var userData = docSnapshot.data() as Map<String, dynamic>;

//             var bookingData = {
//               'code': userData['code'], // รหัสผู้ใช้
//               'name': userData['name'], // ชื่อผู้ใช้
//               'email': userData['email'], //อีเมลผู้ใช้
//               // เพิ่มข้อมูลอื่น ๆ ที่คุณต้องการบันทึก
//             };

//             FirebaseFirestore.instance
//                 .collection('booking') // ชื่อคอลเล็กชันสำหรับข้อมูลการจอง
//                 .doc(user.uid) // ใช้ userId เป็นรหัสเอกสาร
//                 .set(bookingData) // บันทึกข้อมูลในเอกสารนี้
//                 .then((_) {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: Text('Booking Successful'),
//                     content: Text('Your booking has been confirmed and saved.'),
//                     actions: [
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text('OK'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF5ca4a9),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             });
//           } else {
//             // ไม่พบข้อมูลผู้ใช้
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text('No user information found.'),
//                   content: Text(
//                       'No user information found matching this email address.'),
//                   actions: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pop(); // ปิดป็อปอัพ Dialog
//                       },
//                       child: Text('close'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF5ca4a9),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             );
//           }
//         });
//       } else {
//         // ผู้ใช้ยังไม่ได้ล็อคอิน
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('User not logged in.'),
//               content: Text('Please log in before confirming booking.'),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text('Close'),
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
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Close'),
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
//             Text('Course reservation'),
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
//                     fontSize: 20,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(180, 100),
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

class ConfirmPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _showConfirmationDialog(
      BuildContext context, String userEmail) async {
    try {
      var user = _auth.currentUser;

      if (user != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor:
                  Color(0xFFe6ebe0), // กำหนดสีพื้นหลังของ AlertDialog
              title: Text('Booking Successful'),
              content: Text('Your booking has been confirmed and saved.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => STPage(),
                      ),
                    );
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
      } else {
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
                )
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred: $e'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5ca4a9),
                ),
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFFe6ebe0), // Updated background color to light green
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
            Text('Course '),
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
                MaterialPageRoute(builder: (context) => Newnotifstudent()),
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
          IconButton(
            icon: Image.asset(
              'assets/images/logout.png',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogoutPage()),
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
                  _showConfirmationDialog(
                      context, _auth.currentUser?.email ?? '');
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
