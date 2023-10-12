import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/Newrequest.dart';
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
  List<Map<String, dynamic>> confirmData = [];

  Future<void> getConfirmData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('confirm').get();

      confirmData.clear();

      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        confirmData.add(data);
      }

      setState(() {
        displayText = 'Data from Firestore:\n';
        for (var data in confirmData) {
          displayText += ' ${data['code']}, ${data['name']}, ${data['data']}\n';
        }
        showLine = true;
      });
    } catch (e) {
      print('เกิดข้อผิดพลาดในการดึงข้อมูล: $e');
    }
  }

  Future<void> getCancelData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('cancel').get();

      confirmData.clear();

      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        confirmData.add(data);
      }

      setState(() {
        displayText = 'Data from Firestore:\n';
        for (var data in confirmData) {
          displayText += ' ${data['code']}, ${data['name']}, ${data['data']}\n';
        }
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
              activeFgColor: Colors.white,
              inactiveFgColor: Colors.white,
              onToggle: (index) {
                setState(() {
                  selectedIndex = index!;
                  if (selectedIndex == 0) {
                    showLine = false;
                    getConfirmData();
                  } else if (selectedIndex == 1) {
                    showLine = false;
                    getCancelData(); // เรียกใช้งานเมื่อกด "Cancel"
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

            // สร้าง ListView.builder เพื่อแสดงปุ่ม Edit โดยไม่แสดงข้อมูลอีกครั้ง
            if (selectedIndex == 1) // ตรวจสอบว่าเลือก Cancel
              Container(
                height: 300, // ปรับความสูงตามที่คุณต้องการ
                child: ListView.builder(
                  itemCount: confirmData.length,
                  itemBuilder: (context, index) {
                    var data = confirmData[index];
                    return ListTile(
                      // ไม่แสดงข้อมูลในรายการ
                      // เพิ่มปุ่ม Edit ที่นี่
                      title: SizedBox.shrink(), // รายการว่าง
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // รีแเค็สชิ้นข้อมูลหรือกระทำอื่น ๆ เมื่อกดปุ่ม Edit
                          // ในตัวอย่างนี้ไม่ได้ทำอะไรเพิ่มเติม
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Newrequest()),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
