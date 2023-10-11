// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'depart.dart';
// import 'STDPage.dart';

// void main() {
//   runApp(LoginApp());
// }

// class LoginApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: OfficerState(),
//     );
//   }
// }

// class OfficerState extends StatefulWidget {
//   @override
//   _OfficerState createState() => _OfficerState();
// }

// class _OfficerState extends State<OfficerState> {
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   User? loggedInUser; // เก็บข้อมูลผู้ใช้ที่ล็อกอิน

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFe6ebe0),
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Image.asset(
//               'assets/images/pro.png',
//               width: 30,
//               height: 30,
//               fit: BoxFit.contain,
//             ),
//             SizedBox(width: 8),
//             Text('Course reservation'),
//           ],
//         ),
//         backgroundColor: Color(0xFF5ca4a9),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(height: 80),
//                 Image.asset(
//                   "assets/images/user.png",
//                   width: 130,
//                   height: 130,
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   'LOGIN',
//                   style: TextStyle(
//                     fontSize: 30.0,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF5ca4a9),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(
//                     hintText: 'E-mail ',
//                     labelStyle: TextStyle(color: Color(0xFF5ca4a9)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF5ca4a9)),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     hintText: 'Password',
//                     labelStyle: TextStyle(color: Color(0xFF5ca4a9)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Color(0xFF5ca4a9)),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 20.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () async {
//                         try {
//                           if (!_usernameController.text.contains('@')) {
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: Text('Input Error'),
//                                   content: Text('Please enter a valid email.'),
//                                   actions: [
//                                     TextButton(
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: Text('OK'),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           } else {
//                             UserCredential userCredential = await FirebaseAuth
//                                 .instance
//                                 .signInWithEmailAndPassword(
//                               email: _usernameController.text,
//                               password: _passwordController.text,
//                             );

//                             loggedInUser = userCredential
//                                 .user; // บันทึกข้อมูลผู้ใช้ที่ล็อกอิน

//                             if (loggedInUser != null) {
//                               User? user = loggedInUser;

//                               if (user?.email == 'fst@gmail.com') {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Depart()),
//                                 );
//                               } else {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => STPage()),
//                                 );
//                               }
//                             }
//                           }
//                         } catch (e) {
//                           print('Error logging in: $e');

//                           if (e.toString().contains('user-not-found')) {
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: Text('Login Error'),
//                                   content:
//                                       Text('Email or password is incorrect.'),
//                                   actions: [
//                                     TextButton(
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: Text('OK'),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           }
//                         }
//                       },
//                       child: Text('Login'),
//                       style: ElevatedButton.styleFrom(
//                         elevation: 8,
//                         shadowColor: Colors.grey,
//                         primary: Color(0xFF5ca4a9),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/Newrequest.dart';
import 'package:flutter_application_1/screen/confirm.dart';
import 'depart.dart';
import 'STDPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OfficerState(),
    );
  }
}

class OfficerState extends StatefulWidget {
  @override
  _OfficerState createState() => _OfficerState();
}

class _OfficerState extends State<OfficerState> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  User? loggedInUser;

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
            Text('Course reservation'),
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 80),
                Image.asset(
                  "assets/images/user.png",
                  width: 130,
                  height: 130,
                ),
                SizedBox(height: 10.0),
                Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5ca4a9),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'E-mail ',
                    labelStyle: TextStyle(color: Color(0xFF5ca4a9)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF5ca4a9)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelStyle: TextStyle(color: Color(0xFF5ca4a9)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF5ca4a9)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          if (!_usernameController.text.contains('@')) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Input Error'),
                                  content: Text('Please enter a valid email.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                              email: _usernameController.text,
                              password: _passwordController.text,
                            );

                            loggedInUser = userCredential.user;

                            if (loggedInUser != null) {
                              User? user = loggedInUser;

                              if (user?.email == 'fst@gmail.com') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Newrequest()),
                                );

                                // บันทึกข้อมูลผู้ใช้ลงใน Firestore
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(user?.uid)
                                    .set({
                                  'email': user?.email,
                                  // เพิ่มข้อมูลอื่น ๆ ที่คุณต้องการบันทึกลงใน Firestore ที่นี่
                                });
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => STPage()),
                                );
                              }
                            }
                          }
                        } catch (e) {
                          print('Error logging in: $e');

                          if (e.toString().contains('user-not-found')) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Login Error'),
                                  content:
                                      Text('Email or password is incorrect.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        elevation: 8,
                        shadowColor: Colors.grey,
                        primary: Color(0xFF5ca4a9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
