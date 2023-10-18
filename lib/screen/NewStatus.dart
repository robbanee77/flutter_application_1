import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/LogoutPage.dart';
import 'package:flutter_application_1/screen/NewHistoryStudent.dart';
import 'package:flutter_application_1/screen/Newnotifstudent.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(NewStatusStudent());
}

class NewStatusStudent extends StatefulWidget {
  const NewStatusStudent({Key? key}) : super(key: key);

  @override
  _NewStatusStudentState createState() => _NewStatusStudentState();
}

class _NewStatusStudentState extends State<NewStatusStudent> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
            Text(' Course'),
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
                MaterialPageRoute(builder: (context) => NewNotifstudent()),
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
                MaterialPageRoute(
                  builder: (context) => NewHistoryStudent(),
                ),
              );
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/logout.png',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogoutPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Text(
                    'STATUS',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5ca4a9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/sta1.png',
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('booking')
                      .where('email',
                          isEqualTo: _auth.currentUser
                              ?.email) // ตรวจสอบเฉพาะเอกเมลผู้ใช้ที่เข้าสู่ระบบ
                      .snapshots(),
                  builder: (context, bookingSnapshot) {
                    // เช็คสถานะการเชื่อมต่อของข้อมูล
                    if (bookingSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (bookingSnapshot.hasError) {
                      return Text('Error: ${bookingSnapshot.error}');
                    }
                    if (bookingSnapshot.hasData) {
                      final bookingData = bookingSnapshot.data!.docs;
                      if (bookingData.isNotEmpty) {
                        List<Map<String, String>> statusList = [];
                        for (var doc in bookingData) {
                          statusList.add({
                            'Code': doc['data']['Code'].toString(),
                            'Program': doc['data']['Program'].toString(),
                          });
                        }
                        return buildStepWidget('In progress', '', statusList);
                      }
                    }
                    return Text('Status1: No data available');
                  },
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('confirm')
                      .where('email',
                          isEqualTo: _auth.currentUser
                              ?.email) // ตรวจสอบเฉพาะเอกเมลผู้ใช้ที่เข้าสู่ระบบ
                      .snapshots(),
                  builder: (context, confirmSnapshot) {
                    // เช็คสถานะการเชื่อมต่อของข้อมูล
                    if (confirmSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (confirmSnapshot.hasError) {
                      return Text('Error: ${confirmSnapshot.error}');
                    }
                    if (confirmSnapshot.hasData) {
                      final confirmData = confirmSnapshot.data!.docs;
                      if (confirmData.isNotEmpty) {
                        List<Map<String, String>> statusList = [];
                        for (var doc in confirmData) {
                          statusList.add({
                            'Code': doc['data']['Code'].toString(),
                            'Program': doc['data']['Program'].toString(),
                          });
                        }
                        return buildStepWidget('Confirm', '', statusList);
                      }
                    }
                    return Text('Status2: No data available');
                  },
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('cancel')
                      .where('email',
                          isEqualTo: _auth.currentUser
                              ?.email) // ตรวจสอบเฉพาะเอกเมลผู้ใช้ที่เข้าสู่ระบบ
                      .snapshots(),
                  builder: (context, cancelSnapshot) {
                    // เช็คสถานะการเชื่อมต่อของข้อมูล
                    if (cancelSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (cancelSnapshot.hasError) {
                      return Text('Error: ${cancelSnapshot.error}');
                    }
                    if (cancelSnapshot.hasData) {
                      final cancelData = cancelSnapshot.data!.docs;
                      if (cancelData.isNotEmpty) {
                        List<Map<String, String>> statusList = [];
                        for (var doc in cancelData) {
                          statusList.add({
                            'Code': doc['data']['Code'].toString(),
                            'Program': doc['data']['Program'].toString(),
                          });
                        }
                        return buildStepWidget('Cancel', '', statusList);
                      }
                    }
                    return Text('Status3: No data available');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStepWidget(
      String step, String stepText, List<Map<String, String>> statusList) {
    Color circleColor;

    // กำหนดสีของวงกลมตามค่าของ step
    if (step == 'Request') {
      circleColor = Colors.lightBlue; // สีฟ้าอ่อน
    } else if (step == 'Confirm') {
      circleColor = Color.fromARGB(255, 124, 181, 170); // สีฟ้าเข็ม
    } else if (step == 'Cancel') {
      circleColor = Colors.red; // สีแดง
    } else {
      circleColor = Color.fromARGB(255, 145, 145, 145); // สีเทาเข้มเสมอ
    }

    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circleColor,
                  ),
                ),
              ],
            ),
            Text(
              step,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              stepText,
              style: TextStyle(
                fontSize: 16,
                color: step == 'Status2'
                    ? Color.fromARGB(255, 5, 5, 5)
                    : Colors.black,
              ),
            ),
            Column(
              children: statusList
                  .map((status) => Column(
                        children: [
                          Text(
                            'Code: ${status['Code']}, Program: ${status['Program']}',
                          ),
                          if (statusList.length > 1) Divider(),
                        ],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
