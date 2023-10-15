import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<String> programStatus = [];

  @override
  void initState() {
    super.initState();
    fetchProgramStatus();
  }

  Future<void> fetchProgramStatus() async {
    try {
      final bookingCollection =
          FirebaseFirestore.instance.collection("booking");
      final confirmCollection =
          FirebaseFirestore.instance.collection("confirm");
      final cancelCollection = FirebaseFirestore.instance.collection("cancel");

      final bookingSnapshot = await bookingCollection.get();
      final confirmSnapshot = await confirmCollection.get();
      final cancelSnapshot = await cancelCollection.get();

      final List<String> statuses = [];

      for (var doc in bookingSnapshot.docs) {
        // เราสมมติว่า "program" อยู่ในเขตข้อมูล "name"
        final programName = doc.data()['name'];
        statuses.add("$programName: The request has been sent");
      }

      for (var doc in confirmSnapshot.docs) {
        // เราสมมติว่า "program" อยู่ในเขตข้อมูล "name"
        final programName = doc.data()['name'];
        statuses.add("$programName: Confirm/Cancel");
      }

      for (var doc in cancelSnapshot.docs) {
        // เราสมมติว่า "program" อยู่ในเขตข้อมูล "name"
        final programName = doc.data()['name'];
        statuses.add("$programName: Confirm/Cancel");
      }

      setState(() {
        programStatus = statuses;
      });
    } catch (e) {
      print("Error fetching program status: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Program Status"),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: programStatus
            .map((status) => Container(
                  width: 250,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: status.contains("The request has been sent")
                        ? Colors.green
                        : Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      status,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: StatusScreen(),
    ));
