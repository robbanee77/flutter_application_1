// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screen/components/my_timeline_tile.dart';
// import 'package:timeline_tile/timeline_tile.dart';

// import 'histostu.dart';
// import 'notistu.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFe6ebe0),
//       appBar: AppBar(
//           title: Row(
//             children: [
//               Image.asset('assets/images/pro.png',
//                   width: 30, height: 30, fit: BoxFit.contain),
//               SizedBox(width: 8),
//               Text('Status')
//             ],
//           ),
//           backgroundColor: Color(0xFF5ca4a9),
//           actions: [
//             IconButton(
//               icon: Image.asset(
//                 'assets/images/noti1.png',
//                 width: 30,
//                 height: 30,
//                 fit: BoxFit.contain,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => notistu()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: Image.asset(
//                 'assets/images/histo.png',
//                 width: 30,
//                 height: 30,
//                 fit: BoxFit.contain,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => historystu()),
//                 );
//                 // ดักเหตุการณ์เมื่อกดปุ่ม Info ที่อยู่ฝั่งซ้ายของ AppBar
//                 // คุณสามารถใส่โค้ดที่คุณต้องการทำเมื่อกดปุ่มนี้ได้ที่นี่
//               },
//             ),
//           ]),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 50.0),
//         child: ListView(
//           children: const [
//             // First timeline
//             MyTimeLineTile(
//               isFirst: true,
//               isLast: false,
//               isPast: true,
//               eventCard: Text("Received the matter"),
//             ),

//             // Second timeline
//             MyTimeLineTile(
//               isFirst: false,
//               isLast: false,
//               isPast: true,
//               eventCard: Text("In progress"),
//             ),

//             // Third timeline
//             MyTimeLineTile(
//               isFirst: false,
//               isLast: true,
//               isPast: false,
//               eventCard: Text("Confirm"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
