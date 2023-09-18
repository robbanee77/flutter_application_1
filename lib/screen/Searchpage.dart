// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_application_1/screen/histostu.dart';
// import 'package:flutter_application_1/screen/inforcouse.dart';
// import 'package:flutter_application_1/screen/notistu.dart';
// import 'package:firebase_core/firebase_core.dart';

// class Searches extends StatefulWidget {
//   @override
//   _SearchesState createState() => _SearchesState();
// }

// class _SearchesState extends State<Searches> {
//   final CollectionReference _firebaseFirestore =
//       FirebaseFirestore.instance.collection("Subjects");
//   String query = "";

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
//                 MaterialPageRoute(builder: (context) => notistu()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Image.asset(
//               'assets/images/histo.png',
//               width: 30,
//               height: 30,
//               fit: BoxFit.contain,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => historystu()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: ListView(
//           shrinkWrap: true, // Set shrinkWrap to true
//           children: [
//             SizedBox(height: 0.0),
//             Image.asset(
//               "assets/images/search3.png",
//               width: 150,
//               height: 150,
//             ),
//             SizedBox(height: 0.0),
//             Column(
//               mainAxisAlignment:
//                   MainAxisAlignment.center, // Center-align content
//               children: [
//                 Text(
//                   "CODE OF SUBJECTS",
//                   style: TextStyle(
//                     fontSize: 25.0,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF5ca4a9),
//                   ),
//                 ),
//                 SizedBox(height: 0.0),
//                 Text(
//                   "( Ex: IT2301-101 )",
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFFed6a5a),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10.0),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15.0),
//               child: TextField(
//                 onChanged: (value) {
//                   setState(() {
//                     query = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Search...',
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       Icons.search,
//                       color: Color(0xFF5ca4a9),
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         query = "";
//                       });
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(13.0),
//                     borderSide: BorderSide(
//                       color: Color(0xFF5ca4a9),
//                       width: 2.0,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(
//                       color: Color(0xFF5ca4a9),
//                       width: 2.0,
//                     ),
//                   ),
//                   // Adjust the padding of the search bar
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ), // Add some spacing between the search bar and results
//             buildResults(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildResults(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _firebaseFirestore.snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) {
//           return Center(child: CircularProgressIndicator());
//         } else {
//           final filteredDocs = snapshot.data!.docs
//               .where((doc) =>
//                   doc['Code']
//                       .toString()
//                       .toLowerCase()
//                       .contains(query.toLowerCase()) ||
//                   doc['Course']
//                       .toString()
//                       .toLowerCase()
//                       .contains(query.toLowerCase()))
//               .toList();

//           if (filteredDocs.isEmpty) {
//             return Center(
//               child: Text("No search query found"),
//             );
//           } else {
//             return ListView.builder(
//               shrinkWrap: true, // Set shrinkWrap to true
//               itemCount: filteredDocs.length,
//               itemBuilder: (context, index) {
//                 final String title = filteredDocs[index]['Code'];
//                 final String name = filteredDocs[index]['Course'];

//                 return ListTile(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => inforcouse(
//                           data: filteredDocs[index],
//                         ),
//                       ),
//                     );
//                   },
//                   title: Text(title),
//                   subtitle: Text(name),
//                 );
//               },
//             );
//           }
//         }
//       },
//     );
//   }
// }
