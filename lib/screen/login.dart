import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/STDPage.dart';
import 'package:flutter_application_1/screen/depart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: LoginActivity(),
  ));
}

class User {
  final String email;
  final String password;
  final String role;

  User({required this.email, required this.password, required this.role});
}

class LoginActivity extends StatefulWidget {
  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(
      String email, String password, BuildContext context) async {
    final firestore = FirebaseFirestore.instance;
    final userRef = firestore.collection('Users');

    try {
      final userSnapshot = await userRef.where('email', isEqualTo: email).get();

      if (userSnapshot.docs.isEmpty) {
        throw Exception('User not found');
      }

      final userData = userSnapshot.docs.first.data() as Map<String, dynamic>;

      if (userData['password'] != password) {
        throw Exception('Incorrect password');
      }

      final user = User(
        email: email,
        password: password,
        role: (email == 'fst@gmail.com') ? 'Officer' : 'Students',
      );

      print('Login successful');
      print('User data: $user');

      if (user.role == 'Officer') {
        print('Logged in as Officer');
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Depart()),
        // );
      } else if (user.role == 'Students') {
        print('Logged in as Student');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => STPage()),
        );
      } else {
        throw Exception('Invalid user role');
      }
    } catch (error) {
      print('Login error: $error');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Error'),
            content: Text('$error'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text('Course reservation'),
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 0),
            Image.asset(
              "assets/images/user.png",
              width: 130,
              height: 130,
            ),
            SizedBox(height: 10.0),
            Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5ca4a9),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  await login(
                      emailController.text, passwordController.text, context);
                } catch (error) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Login Error'),
                        content: Text('$error'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                elevation: 8,
                shadowColor: Colors.grey,
                primary: Color(0xFF5ca4a9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
