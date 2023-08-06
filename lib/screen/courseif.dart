import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class courseif extends StatefulWidget {
  const courseif({super.key});

  @override
  State<courseif> createState() => _courseifState();
}

class _courseifState extends State<courseif> {
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
            Text('Notifications'),
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
      ),
    );
  }
}
