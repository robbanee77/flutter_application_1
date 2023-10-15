import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Newstatus(),
  ));
}

class Newstatus extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<Newstatus> {
  List<String> programStatus = [];
  int currentStep = 0;

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

      statuses.add("1 The request has been sent");
      statuses.add("2 InProgress");
      statuses.add("3 Confirm/Cancel");

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
      body: programStatus.isNotEmpty
          ? Stepper(
              currentStep: currentStep,
              onStepTapped: (step) {
                setState(() {
                  currentStep = step;
                });
              },
              steps: programStatus
                  .asMap()
                  .entries
                  .map(
                    (entry) => Step(
                      title: Text("Step ${entry.key}"),
                      content: Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: entry.value
                                  .contains("The request has been sent")
                              ? Colors.green
                              : entry.value.contains("InProgress")
                                  ? Colors.blue
                                  : Colors
                                      .red, // Change color for Confirm/Cancel
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            entry.value,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
