import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/inforcouse.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();

  Future<void> fetchDataFromFirestore(
      BuildContext context, String searchTerm) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Subjects')
          .where('Code', isEqualTo: searchTerm)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // ดึงข้อมูลจาก Firestore
        Map<String, dynamic> data =
            querySnapshot.docs.first.data() as Map<String, dynamic>;

        // ส่งข้อมูลไปยังหน้า inforcouse
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => inforcouse(
              data: data,
            ),
          ),
        );
      } else {
        // ไม่พบข้อมูล
        print('No data found for code: $searchTerm');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe6ebe0),
      appBar: AppBar(
        title: Text('Course Reservation'),
        backgroundColor: Color(0xFF5ca4a9),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // นำผู้ใช้ไปยังหน้าแจ้งเตือน (notistu)
            },
          ),
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              // นำผู้ใช้ไปยังหน้าประวัติ (historystu)
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
                SizedBox(height: 0.0),
                Text(
                  "CODE OF SUBJECTS",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5ca4a9),
                  ),
                ),
                SizedBox(height: 0.0),
                Text(
                  "( Ex: GE2100-101 )",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFed6a5a),
                  ),
                ),
                SizedBox(height: 25.0),
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
                            String searchTerm = _searchController.text;
                            print('Course: $searchTerm');

                            // เรียกใช้ฟังก์ชันสำหรับดึงข้อมูลจาก Firebase Firestore
                            fetchDataFromFirestore(context, searchTerm);
                          },
                          icon: Icon(Icons.send),
                          color: Color(0xFFed6a5a),
                        ),
                      ],
                    ),
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
