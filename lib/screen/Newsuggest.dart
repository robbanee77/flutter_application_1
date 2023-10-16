import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Newsuggest extends StatefulWidget {
  const Newsuggest({Key? key}) : super(key: key);

  @override
  State<Newsuggest> createState() => _NewsuggestState();
}

class _NewsuggestState extends State<Newsuggest> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลนักศึกษา'),
      ),
      body: FutureBuilder(
        future: fetchDataYaer4(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
          } else {
            final data = snapshot.data as QuerySnapshot;
            final documents = data.docs;

            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final studentData =
                    documents[index].data() as Map<String, dynamic>;
                final code = studentData['Code'];
                final course = studentData['Course'];
                final credit = studentData['Credit'];
                final program = studentData['Program'];

                return ListTile(
                  title: Text('Code: $code'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Course: $course'),
                      Text('Credit: $credit'),
                      Text('Program: $program'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<QuerySnapshot> fetchDataYaer4() {
    return firestore
        .collection('year4')
        .where('Code', isGreaterThanOrEqualTo: '62')
        .get();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Newsuggest());
}
