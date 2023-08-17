import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart'; // นำเข้า ToggleSwitch

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int selectedIndex = 0; // เพิ่มตัวแปรสำหรับเก็บสถานะของ Toggle Buttons
  String displayText = ''; // เพิ่มตัวแปรสำหรับแสดงข้อความบน UI

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
            Text('History'),
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 45, left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5ca4a9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/histo2.png',
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ToggleSwitch(
              // เพิ่ม Toggle Buttons ที่นี่
              minWidth: 100.0,
              initialLabelIndex: selectedIndex,
              labels: ['Confirm', 'Cancel'],
              onToggle: (index) {
                setState(() {
                  selectedIndex = index!;
                  // เปลี่ยนข้อความที่จะแสดงบน UI ตามที่เลือก
                  if (selectedIndex == 0) {
                    displayText = 'Hello';
                  } else if (selectedIndex == 1) {
                    displayText = 'Love';
                  }
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              displayText, // แสดงข้อความบน UI ตามที่เลือกจาก Toggle Switch
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5ca4a9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
