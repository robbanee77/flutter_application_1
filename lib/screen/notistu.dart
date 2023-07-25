import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class notistu extends StatefulWidget {
  const notistu({super.key});

  @override
  State<notistu> createState() => _notistuState();
}

class _notistuState extends State<notistu> {
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
            Text('Notifications')
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
      ),
    );
  }
}
