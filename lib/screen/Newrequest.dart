import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(Newrequest());
}

class Newrequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายชื่อผู้จอง'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('booking').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('เกิดข้อผิดพลาด: ${snapshot.error}'),
            );
          } else {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return ListTile(
                  title: Text('Code: ${data['code']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${data['name']}'),
                      Text('Email: ${data['email']}'),
                      Text('Subjects: ${data['data']}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('booking')
                              .doc(document.id)
                              .update({
                            'confirmed': true,
                          });

                          await FirebaseFirestore.instance
                              .collection('confirm')
                              .add({
                            'code': data['code'],
                            'name': data['name'],
                            'email': data['email'],
                            'data': data['data'],
                          });

                          await FirebaseFirestore.instance
                              .collection('booking')
                              .doc(document.id)
                              .delete();

                          // แจ้งเตือนวิชาที่ถูกยืนยัน
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('วิชา ${data['data']} ถูกยืนยันแล้ว'),
                            ),
                          );
                        },
                        child: Text('Confirm'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('cancel')
                              .add({
                            'code': data['code'],
                            'name': data['name'],
                            'email': data['email'],
                            'data': data['data'],
                          });

                          await FirebaseFirestore.instance
                              .collection('booking')
                              .doc(document.id)
                              .delete();
                        },
                        child: Text('Cancel'),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
