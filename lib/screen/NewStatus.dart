import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewStatusStudent extends StatefulWidget {
  @override
  _StatusUpdatePageState createState() => _StatusUpdatePageState();
}

class _StatusUpdatePageState extends State<NewStatusStudent> {
  int currentStep = 0;
  List<Step> steps = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    steps = [
      Step(
        title: Text('The request has been sent'),
        state: StepState.editing,
        content: Text('This step is for "The request has been sent" status.'),
      ),
      Step(
        title: Text('Confirm/Cancel'),
        state: StepState.editing,
        content: Text('This step is for "Confirm/Cancel" status.'),
      ),
    ];

    // Replace 'user.Id' with the actual user's ID that you want to track
    final userId = 'your_user.id';

    // Track status in Cloud Firestore
    _firestore.collection("booking").doc(userId).snapshots().listen((snapshot) {
      if (snapshot.exists) {
        String status = snapshot.data()?['status'];

        if (status == "request") {
          setState(() {
            steps[0] = Step(
              title: Text('The request has been sent'),
              state: StepState.complete,
              content:
                  Text('This step is for "The request has been sent" status.'),
            );
          });
        } else if (status == "Confirm" || status == "Cancel") {
          setState(() {
            steps[1] = Step(
              title: Text('Confirm/Cancel'),
              state: StepState.complete,
              content: Text('This step is for "Confirm/Cancel" status.'),
            );
          });
        }
      }
    });

    currentStep = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("STATUS"),
      ),
      body: Stepper(
        currentStep: currentStep,
        steps: steps,
        onStepTapped: (step) {
          setState(() {
            currentStep = step;
          });
        },
      ),
    );
  }
}
