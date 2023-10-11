import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/screen/LogoutPage.dart';
import 'package:flutter_application_1/screen/Newnotifstudent.dart';
import 'package:flutter_application_1/screen/histostu.dart';
import 'package:flutter_application_1/screen/inforcouse.dart';
import 'package:flutter_application_1/screen/notistu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List _allResults = [];
  List _resultList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged() {
    print(_searchController.text);
    searchResultList();
  }

  searchResultList() {
    var showResults = [];
    if (_searchController.text != "") {
      for (var clientSnapshot in _allResults) {
        var name = clientSnapshot['Code'].toString().toLowerCase();
        if (name.contains(_searchController.text.toLowerCase())) {
          showResults.add(clientSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultList = showResults;
    });
  }

  getClientStream() async {
    var data = await FirebaseFirestore.instance
        .collection('Subjects')
        .orderBy('Code')
        .get();

    setState(() {
      _allResults = data.docs;
    });
    searchResultList();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getClientStream();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
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
                Text('Course '),
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
                    MaterialPageRoute(builder: (context) => Newnotifstudent()),
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
              IconButton(
                icon: Image.asset(
                  'assets/images/logout.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogoutPage()),
                  );
                },
              ),
            ],
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              SliverToBoxAdapter(
                child: CupertinoSearchTextField(
                  controller: _searchController,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    // ใช้ .data() เพื่อแปลง _JsonQueryDocumentSnapshot เป็น Map
                    Map<String, dynamic> resultData =
                        _resultList[index].data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text(resultData['Code']),
                      subtitle: Text(resultData['Program']),
                      onTap: () {
                        // เมื่อคลิกที่ ListTile ในรายการผลลัพธ์
                        // ให้เรียกไปยังหน้ารายละเอียด และส่งข้อมูลที่เลือกไปด้วย
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultDetailPage(
                              resultData:
                                  resultData, // ส่งข้อมูลผลลัพธ์ที่ถูกเลือก
                            ),
                          ),
                        );
                      },
                    );
                  },
                  childCount: _resultList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
