// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_application_1/screen/confirm.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class OfficerPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Officer Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('ข้อมูลผู้ใช้'),
//             StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('Users1')
//                   .where('email') // ใช้อีเมลของผู้ที่ล็อกอินที่คุณต้องการแสดง
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 }
//                 var userData =
//                     snapshot.data!.docs.first.data() as Map<String, dynamic>;
//                 return Column(
//                   children: [
//                     SizedBox(height: 10),
//                     Text('ID: ${userData['code']}'),
//                     Text('Name: ${userData['name']}'),
//                   ],
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OfficerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Officer Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ข้อมูลผู้ใช้'),
            FutureBuilder(
              future: Firebase.initializeApp(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (FirebaseAuth.instance.currentUser == null) {
                  // ไม่มีผู้ใช้ล็อกอิน
                  return Text('ไม่มีผู้ใช้ล็อกอิน');
                }

                return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Users1')
                      .where('email',
                          isEqualTo: FirebaseAuth.instance.currentUser!.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      // ไม่มีข้อมูลหรือข้อมูลว่าง
                      return Text('ไม่พบข้อมูลผู้ใช้');
                    }

                    var userData = snapshot.data!.docs.first.data()
                        as Map<String, dynamic>;
                    return Column(
                      children: [
                        SizedBox(height: 10),
                        Text('ID: ${userData['code']}'),
                        Text('Name: ${userData['name']}'),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
