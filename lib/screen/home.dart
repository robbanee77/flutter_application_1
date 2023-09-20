import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/error%20login.dart';
import 'package:flutter_application_1/screen/loginStudent.dart';
import 'package:flutter_application_1/screen/loginofficer.dart';
import 'package:flutter_application_1/screen/test%20login.dart';

class homescreen extends StatelessWidget {
  const homescreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/pro1.png',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8),
            Text('Course reservation'),
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFe6ebe0),
              Color(0xFFe6ebe0),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginActivity();
                        }),
                      );
                    },
                    icon: Image.asset(
                      'assets/images/basket2.png',
                      width: 70,
                      height: 70,
                    ),
                    label: Text(
                      "Course reservation.",
                      style: TextStyle(fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(20),
                      elevation: 8,
                      shadowColor: Colors.grey,
                      primary: Color(0xFF5ca4a9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
