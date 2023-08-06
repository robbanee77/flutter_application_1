import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/histostu.dart';
import 'package:flutter_application_1/screen/notistu.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();

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
            Text('Course resevation'),
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
              // ดักเหตุการณ์เมื่อกดปุ่ม Info ที่อยู่ฝั่งซ้ายของ AppBar
              // คุณสามารถใส่โค้ดที่คุณต้องการทำเมื่อกดปุ่มนี้ได้ที่นี่
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 150.0), // ปรับความสูงได้ตามต้องการ
              Image.asset(
                "assets/images/search2.png",
                width: 150,
                height: 150,
              ),
              SizedBox(height: 0.0), // ปรับความสูงได้ตามต้องการ
              Text(
                "CODE OF SUBJECTS",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5ca4a9),
                ),
              ),
              SizedBox(height: 0.0), // ปรับความสูงได้ตามต้องการ
              Text(
                "( Ex: GE2100-101 )",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5ca4a9),
                ),
              ),
              SizedBox(height: 25.0), // ปรับความสูงได้ตามต้องการ
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
                          // Perform search logic here
                          // You can use the entered search term to filter your data or perform any search operation

                          // For demonstration purposes, let's print the search term

                          // ดำเนินการค้นหาตรรกะที่นี่
                          // คุณสามารถใช้ข้อความค้นหาที่ป้อนเพื่อกรองข้อมูลของคุณหรือดำเนินการค้นหาใดๆ ก็ได้

                          // เพื่อการสาธิต ลองพิมพ์คำค้นหา
                          print('Search Term: $searchTerm');
                        },
                        icon: Icon(Icons.send),
                        color: Color(0xFF5ca4a9),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
