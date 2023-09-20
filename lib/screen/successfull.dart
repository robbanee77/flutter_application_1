import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OfficerPage extends StatelessWidget {
  final Map<String, dynamic> userData;

  OfficerPage({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/pro1.png',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8),
            Text('Course reservation'),
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ข้อมูลที่ดึงมาจาก ConfirmPage:'),
            Text('ชื่อ: ${userData['name']}'),
            Text('อีเมล: ${userData['email']}'),
            // แสดงข้อมูลอื่นๆ ตามความต้องการ
          ],
        ),
      ),
    );
  }
}
