import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/histostu.dart';
import 'package:flutter_application_1/screen/notistu.dart';
import 'Search.dart';
import 'status.dart';

class STPage extends StatefulWidget {
  const STPage({Key? key}) : super(key: key);

  @override
  _STPageState createState() => _STPageState();
}

class _STPageState extends State<STPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFFe6ebe0), // Updated background color to light green
      appBar: AppBar(
        title: Row(
          children: [
            //Image.asset(
            //'assets/images/basket.png',
            // width: 30,
            //height: 30,
            //fit: BoxFit.contain,
            //),
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
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Search()),
                        );
                        // Handle button 1 press
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/search.png',
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Search of subject',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xFF5ca4a9), // Set button 1 color to green
                        padding: EdgeInsets.all(16),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => status()),
                        );
                        // Handle button 2 press
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/goals copy.png',
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '           Status          ',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5ca4a9),
                        // Set button 2 color to green
                        padding: EdgeInsets.all(16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
