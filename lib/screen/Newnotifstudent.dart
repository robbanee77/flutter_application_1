import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Newnotifstudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลการยืนยันและยกเลิก'),
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('confirm').snapshots(),
          builder: (context, confirmSnapshot) {
            if (confirmSnapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            final numberOfConfirmations = confirmSnapshot.data!.docs.length;

            return StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('cancel').snapshots(),
              builder: (context, cancelSnapshot) {
                if (cancelSnapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                final numberOfCancellations = cancelSnapshot.data!.docs.length;

                return ListView.builder(
                  itemCount: numberOfConfirmations + numberOfCancellations,
                  itemBuilder: (context, index) {
                    if (index < numberOfConfirmations) {
                      return Text('Your information has been verified.');
                    } else {
                      return Text('Your information has been canceled.');
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
