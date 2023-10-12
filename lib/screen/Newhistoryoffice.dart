import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(home: Newhistoryoffice()));
}

class Newhistoryoffice extends StatefulWidget {
  const Newhistoryoffice({Key? key}) : super(key: key);

  @override
  State<Newhistoryoffice> createState() => _HistoryState();
}

class _HistoryState extends State<Newhistoryoffice> {
  int selectedIndex = 0;
  String displayText = '';
  bool showLine = false;

  Future<void> getConfirmData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('confirm').get();

      // เปลี่ยนข้อมูลจาก QuerySnapshot เป็น List of QueryDocumentSnapshot
      List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      // สร้าง List เพื่อเก็บข้อมูลจากทุกเอกสาร
      List<Map<String, dynamic>> allData = [];

      for (QueryDocumentSnapshot document in documents) {
        // เรียกใช้ .data() เพื่อรับข้อมูลจากเอกสารแต่ละเอกสาร
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        // เพิ่มข้อมูลจากเอกสารนี้ใน List
        allData.add(data);
      }

      // แสดงข้อมูลหรือทำอะไรก็ตามที่คุณต้องการกับข้อมูล
      print(allData);

      setState(() {
        // อัปเดตข้อมูลที่จะแสดงในแอปของคุณ
        displayText = 'Data from Firestore:\n${allData.toString()}';
        showLine = true;
      });
    } catch (e) {
      print('เกิดข้อผิดพลาดในการดึงข้อมูล: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe6ebe0),
      appBar: AppBar(
        title: Row(
          children: [
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
                ],
              ),
            ),
            SizedBox(height: 30),
            ToggleSwitch(
              minWidth: 100.0,
              initialLabelIndex: selectedIndex,
              labels: ['Confirm', 'Cancel'],
              activeBgColor: [Color(0xFF5ca4a9)],
              activeFgColor: Colors.white,
              inactiveFgColor: Colors.white,
              onToggle: (index) {
                setState(() {
                  selectedIndex = index!;
                  if (selectedIndex == 0) {
                    showLine = false; // ปิดการแสดงเส้นที่เดิม
                    getConfirmData(); // เรียกใช้งานเมื่อกด "Confirm"
                  } else if (selectedIndex == 1) {
                    displayText = 'Monday , August 17, 2022';
                    showLine = true;
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
          ],
        ),
      ),
    );
  }
}
