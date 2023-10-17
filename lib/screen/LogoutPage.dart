import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screen/histostu.dart';
import 'package:flutter_application_1/screen/home.dart';
import 'package:flutter_application_1/screen/login.dart';

class LogoutPage extends StatefulWidget {
  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginActivity(), // LoginPage คือหน้าล็อคอิน
      ));
    } catch (e) {
      print('Error logging out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFFe6ebe0), // Updated background color to light green
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
            Text('  Log out'),
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
        actions: [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 0),
            Image.asset(
              "assets/images/logout2.png",
              width: 130,
              height: 130,
            ),
            SizedBox(height: 20),
            Text(
              'Do you want to log out ?',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5ca4a9),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homescreen()),
                  ); // นำผู้ใช้กลับสู่หน้า homescreen
                  // อาจต้องเพิ่มโค้ดเพิ่มเติมที่นี่หากมีการจัดการเพิ่มเติมหลังจากกลับสู่หน้าหลัก
                },
                child: Text('Log out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5ca4a9),
                )),
          ],
        ),
      ),
    );
  }
}
