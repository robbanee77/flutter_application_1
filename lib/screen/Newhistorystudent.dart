// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_application_1/screen/LogoutPage.dart';
// import 'package:flutter_application_1/screen/Newnotifstudent.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: NewHistoryStudent(),
//     );
//   }
// }

// class NewHistoryStudent extends StatefulWidget {
//   const NewHistoryStudent({Key? key}) : super(key: key);

//   @override
//   _NewHistoryStudentState createState() => _NewHistoryStudentState();
// }

// class _NewHistoryStudentState extends State<NewHistoryStudent> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFe6ebe0),
//       appBar: AppBar(
//         title: Center(
//           // ทำให้ข้อความอยู่ตรงกลางใน AppBar
//           child: Row(
//             children: [
//               Image.asset(
//                 'assets/images/pro.png',
//                 width: 30,
//                 height: 30,
//                 fit: BoxFit.contain,
//               ),
//               SizedBox(width: 8),
//               Text('History'), // ข้อความใน AppBar
//             ],
//           ),
//         ),
//         backgroundColor: Color(0xFF5ca4a9),
//         actions: [
//           IconButton(
//             icon: Image.asset(
//               'assets/images/noti1.png',
//               width: 30,
//               height: 30,
//               fit: BoxFit.contain,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => NewNotifstudent()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Image.asset(
//               'assets/images/logout.png',
//               width: 30,
//               height: 30,
//               fit: BoxFit.contain,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LogoutPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         // ทำให้ข้อความอยู่ตรงกลางใน body
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'HISTORY',
//                 textAlign: TextAlign.center, // ทำให้อยู่ตรงกลาง
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF5ca4a9),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection('booking')
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Center(
//                         child: Text('เกิดข้อผิดพลาด: ${snapshot.error}'));
//                   }

//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }

//                   final bookingDocs = snapshot.data?.docs;

//                   if (bookingDocs == null || bookingDocs.isEmpty) {
//                     return Center(
//                         child: Text(
//                       'No reservations.',
//                       style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF5ca4a9)),
//                     ));
//                   }

//                   return ListView.builder(
//                     itemCount: bookingDocs.length,
//                     itemBuilder: (context, index) {
//                       final bookingData =
//                           bookingDocs[index].data() as Map<String, dynamic>;

//                       final code = bookingData['data']['Code'] as String;
//                       final program = bookingData['data']['Program'] as String;

//                       return Card(
//                         elevation: 5,
//                         margin:
//                             EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                         child: ListTile(
//                           title: Text(
//                             'You have a course reservation.',
//                             style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF5ca4a9)),
//                           ),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Code: $code'),
//                               Text('Program: $program'),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/LogoutPage.dart';
import 'package:flutter_application_1/screen/Newnotifstudent.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewHistoryStudent(),
    );
  }
}

class NewHistoryStudent extends StatefulWidget {
  const NewHistoryStudent({Key? key}) : super(key: key);

  @override
  _NewHistoryStudentState createState() => _NewHistoryStudentState();
}

class _NewHistoryStudentState extends State<NewHistoryStudent> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?>
      getUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      final userDoc = await _firestore
          .collection('booking')
          .where('email', isEqualTo: user.email)
          .get();
      final bookingDocs = userDoc.docs;
      if (bookingDocs.isNotEmpty) {
        return bookingDocs;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe6ebe0),
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Image.asset(
                'assets/images/pro.png',
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 8),
              Text('History'),
            ],
          ),
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'HISTORY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5ca4a9),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('เกิดข้อผิดพลาด: ${snapshot.error}'));
                  } else if (snapshot.data == null) {
                    return Center(
                      child: Text(
                        'No reservations.',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5ca4a9),
                        ),
                      ),
                    );
                  }

                  final bookingDocs =
                      snapshot.data as List<QueryDocumentSnapshot>;
                  return ListView.builder(
                    itemCount: bookingDocs.length,
                    itemBuilder: (context, index) {
                      final bookingData =
                          bookingDocs[index].data() as Map<String, dynamic>;
                      final code = bookingData['data']['Code'] as String;
                      final program = bookingData['data']['Program'] as String;

                      return Card(
                        elevation: 5,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: ListTile(
                          title: Text(
                            'You have a course reservation.',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5ca4a9),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Code: $code'),
                              Text('Program: $program'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
