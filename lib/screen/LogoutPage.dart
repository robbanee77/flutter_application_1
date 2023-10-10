import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screen/home.dart';
import 'package:flutter_application_1/screen/login.dart';

class LogoutPage extends StatefulWidget {
  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
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
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'คุณต้องการล็อคเอาท์หรือไม่?',
              style: TextStyle(fontSize: 18.0),
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
              child: Text('ล็อคเอาท์'),
            ),
          ],
        ),
      ),
    );
  }
}
