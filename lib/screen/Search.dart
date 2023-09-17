import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/courseif.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/histostu.dart';
import 'package:flutter_application_1/screen/inforcouse.dart';
import 'package:flutter_application_1/screen/notistu.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  String searchResult = "";

  // void _performSearch(String searchTerm) async {
  //   try {
  //     FirebaseFirestore firestore = FirebaseFirestore.instance;
  //     CollectionReference subjectsCollection = firestore.collection('subjects');

  //     QuerySnapshot querySnapshot =
  //         await subjectsCollection.where('code', isEqualTo: searchTerm).get();

  //     if (querySnapshot.docs.isNotEmpty) {
  //       DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
  //       Map<String, dynamic> data =
  //           documentSnapshot.data() as Map<String, dynamic>;

  //       setState(() {
  //         searchResult = 'Subject Data: $data';
  //       });
  //     } else {
  //       setState(() {
  //         searchResult = 'Subject not found';
  //       });
  //     }
  //   } catch (e) {
  //     setState(() {
  //       searchResult = 'Error searching: $e';
  //     });
  //   }
  // }

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
            SizedBox(width: 0.0),
            Text('Course Reservation'),
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
                MaterialPageRoute(builder: (context) => notistu()),
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
                MaterialPageRoute(builder: (context) => historystu()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 150.0),
                Image.asset(
                  "assets/images/search3.png",
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 16.0), // ปรับระยะห่างข้างล่าง
                Text(
                  "CODE OF SUBJECTS",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5ca4a9),
                  ),
                ),
                SizedBox(height: 8.0), // ปรับระยะห่างข้างล่าง
                Text(
                  "( Ex: GE2100-101 )",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFed6a5a),
                  ),
                ),
                SizedBox(height: 16.0), // ปรับระยะห่างข้างล่าง
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF5ca4a9),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xFF5ca4a9),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => inforcouse()),
                                ));
                            // String searchTerm = _searchController.text;
                            // _performSearch(searchTerm);
                          },
                          icon: Icon(Icons.send),
                          color: Color(0xFFed6a5a),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0), // ปรับระยะห่างข้างล่าง
                Text(
                  searchResult,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
