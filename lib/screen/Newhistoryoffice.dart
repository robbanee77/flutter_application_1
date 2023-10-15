import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/Newrequest.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(home: Newhistoryoffice()));
}

class Newhistoryoffice extends StatefulWidget {
  const Newhistoryoffice({Key? key}) : super(key: key);

  @override
  State<Newhistoryoffice> createState() => _HistoryState();
}

class _HistoryState extends State<Newhistoryoffice> {
  int selectedIndex = 0;
  String displayText = '';
  bool showLine = false;
  List<Map<String, dynamic>> confirmData = [];

  @override
  void initState() {
    super.initState();
    if (selectedIndex == 0) {
      getData('confirm');
    } else {
      getData('cancel');
    }
  }

  Future<void> getData(String collectionName) async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(collectionName).get();

      confirmData.clear();

      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        data['documentId'] = document.id;
        confirmData.add(data);
      }

      setState(() {
        displayText = 'Data from Firestore:\n';
        for (var data in confirmData) {
          displayText += ' ${data['code']}, ${data['name']}, ${data['data']}\n';
        }
        showLine = true;
      });
    } catch (e) {
      print('เกิดข้อผิดพลาดในการดึงข้อมูล: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe6ebe0),
      appBar: AppBar(
        backgroundColor: Color(0xFF5ca4a9),
        title: Text('History'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 45, left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5ca4a9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            ToggleSwitch(
              minWidth: 100.0,
              initialLabelIndex: selectedIndex,
              labels: ['Confirm', 'Cancel'],
              activeFgColor: Colors.white,
              inactiveFgColor: Colors.white,
              onToggle: (index) {
                setState(() {
                  selectedIndex = index!;
                  if (selectedIndex == 0) {
                    showLine = false;
                    getData('confirm');
                  } else if (selectedIndex == 1) {
                    showLine = false;
                    getData('cancel');
                  }
                });
              },
            ),
            SizedBox(height: 20),
            if (showLine)
              ListView.builder(
                shrinkWrap: true,
                itemCount: confirmData.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = confirmData[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                          '${data['code']}, ${data['name']}, ${data['data']}'),
                      trailing: selectedIndex == 1
                          ? ElevatedButton(
                              onPressed: () {
                                if (selectedIndex == 1) {
                                  moveDataToBooking(data);
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              child: Text("Edit",
                                  style: TextStyle(color: Colors.white)),
                            )
                          : null,
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<void> moveDataToBooking(Map<String, dynamic> data) async {
    try {
      await FirebaseFirestore.instance
          .collection('cancel')
          .doc(data['documentId'])
          .delete();
      await FirebaseFirestore.instance.collection('booking').add(data);
      getData('cancel');
    } catch (e) {
      print('เกิดข้อผิดพลาดในการย้ายข้อมูล: $e');
    }
  }
}
