import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/screen/histostu.dart';
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
      title: 'Course Reservation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WillPopScope(
        onWillPop: () async {
          // Handle back button press here
          // You can navigate back to the previous screen or handle it as needed
          return true; // Return true to allow back navigation, false to block it
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
                SizedBox(width: 3), // Add spacing here
                Text('Course Reservation'),
              ],
            ),
            backgroundColor: Color(0xFF5ca4a9),
            leading: IconButton(
              icon: Icon(Icons.arrow_back), // Add a back button icon
              onPressed: () {
                Navigator.pop(
                    context); // Navigate back when the back button is pressed
              },
            ),
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
          body: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: SizedBox(height: 10), // Add spacing here
              ),
              SliverToBoxAdapter(
                child: CupertinoSearchTextField(
                  controller: _searchController,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title: Text(_resultList[index]['Code']),
                      subtitle: Text(_resultList[index]['Course']),
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
