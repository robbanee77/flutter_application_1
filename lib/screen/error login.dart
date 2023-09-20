// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screen/STDPage.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(MaterialApp(
//     home: LoginActivity(),
//   ));
// }

// class LoginActivity extends StatefulWidget {
//   @override
//   _LoginActivityState createState() => _LoginActivityState();
// }

// class _LoginActivityState extends State<LoginActivity> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   // สร้างฟังก์ชัน login ใน _LoginActivityState
//   Future<void> login(String email, String password) async {
//     final firestore = FirebaseFirestore.instance;
//     final userRef = firestore.collection('Users');

//     try {
//       final userSnapshot = await userRef.where('email', isEqualTo: email).get();

//       if (userSnapshot.docs.isEmpty) {
//         throw Exception('User not found');
//       }

//       final userData = userSnapshot.docs.first.data() as Map<String, dynamic>;

//       if (userData['password'] != password) {
//         throw Exception('Incorrect password');
//       }

//       // ทำสิ่งที่คุณต้องการหลังจากล็อคอินสำเร็จ
//       print('Login successful');
//       print('User data: $userData');
//     } catch (error) {
//       // หากเกิดข้อผิดพลาดในระหว่างล็อคอิน
//       print('Login error: $error');
//       throw error; // ส่งข้อผิดพลาดออกไปเพื่อให้การจัดการอื่น ๆ ดักรับ
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await login(emailController.text, passwordController.text);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => STPage()),
//                   );
//                 } catch (error) {
//                   // หากเกิดข้อผิดพลาดในฟังก์ชัน login
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text('Login Error'),
//                         content: Text('$error'), // แสดงข้อความของข้อผิดพลาด
//                         actions: [
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.of(context)
//                                   .pop(); // ปิดกล่องข้อความผิดพลาด
//                             },
//                             child: Text('OK'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//               },
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
