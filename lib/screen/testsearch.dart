// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_application_1/screen/inforcouse.dart';

// class Searchpage extends StatefulWidget {
//   const Searchpage({Key? key}) : super(key: key);

//   @override
//   State<Searchpage> createState() => _SearchpageState();
// }

// class _SearchpageState extends State<Searchpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search'),
//       ),
//       body: Searchpage(),
//     );
//   }
// }

// // class Search extends SearchDelegate {
// //   final CollectionReference _firebaseFirestore =
// //       FirebaseFirestore.instance.collection("Subjects");

// //   @override
// //   List<Widget>? buildActions(BuildContext context) {
// //     return <Widget>[
// //       IconButton(
// //         icon: Icon(Icons.clear),
// //         onPressed: () {
// //           query = "";
// //         },
// //       )
// //     ];
// //   }

// //   @override
// //   Widget? buildLeading(BuildContext context) {
// //     return IconButton(
// //       icon: Icon(Icons.arrow_back),
// //       onPressed: () {
// //         close(context, null);
// //       },
// //     );
// //   }

// //   @override
// //   Widget buildResults(BuildContext context) {
// //     return StreamBuilder<QuerySnapshot>(
// //       stream: _firebaseFirestore.snapshots().asBroadcastStream(),
// //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //         if (!snapshot.hasData) {
// //           return Center(child: CircularProgressIndicator());
// //         } else {
// //           final List<QueryDocumentSnapshot> filteredDocs = snapshot.data!.docs
// //               .where((doc) => doc['Code']
// //                   .toString()
// //                   .toLowerCase()
// //                   .contains(query.toLowerCase()))
// //               .toList();

// //           if (filteredDocs.isEmpty) {
// //             return Center(
// //               child: Text("No results found"),
// //             );
// //           } else {
// //             return ListView.builder(
// //               itemCount: filteredDocs.length,
// //               itemBuilder: (context, index) {
// //                 final String title = filteredDocs[index]['Code'];
// //                 final String name = filteredDocs[index]['Course'];
// //                 final String names = filteredDocs[index]['description'];

// //                 return ListTile(
// //                   onTap: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => inforcouse(
// //                           data: filteredDocs[index],
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   title: Text(title),
// //                   leading: CircleAvatar(
// //                       // backgroundImage: NetworkImage(image),
// //                       ),
// //                   subtitle: Text(name),
// //                 );
// //               },
// //             );
// //           }
// //         }
// //       },
// //     );
// //   }

// //   @override
// //   Widget buildSuggestions(BuildContext context) {
// //     return Center(child: Text('Search anything here'));
// //   }
// // }
