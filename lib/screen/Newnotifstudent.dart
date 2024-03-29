import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screen/LogoutPage.dart';
import 'package:flutter_application_1/screen/Newhistorystudent.dart';

class NewNotifstudent extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe6ebe0),
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Image.asset(
                'assets/images/pro.png',
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 8),
              Text(' Course'),
            ],
          ),
        ),
        backgroundColor: Color(0xFF5ca4a9),
        actions: [
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
      body: Column(
        children: [
          SizedBox(width: 50),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Center the text and image horizontally
              children: [
                Text(
                  'NOTIFICATIONS',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5ca4a9),
                  ),
                ),
                SizedBox(width: 10), // Add spacing between text and image
                Image.asset(
                  'assets/images/noti4.png', // File path to your image
                  width: 40, // Adjust image size as needed
                  height: 40,
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<User?>(
              future: _auth.authStateChanges().first,
              builder: (context, userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (!userSnapshot.hasData) {
                  // User is not logged in, handle this case as needed
                  return Center(
                    child: Text("Please log in to view notifications."),
                  );
                }

                final User? user = userSnapshot.data;
                final String userEmail = user?.email ?? ""; // Get user's email

                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('confirm')
                      .where('email', isEqualTo: userEmail)
                      .snapshots(),
                  builder: (context, confirmSnapshot) {
                    if (confirmSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    final confirmDocuments = confirmSnapshot.data!.docs;

                    return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('cancel')
                          .where('email', isEqualTo: userEmail)
                          .snapshots(),
                      builder: (context, cancelSnapshot) {
                        if (cancelSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        final cancelDocuments = cancelSnapshot.data!.docs;

                        if (confirmDocuments.isEmpty &&
                            cancelDocuments.isEmpty) {
                          return Center(
                            child: Text(
                              "No notifications",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5ca4a9),
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount:
                              confirmDocuments.length + cancelDocuments.length,
                          itemBuilder: (context, index) {
                            if (index < confirmDocuments.length) {
                              return _buildDocumentBlock(
                                  'Your information has been verified.');
                            } else {
                              return _buildDocumentBlock(
                                  'Your information has been canceled.');
                            }
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentBlock(String text) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(text),
    );
  }
}
