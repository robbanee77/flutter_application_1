import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/request.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(MaterialApp(home: History()));
}

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int selectedIndex = 0;
  String displayText = '';
  bool showLine = false;
  bool isCancelButtonSelected =
      false; // เพิ่มตัวแปรสำหรับตรวจสอบการเลือก "Cancel"
  bool isBerahengButtonVisible =
      false; // เพิ่มตัวแปรสำหรับการแสดงปุ่ม "beraheng"

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
            SizedBox(height: 30),
            ToggleSwitch(
              minWidth: 100.0,
              initialLabelIndex: selectedIndex,
              labels: ['Confirm', 'Cancel'],
              activeBgColor: [Color(0xFF5ca4a9)], // สีพื้นหลังปุ่ม "Confirm"
              activeFgColor: Colors.white, // สีข้อความปุ่ม "Confirm"
              //inactiveBgColor: [Color(0xFFed6a5a)], // สีพื้นหลังปุ่ม "Cancel"
              inactiveFgColor: Colors.white, // สีข้อความปุ่ม "Cancel"
              onToggle: (index) {
                setState(() {
                  selectedIndex = index!;
                  if (selectedIndex == 0) {
                    displayText = 'Saturday, November 26, 2022';
                    showLine = true;
                    isCancelButtonSelected = false;
                    isBerahengButtonVisible = false;
                  } else if (selectedIndex == 1) {
                    displayText = 'Monday , August 17, 2022';
                    displayText = 'Sunnday , August 17, 2022';
                    showLine = true;
                    isCancelButtonSelected = true;
                    isBerahengButtonVisible = true;
                  }
                });
              },
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  displayText,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5ca4a9),
                  ),
                ),
              ),
            ),
            if (showLine) SizedBox(height: 10),
            if (showLine)
              Container(
                width: 350,
                height: 2,
                color: Color(0xFF5ca4a9),
              ),
            SizedBox(height: 20),
            if (showLine)
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    selectedIndex == 0
                        ? '02:00.PM  621431010 Farhan Umudee                      E-Business System  Subject '
                        : '09:20.AM  621431171 Basree Weadaoh                     E-Business System  Subject ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF5ca4a9),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20),
            if (showLine &&
                isBerahengButtonVisible) // ตรวจสอบการแสดงปุ่ม "beraheng"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => request()),
                          ));
                      // การกระทำเมื่อปุ่ม "beraheng" ถูกกด
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5ca4a9),
                    ),
                  ),
                ],
              ),

            //box two
            if (showLine) SizedBox(height: 10),
            if (showLine)
              Container(
                width: 350,
                height: 2,
                color: Color(0xFF5ca4a9),
              ),
            SizedBox(height: 20),
            if (showLine)
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    selectedIndex == 0
                        ? '08:00.AM  621431010 Roiyan Umudee                        E-Business System  Subject '
                        : '03:20.PM  621431121 Fatiimoh hajiarong                   E-Business System  Subject ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF5ca4a9),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20),
            if (showLine &&
                isBerahengButtonVisible) // ตรวจสอบการแสดงปุ่ม "beraheng"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => request()),
                          ));
                      // การกระทำเมื่อปุ่ม "beraheng" ถูกกด
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5ca4a9),
                    ),
                  ),
                ],
              ),
            if (showLine) SizedBox(height: 20),
            if (showLine)
              Container(
                width: 350,
                height: 2,
                color: Color(0xFF5ca4a9),
              ),
          ],
        ),
      ),
    );
  }
}
