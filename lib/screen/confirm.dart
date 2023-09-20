import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/successfull.dart'; // แทนตามที่ได้ระบุเส้นทาง

class ConfirmPage extends StatelessWidget {
  final Map<String, dynamic> bookingData;

  ConfirmPage({required this.bookingData});

  void _showConfirmationDialog(
      BuildContext context, Map<String, dynamic> userData) {
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
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // ปิดป็อปอัพ Confirmation Dialog
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => OfficerPage(
                      userData: userData), // เรียกหน้า Officer ที่คุณต้องการไป
                ));
              },
              child: Text('ปิด'),
            ),
          ],
        );
      },
    );
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
                      _showConfirmationDialog(context, userData);
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
