import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/histoff.dart';
import 'package:flutter_application_1/screen/notioff.dart';

class request extends StatefulWidget {
  const request({super.key});

  @override
  State<request> createState() => _requestState();
}

class _requestState extends State<request> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe6ebe0),
      appBar: AppBar(
        title: Row(
          children: [SizedBox(width: 8), Text('Course reservation')],
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
                MaterialPageRoute(builder: (context) => histoty()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF5ca4a9),
                    border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255), width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Your existing ListView.builder goes here
                      Expanded(
                        child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            final data = [
                              '621431010',
                              'Robbanee Beraheng',
                              'Faculty of Education',
                              'English language teaching',
                              'Freedom subject',
                              'Group 01',
                            ];

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                '${index + 1}. ${data[index]}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ), // Add some spacing between the text and buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle the "ยืนยัน" button press
                      },
                      child: Text('ยืนยัน'),
                    ),
                    SizedBox(width: 10), // Add spacing between the buttons
                    ElevatedButton(
                      onPressed: () {
                        // Handle the "ยกเลิก" button press
                      },
                      child: Text('ยกเลิก'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ), // Add some spacing between the buttons and the second container
                Container(
                  width: 300,
                  height: 300,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF5ca4a9),
                    border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255), width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Your existing ListView.builder goes here
                      Expanded(
                        child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            final data = [
                              '621431010',
                              'Robbanee Beraheng',
                              'Faculty of Education',
                              'English language teaching',
                              'Freedom subject',
                              'Group 01',
                            ];

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                '${index + 1}. ${data[index]}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ), // Add some spacing below the second container
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle the "ยืนยัน" button press
                      },
                      child: Text('ยืนยัน'),
                    ),
                    SizedBox(width: 10), // Add spacing between the buttons
                    ElevatedButton(
                      onPressed: () {
                        // Handle the "ยกเลิก" button press
                      },
                      child: Text('ยกเลิก'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
