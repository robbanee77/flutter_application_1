import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Newnotifstudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลการยืนยัน'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ข้อมูลของคุณถูกยืนยันแล้ว'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // ปิดหน้า "Newnotifstudent"
              },
              child: Text('กลับ'),
            ),
          ],
        ),
      ),
    );
  }
}
