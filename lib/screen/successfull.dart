import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screen/confirm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OfficerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Officer Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ข้อมูลผู้ใช้'),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .where('email',
                      isEqualTo:
                          'robbanee@ftu.ac.th') // ใช้อีเมลของผู้ที่ล็อกอินที่คุณต้องการแสดง
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                var userData =
                    snapshot.data!.docs.first.data() as Map<String, dynamic>;
                return Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Email: ${userData['email']}'),
                    Text('ID: ${userData['code']}'),
                    Text('Name: ${userData['name']}'),
                    Text('Faculty: ${userData['faculty']}'),
                    Text('Department: ${userData['department']}'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
