import 'package:flutter/material.dart';

class NextActivity extends StatelessWidget {
  final Map<String, dynamic> data;

  NextActivity({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Activity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // แสดงข้อมูลผู้ใช้ที่ถูกส่งมาจาก YourBookingPage
            Text('Ameer: ${data['Student']}'),
            // สามารถแสดงข้อมูลอื่น ๆ ตามที่คุณต้องการ
          ],
        ),
      ),
    );
  }
}
