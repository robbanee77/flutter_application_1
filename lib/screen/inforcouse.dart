import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screen/histostu.dart';
import 'package:flutter_application_1/screen/notistu.dart';
import 'package:flutter_application_1/screen/request.dart';

class inforcouse extends StatefulWidget {
  const inforcouse({super.key});

  @override
  _inforcouseState createState() => _inforcouseState();
}

class _inforcouseState extends State<inforcouse> {
  get onPressed => null;

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
            Text('Infor Course'),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'IT2301-311',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Information Security',
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
              'Course Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'understand basic principles of mathematical logic theory Axioms of fields. Boolean algebra. Algorithms and pseudocode. Induction and recursion Relationships and Diagraphs establishing a rank relationship and rank structure Partial ordered sets, lattice, finite Boolean algebra. Representation of Boolean functions in boolean polynomial, graph, and tree form.',
              style: TextStyle(
                fontSize: 15,
                //fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => request()),
                    ));
                // Handle button 2 press
              },
              child: Text(" course reserve"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                primary: Color(0xFF5ca4a9), // เปลี่ยนสีปุ่ม
                shadowColor: Colors.grey,
              ),
            ),
            Container(
              height: 2,
              width: 350, // ปรับความยาวของเส้น
              color: Colors.black,
              margin: EdgeInsets.only(top: 20),
            ),
          ],
        ),
      ),
    );
  }
}
