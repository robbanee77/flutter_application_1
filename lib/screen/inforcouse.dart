import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ResultDetailPage extends StatelessWidget {
  final Map<String, dynamic> resultData;

  ResultDetailPage({required this.resultData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Result Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Code: ${resultData['Code']}'),
              Text('Program: ${resultData['Program']}'),
              Text('Course: ${resultData['Course']}'),
              Text('Faculty: ${resultData['Faculty']}'),
              Text('Credit: ${resultData['Credit']}'),
              Text('Course description: ${resultData['Course description']}'),
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

              // นำทางไปยังหน้า YourBookingPage และส่งข้อมูลผู้จองไปด้วย
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      YourBookingPage(bookingData: bookingData),
                ),
              );
            },
            child: Icon(Icons.book), // ใส่ไอคอนที่คุณต้องการให้แสดงบนปุ่ม
          ),
        ));
  }
}

class YourBookingPage extends StatelessWidget {
  final Map<String, dynamic> bookingData;

  YourBookingPage({required this.bookingData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Booking Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                // child: Image.asset(
                //     'assets/logo.png'), // เปลี่ยน 'assets/logo.png' เป็นตำแหน่งของโลโก้ของคุณ
                ),
            // Text('Booking Code: ${bookingData['Code']}'),
            // Text('Program: ${bookingData['Program']}'),
            // Text('Course: ${bookingData['Course']}'),
            // Text('Faculty: ${bookingData['Faculty']}'),
            // Text('Credit: ${bookingData['Credit']}'),
            // Text('Course description: ${bookingData['Course description']}'),
            // เพิ่มข้อมูลอื่น ๆ ที่คุณต้องการแสดง
            SizedBox(height: 275), // เพิ่มระยะห่างระหว่างข้อมูลและปุ่ม

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // โค้ดที่ต้องการให้ปุ่มทำงาน
                  // ในกรณีนี้คุณอาจต้องนำข้อมูลไปยัง Activity อื่น
                },
                child: Text('ยืนยันข้อมูล'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
