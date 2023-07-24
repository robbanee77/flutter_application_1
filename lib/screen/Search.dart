import 'package:flutter/material.dart';

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
              'assets/images/basket.png',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8),
            Text('Course resevation'),
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 0.0), // ปรับความสูงได้ตามต้องการ
              Image.asset(
                "assets/images/logo.png",
                width: 250,
                height: 250,
              ),
              SizedBox(height: 40.0), // ปรับความสูงได้ตามต้องการ
              Text(
                "Search code of subject",
                style: TextStyle(
                  fontSize: 25.0,
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
