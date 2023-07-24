import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class notioff extends StatefulWidget {
  const notioff({super.key});

  @override
  State<notioff> createState() => _notioffState();
}

class _notioffState extends State<notioff> {
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
            Text('Notification')
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
      ),
    );
  }
}
