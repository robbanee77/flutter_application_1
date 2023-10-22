import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/LogoutPage.dart';
import 'package:flutter_application_1/screen/Newhistorystudent.dart';
import 'package:flutter_application_1/screen/Newnotifstudent.dart';
import 'package:flutter_application_1/screen/inforcouse.dart';

class Newsuggest extends StatelessWidget {
  final List<String> yearData;

  Newsuggest(this.yearData);

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
            Text(' Courses'),
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
                MaterialPageRoute(builder: (context) => NewNotifstudent()),
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
                MaterialPageRoute(builder: (context) => NewHistoryStudent()),
              );
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/logout.png',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogoutPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                Text(
                  'SUGGEST SUBJECT',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5ca4a9),
                  ),
                ),
                SizedBox(width: 10),
                Image.asset(
                  'assets/images/suggestion1.png',
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),
          if (yearData.isNotEmpty) ...{
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: yearData.map((data) {
                    Map<String, dynamic> resultData = parseData(data);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              'Code: ${resultData['Code']}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Program: ${resultData['Program']}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResultDetailPage(
                                        resultData: resultData,
                                      ),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xFF5ca4a9)),
                                ),
                                child: Text(
                                  'View Details',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          }
        ],
      ),
    );
  }

  Map<String, dynamic> parseData(String data) {
    List<String> parts = data.split('\n');
    Map<String, dynamic> resultData = {
      'Code': parts[0].substring(parts[0].indexOf(':') + 2),
      'Program': parts[1].substring(parts[1].indexOf(':') + 2),
      'Course': parts[2].substring(parts[2].indexOf(':') + 2),
      'Faculty': parts[3].substring(parts[3].indexOf(':') + 2),
      'Credit': parts[4].substring(parts[4].indexOf(':') + 2),
      'Course description': parts[5].substring(parts[5].indexOf(':') + 2),
    };
    return resultData;
  }
}
