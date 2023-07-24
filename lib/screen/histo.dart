import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class histoty extends StatefulWidget {
  const histoty({super.key});

  @override
  State<histoty> createState() => _histotyState();
}

class _histotyState extends State<histoty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text('History')
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
      ),
    );
  }
}
