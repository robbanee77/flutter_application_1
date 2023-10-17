import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/Fourthyear.dart';
import 'package:flutter_application_1/screen/LogoutPage.dart';
import 'package:flutter_application_1/screen/NewStatus.dart';
import 'package:flutter_application_1/screen/Newhistorystudent.dart';
import 'package:flutter_application_1/screen/Newnotifstudent.dart';
import 'package:flutter_application_1/screen/Newstatus2.dart';
import 'package:flutter_application_1/screen/Newsuggest.dart';
import 'package:flutter_application_1/screen/Search.dart';
import 'package:flutter_application_1/screen/home.dart';
import 'package:flutter_application_1/screen/notistu.dart';
import 'package:flutter_application_1/widgets/searches_widget.dart';
import 'status.dart';
import 'home_page.dart';

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
            Image.asset(
              'assets/images/pro.png',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8),
            Text(' Course'),
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
                          MaterialPageRoute(
                              builder: (context) => NewStatusStudent()),
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
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => fourthyear()),
                        );
                        // Handle button 2 press
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/suggestion.png',
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '  Suggest subject  ',
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
