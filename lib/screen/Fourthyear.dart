import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/LogoutPage.dart';
import 'package:flutter_application_1/screen/Newhistorystudent.dart';
import 'package:flutter_application_1/screen/Newnotifstudent.dart';
import 'package:flutter_application_1/screen/Newsuggest.dart';

class fourthyear extends StatefulWidget {
  fourthyear({Key? key}) : super(key: key);

  @override
  _fourthyearState createState() => _fourthyearState();
}

class _fourthyearState extends State<fourthyear> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> year1Data = [];
  List<String> year2Data = [];
  List<String> year3Data = [];
  List<String> year4Data = [];

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
                MaterialPageRoute(builder: (context) => NewHistoryStudent()),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/suggestion1.png",
                    width: 130,
                    height: 130,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'SUGGEST SUBJECT',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5ca4a9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {
                      getYear1Data().then((data) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Newsuggest(data)),
                        );
                      });
                    },
                    child: Text('1st year', style: TextStyle(fontSize: 25)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5ca4a9),
                      padding: EdgeInsets.all(16),
                      elevation: 8, // ปรับระดับเงาตามที่คุณต้องการ
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {
                      getYear2Data().then((data) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Newsuggest(data)),
                        );
                      });
                    },
                    child: Text('2nd year', style: TextStyle(fontSize: 25)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5ca4a9),
                      padding: EdgeInsets.all(16),
                      elevation: 8, // ปรับระดับเงาตามที่คุณต้องการ
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {
                      getYear3Data().then((data) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Newsuggest(data)),
                        );
                      });
                    },
                    child: Text('3rd year', style: TextStyle(fontSize: 25)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5ca4a9),
                      padding: EdgeInsets.all(16),
                      elevation: 8, // ปรับระดับเงาตามที่คุณต้องการ
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {
                      getYear4Data().then((data) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Newsuggest(data)),
                        );
                      });
                    },
                    child: Text('4th year', style: TextStyle(fontSize: 25)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5ca4a9),
                      padding: EdgeInsets.all(16),
                      elevation: 8, // ปรับระดับเงาตามที่คุณต้องการ
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<List<String>> getYear1Data() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('year1').get();
    List<String> data = querySnapshot.docs.map((document) {
      return "Code: ${document['Code']}\nProgram: ${document['Program']}\nCourse: ${document['Course']}\nCredit: ${document['Credit']}";
    }).toList();
    return data;
  }

  Future<List<String>> getYear2Data() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('year2').get();
    List<String> data = querySnapshot.docs.map((document) {
      return "Code: ${document['Code']}\nProgram: ${document['Program']}\nCourse: ${document['Course']}\nCredit: ${document['Credit']}";
    }).toList();
    return data;
  }

  Future<List<String>> getYear3Data() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('year3').get();
    List<String> data = querySnapshot.docs.map((document) {
      return "Code: ${document['Code']}\nProgram: ${document['Program']}\nCourse: ${document['Course']}\nCredit: ${document['Credit']}";
    }).toList();
    return data;
  }

  Future<List<String>> getYear4Data() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('year4').get();
    List<String> data = querySnapshot.docs.map((document) {
      return "Code: ${document['Code']}\nProgram: ${document['Program']}\nCourse: ${document['Course']}\nCredit: ${document['Credit']}";
    }).toList();
    return data;
  }
}
