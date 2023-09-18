import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResultDetailPage extends StatelessWidget {
  final Map<String, dynamic> resultData;

  ResultDetailPage({required this.resultData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Code: ${resultData['Code']}'),
            Text('Program: ${resultData['Program']}'),
            Text('Course: ${resultData['Course']}'),
            Text('Faculty: ${resultData['Faculty']}'),
            Text('Credit: ${resultData['Credit']}'),
            Text('Course description: ${resultData['Course description']}'),
            // เพิ่มข้อมูลอื่น ๆ ที่คุณต้องการแสดง
          ],
        ),
      ),
    );
  }
}
