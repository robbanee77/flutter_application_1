import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/confirm.dart';
import 'package:flutter_application_1/screen/histoff.dart';
import 'package:flutter_application_1/screen/histostu.dart';
import 'package:flutter_application_1/screen/notistu.dart';
import 'package:flutter_application_1/screen/successfull.dart';

class ResultDetailPage extends StatelessWidget {
  final Map<String, dynamic> resultData;

  ResultDetailPage({required this.resultData});

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
              Text('Course resevetion'),
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
                // ดักเหตุการณ์เมื่อกดปุ่ม Info ที่อยู่ฝั่งซ้ายของ AppBar
                // คุณสามารถใส่โค้ดที่คุณต้องการทำเมื่อกดปุ่มนี้ได้ที่นี่
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
        body: Padding(
          padding: EdgeInsets.only(top: 25, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Code: ${resultData['Code']}',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Program: ${resultData['Program']}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 2,
                width: 350, // ปรับความยาวของเส้น
                color: Colors.black,
                margin: EdgeInsets.only(top: 20),
              ),
              SizedBox(height: 20),
              Text(
                'Course: ${resultData['Course']}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Faculty: ${resultData['Faculty']}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Credit: ${resultData['Credit']}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Course description: ${resultData['Course description']}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // เพิ่มข้อมูลอื่น ๆ ที่คุณต้องการแสดง
            ],
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: () {
              // สร้าง Map ข้อมูลผู้จอง
              Map<String, dynamic> bookingData = {
                'Code': resultData['Code'],
                'Program': resultData['Program'],
                'Course': resultData['Course'],
                'Faculty': resultData['Faculty'],
                'Credit': resultData['Credit'],
                'Course description': resultData['Course description'],
              };

              // นำทางไปยังหน้า ConfirmPage และส่งข้อมูลผู้จองไปด้วย
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ConfirmPage()),
              );
            },
            child: Icon(Icons.book), // ใส่ไอคอนที่คุณต้องการให้แสดงบนปุ่ม
            backgroundColor: Color(0xFF5ca4a9),
          ),
        ));
  }
}
