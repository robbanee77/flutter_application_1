import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screen/histoff.dart';
import 'package:flutter_application_1/screen/inforcouse.dart';
import 'package:flutter_application_1/screen/notioff.dart';
import 'package:flutter_application_1/screen/testsearch.dart';
import 'package:flutter_application_1/screen/Searchpage.dart';
import 'package:flutter_application_1/screen/Search.dart';

class ds extends StatefulWidget {
  const ds({super.key});

  @override
  State<ds> createState() => _dsState();
}

class _dsState extends State<ds> {
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
            Text('Course resevation'),
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
                MaterialPageRoute(builder: (context) => notioff()),
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
                MaterialPageRoute(builder: (context) => History()),
              );
              // ดักเหตุการณ์เมื่อกดปุ่ม Info ที่อยู่ฝั่งซ้ายของ AppBar
              // คุณสามารถใส่โค้ดที่คุณต้องการทำเมื่อกดปุ่มนี้ได้ที่นี่
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 5),
            child: Column(
              children: [
                Container(
                  // decoration: BoxDecoration(
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.5),
                  //       spreadRadius: 3,
                  //       blurRadius: 5,
                  //       offset: Offset(0, 3),
                  //     ),
                  //   ],
                  //   shape: BoxShape.circle,
                  // ),
                  child: Image.asset(
                    'assets/images/ds3.png',
                    width: 270,
                    height: 170,
                    fit: BoxFit.contain,
                  ),
                ),
                // SizedBox(height: 20),
                // Text(
                //   "INFORMATION SCIENCE AND ANALYSIS",
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //     color: Color(0xFF5ca4a9),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: ((context) => Searchpage()),
                    //     ));
                    // Handle button 1 press
                  },
                  child: Text("Fundamental Programming"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    primary: Color(0xFF5ca4a9), // เปลี่ยนสีปุ่ม
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle button 2 press
                  },
                  child: Text("Mathematics for Data Science"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    primary: Color(0xFF5ca4a9), // เปลี่ยนสีปุ่ม
                    shadowColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle button 3 press
                  },
                  child: Text("Calculus for Data Science"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    primary: Color(0xFF5ca4a9), // เปลี่ยนสีปุ่ม
                    shadowColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle button 3 press
                  },
                  child: Text("Fundamental Data Science"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    primary: Color(0xFF5ca4a9), // เปลี่ยนสีปุ่ม
                    shadowColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle button 3 press
                  },
                  child: Text("Data Mining"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    primary: Color(0xFF5ca4a9), // เปลี่ยนสีปุ่ม
                    shadowColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle button 3 press
                  },
                  child: Text("Big Data and Data Warehouse"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    primary: Color(0xFF5ca4a9), // เปลี่ยนสีปุ่ม
                    shadowColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle button 3 press
                  },
                  child: Text(" Data Management and Analytics"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    primary: Color(0xFF5ca4a9), // เปลี่ยนสีปุ่ม
                    shadowColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
