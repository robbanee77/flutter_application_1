import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; //เพื่อเรียกใช้ widget ต้องการเเสดงหน้าจอสวยๆแทน console
import 'package:flutter_application_1/screen/confirm.dart';
import 'package:flutter_application_1/screen/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/screen/successfull.dart';
import 'package:flutter_application_1/screen/login.dart';
import 'package:flutter_application_1/widgets/searches_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyWidget());
}

//สร้าง Widget
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My app",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: homescreen());
  }
}
