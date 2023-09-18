// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_application_1/screen/inforcouse.dart';
// import 'package:flutter_application_1/screen/testsearch.dart';

// class Searches extends SearchDelegate {
//   CollectionReference _firebaseFiretore =
//       FirebaseFirestore.instance.collection("Subjects");

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return <Widget>[
//       IconButton(
//           icon: Icon(Icons.close),
//           onPressed: () {
//             query = "";
//           })
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: _firebaseFiretore.snapshots().asBroadcastStream(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             if (snapshot.data!.docs
//                 .where((QueryDocumentSnapshot<Object?> element) =>
//                     element['Code']
//                         .toString()
//                         .toLowerCase()
//                         .contains(query.toLowerCase()))
//                 .isEmpty) {
//               return Center(
//                 child: Text("No search query found"),
//               );
//             } else {
//               ///Fetch Data here
//               print(snapshot.data);
//               return ListView(children: [
//                 ...snapshot.data!.docs
//                     .where((QueryDocumentSnapshot<Object?> element) =>
//                         element['Code']
//                             .toString()
//                             .toLowerCase()
//                             .contains(query.toLowerCase()))
//                     .map((QueryDocumentSnapshot<Object?> data) {
//                   final String title = data.get('Code');
//                   final String name = data.get('Course');

//                   return ListTile(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => inforcouse(
//                                     data: data,
//                                   )));
//                     },
//                     title: Text(title),
//                     subtitle: Text(name),
//                   );
//                 })
//               ]);
//             }
//           }
//         });
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Center(child: Text('Search anithing here'));
//   }
// }
