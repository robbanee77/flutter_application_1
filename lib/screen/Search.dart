import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/screen/LogoutPage.dart';
import 'package:flutter_application_1/screen/Newhistorystudent.dart';
import 'package:flutter_application_1/screen/Newnotifstudent.dart';
import 'package:flutter_application_1/screen/histostu.dart';
import 'package:flutter_application_1/screen/inforcouse.dart';
import 'package:flutter_application_1/screen/notistu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Search());
}

class Search extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  State<Search> createState() => _MyAppState();
}

class _MyAppState extends State<Search> {
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

  searchResultList() async {
    var showResults = [];
    var searchResults = [];

    if (_searchController.text != "") {
      for (var subjectSnapshot in _allResults) {
        var code = subjectSnapshot['Code'].toString().toLowerCase();
        if (code.contains(_searchController.text.toLowerCase())) {
          searchResults.add(subjectSnapshot);
        }
      }
    } else {
      searchResults = List.from(_allResults);
    }

    final user = widget._auth.currentUser;
    if (user != null) {
      final userSnapshot =
          await widget._firestore.collection('Users1').doc(user.uid).get();
      if (userSnapshot.exists) {
        final userCodes = userSnapshot['codes'];
        var subjectsToShow = [];

        if (userCodes.startsWith('65')) {
          subjectsToShow = [
            "IT2301-101",
            "IT2301-102",
            "IT2301-201",
            "IT2301-202",
            "IT2301-301",
            "DS2303-301",
            "DS2303-302",
            "DS2303-303",
            "DS2303-304",
            "DS2303-305",
            "RD2303-301",
            "RD2303-302",
            "RD2303-303",
            "RD2303-304",
            "RD2303-305",
          ];
        } else if (userCodes.startsWith('64')) {
          subjectsToShow = [
            "IT2301-103",
            "IT2301-203",
            "IT2301-302",
            "IT2301-303",
            "IT2301-307",
            "DS2303-306",
            "DS2303-307",
            "DS2303-308",
            "DS2303-309",
            "DS2303-310",
            "RD2303-306",
            "RD2303-307",
            "RD2303-308",
            "RD2303-309",
            "RD2303-310",
          ];
        } else if (userCodes.startsWith('63')) {
          subjectsToShow = [
            "IT2301-304",
            "IT2301-308",
            "IT2301-311",
            "IT2301-313",
            "IT2301-319",
            "DS2303-311",
            "DS2303-312",
            "DS2303-313",
            "DS2303-314",
            "DS2303-315",
            "RD2303-311",
            "RD2303-312",
            "RD2303-313",
            "RD2303-314",
            "RD2303-315",
          ];
        } else if (userCodes.startsWith('62')) {
          subjectsToShow = [
            "IT2301-204",
            "IT2301-315",
            "IT2301-317",
            "IT2301-320",
            "IT2301-322",
            "DS2303-316",
            "DS2303-317",
            "DS2303-318",
            "DS2303-319",
            "DS2303-320",
            "RD2303-316",
            "RD2303-317",
            "RD2303-318",
            "RD2303-319",
            "RD2303-320",
          ];
        }

        for (var code in subjectsToShow) {
          var subject = searchResults.firstWhere(
            (subjectSnapshot) => subjectSnapshot['Code'] == code,
            orElse: () => null,
          );
          if (subject != null) {
            showResults.add(subject);
          }
        }

        // เพิ่มวิชาอื่น ๆ ที่ไม่ตรงกับรหัสที่ระบุไว้
        for (var subjectSnapshot in searchResults) {
          var code = subjectSnapshot['Code'];
          if (!subjectsToShow.contains(code)) {
            showResults.add(subjectSnapshot);
          }
        }
      }
    }

    setState(() {
      _resultList = showResults;
    });
  }

  getClientStream() async {
    final user = widget._auth.currentUser;
    if (user != null) {
      final userSnapshot =
          await widget._firestore.collection('Users1').doc(user.uid).get();
      if (userSnapshot.exists) {
        final userCodes = userSnapshot['codes'];
        if (userCodes.startsWith('65') ||
            userCodes.startsWith('64') ||
            userCodes.startsWith('63') ||
            userCodes.startsWith('62')) {
          var data = await widget._firestore
              .collection('Subjects')
              .orderBy('Code')
              .get();

          setState(() {
            _allResults = data.docs;
          });

          searchResultList();
        }
      }
    }
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
    // List<String> userYear = ["1st year", "2nd year", "2nd year", "4th year"];
    // // สร้างตัวแปรเพื่อเก็บข้อความปีการศึกษา
    // String userCodes = "";
    // if (userCodes.startsWith('65')) {
    //   userYear = "1st year" as List<String>;
    // } else if (userCodes.startsWith('64')) {
    //   userYear = "2nd year" as List<String>;
    // } else if (userCodes.startsWith('63')) {
    //   userYear = "2nd year" as List<String>;
    // } else if (userCodes.startsWith('62')) {
    //   userYear = "4th year" as List<String>;
    // }
    return MaterialApp(
      title: 'Course',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
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
                  MaterialPageRoute(builder: (context) => NewNotifstudent()),
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
                  MaterialPageRoute(builder: (context) => NewHistoryStudent()),
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
              child: CupertinoSearchTextField(
                controller: _searchController,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'This is 15 recommended subjects for you',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5ca4a9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  Map<String, dynamic> resultData =
                      _resultList[index].data() as Map<String, dynamic>;
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(resultData['Code']),
                        subtitle: Text(resultData['Program']),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultDetailPage(
                                resultData: resultData,
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        color: Colors.grey, // สีของเส้น
                        height: 1.0, // ความสูงของเส้น
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.0), // ขอบซ้ายและขวา
                      ),
                    ],
                  );
                },
                childCount: _resultList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
