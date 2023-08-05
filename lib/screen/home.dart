import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/loginStudent.dart';
import 'package:flutter_application_1/screen/loginofficer.dart';

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
              fit: BoxFit
                  .contain, // เพิ่มค่านี้หากคุณต้องการปรับขนาดภาพให้พอดีกับ AppBar
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return officerState();
                      }));
                    },
                    icon: Image.asset(
                      'assets/images/basket2.png',
                      width: 70,
                      height: 70,
                    ),
                    label: Text(
                      "Course reservetion.",
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
                // SizedBox(height: 20),
                // FractionallySizedBox(
                //   widthFactor: 0.7,
                //   child: ElevatedButton.icon(
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) {
                //         return LoginPageState();
                //       }));
                //     },
                //     icon: Image.asset(
                //       'assets/images/student.png',
                //       width: 80,
                //       height: 80,
                //     ),
                //     label: Text(
                //       "Student",
                //       style: TextStyle(fontSize: 20),
                //     ),
                //     style: ElevatedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       padding: EdgeInsets.all(20),
                //       elevation: 8,
                //       shadowColor: Colors.grey,
                //       primary: Color(0xFF5ca4a9),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
