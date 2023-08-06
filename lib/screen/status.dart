import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'histostu.dart';
import 'notistu.dart';
import 'package:timeline_tile/timeline_tile.dart';

class status extends StatefulWidget {
  const status({super.key});

  @override
  State<status> createState() => _statusState();
}

class _statusState extends State<status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe6ebe0),
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/pro.png',
                width: 30, height: 30, fit: BoxFit.contain),
            SizedBox(width: 8),
            Text('Status')
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
              // ดักเหตุการณ์เมื่อกดปุ่ม Info ที่อยู่ฝั่งซ้ายของ AppBar
              // คุณสามารถใส่โค้ดที่คุณต้องการทำเมื่อกดปุ่มนี้ได้ที่นี่
            },
          ),
        ],
      ),
    );
  }
}
