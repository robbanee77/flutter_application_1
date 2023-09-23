import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/STDPage.dart';
import 'package:flutter_application_1/screen/successfull.dart';
import 'package:flutter_application_1/screen/test%20login.dart'; // แทนตามที่ได้ระบุเส้นทาง

class ConfirmPage extends StatelessWidget {
  Future<void> _showConfirmationDialog(
      BuildContext context, String userEmail) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('email', isEqualTo: userEmail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('ยืนยันข้อมูลสำเร็จ'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('ข้อมูลถูกต้อง'),
                  SizedBox(height: 10),
                  // Text('Email: ${userData['email']}'),
                  // เพิ่มข้อมูลอื่น ๆ ที่คุณต้องการแสดง
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // ปิดป็อปอัพ Confirmation Dialog
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            OfficerPage() // เรียกหน้า Officer ที่คุณต้องการไป
                        ));
                  },
                  child: Text('ปิด'),
                ),
              ],
            );
          },
        );
      } else {
        // ไม่พบข้อมูลผู้ใช้
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('ไม่พบข้อมูลผู้ใช้'),
              content: Text('ไม่พบข้อมูลผู้ใช้ที่ตรงกับอีเมลนี้'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // ปิดป็อปอัพ Dialog
                  },
                  child: Text('ปิด'),
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
            title: Text('ข้อผิดพลาด'),
            content: Text('เกิดข้อผิดพลาดในการดึงข้อมูล: $e'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // ปิดป็อปอัพ Dialog
                },
                child: Text('ปิด'),
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
      appBar: AppBar(
        title: Text('Confirm Page'),
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
                child: Text('ยืนยันข้อมูล'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
