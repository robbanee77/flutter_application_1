import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'depart.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: officerState(),
    );
  }
}

class officerState extends StatefulWidget {
  @override
  _officerState createState() => _officerState();
}

class _officerState extends State<officerState> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // late String _email, _password;
  // final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe6ebe0),
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/basket.png',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8),
            Text('Course resevation'),
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/ceo2.png",
                width: 130,
                height: 130,
              ),
              Text(
                'Officer Login',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(
                      0xFF5ca4a9), // กำหนดสีให้กับตัวหนังสือ 'Officer Login'
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                // keyboardType: TextInputType.emailAddress,
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Officer e-mail ',
                  labelStyle: TextStyle(
                      color: Color(0xFF5ca4a9)), // กำหนดสีให้กับ label
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF5ca4a9)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                // obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelStyle: TextStyle(
                      color: Color(0xFF5ca4a9)), // กำหนดสีให้กับ label
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF5ca4a9)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                          email: _usernameController.text,
                          password: _passwordController.text,
                        );

                        // ล็อกอินสำเร็จ สามารถดำเนินการต่อไปได้
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Depart()),
                        );
                      } catch (e) {
                        // เกิดข้อผิดพลาดในการล็อกอิน
                        print('Error logging in: $e');

                        // เช็คว่า error code เป็น 'wrong-password' (อีเมลไม่ถูกต้อง)
                        if (e.hashCode == 'wrong-password') {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Login Error'),
                                content:
                                    Text('Email or password is incorrect.'),
                                actions: [
                                  TextButton(
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
            ],
          ),
        ),
      ),
    );
  }
}
