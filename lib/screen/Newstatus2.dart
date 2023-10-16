// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(NewStatusStudent());
// }

// class NewStatusStudent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyStepper(),
//     );
//   }
// }

// class MyStepper extends StatefulWidget {
//   @override
//   _MyStepperState createState() => _MyStepperState();
// }

// class _MyStepperState extends State<MyStepper> {
//   int currentStep = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("2-Step Stepper"),
//       ),
//       body: Stepper(
//         currentStep: currentStep,
//         onStepTapped: (step) {
//           setState(() {
//             currentStep = step;
//           });
//         },
//         onStepContinue: () {
//           if (currentStep < 1) {
//             setState(() {
//               currentStep += 1;
//             });
//           }
//         },
//         onStepCancel: () {
//           if (currentStep > 0) {
//             setState(() {
//               currentStep -= 1;
//             });
//           }
//         },
//         steps: [
//           Step(
//             title: Text("Step 1"),
//             content: Column(
//               children: [
//                 StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('booking')
//                       .snapshots(),
//                   builder: (BuildContext context,
//                       AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (snapshot.hasError) {
//                       return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
//                     }

//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return CircularProgressIndicator();
//                     }

//                     return Column(
//                       children:
//                           snapshot.data?.docs.map((DocumentSnapshot document) {
//                         Map<String, dynamic> data =
//                             document.data() as Map<String, dynamic>;
//                         return ListTile(
//                           title: Text(data['ชื่อลูกค้า']),
//                           subtitle: Text(data['วันที่จอง']),
//                         );
//                       }).toList(),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Step(
//             title: Text("Step 2"),
//             content: Text("This is the content of Step 2."),
//           ),
//         ],
//       ),
//     );
//   }
// }
