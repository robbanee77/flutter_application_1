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
            "IT2301-103",
            "IT2301-201",
            "DS2303-335",
            "DS2303-334",
            "RD2303-349",
            "RD2303-351",
          ];
        } else if (userCodes.startsWith('64')) {
          subjectsToShow = [
            "IT2301-301",
            "IT2301-303",
            "DS2303-332",
            "DS2303-331",
            "RD2303-325",
            "RD2303-327",
          ];
        } else if (userCodes.startsWith('63')) {
          subjectsToShow = [
            "IT2301-311",
            "IT2301-313",
            "DS2303-329",
            "DS2303-327",
            "RD2303-310",
            "RD2303-313",
          ];
        } else if (userCodes.startsWith('62')) {
          subjectsToShow = [
            "IT2301-317",
            "IT2301-204",
            "DS2303-305",
            "DS2303-303",
            "RD2303-301",
            "RD2303-302",
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
                  Text(
                    'Recommended subjects for you',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                  return ListTile(
                    title: Text(resultData['Code']),
                    subtitle: Text(resultData['Program']),
                    onTap: () {
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
    );
  }
}
