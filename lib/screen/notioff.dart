import 'package:flutter/material.dart';

class notioff extends StatefulWidget {
  const notioff({Key? key});

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
            Text('Notifications')
          ],
        ),
        backgroundColor: Color(0xFF5ca4a9),
      ),
      body: SingleChildScrollView(
        // ใช้ SingleChildScrollView แทน Column เพื่อให้สามารถเลื่อนเนื้อหาได้
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 45, bottom: 18, left: 20, right: 20),
              child: Text(
                'Notification',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Colors.grey, // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
              child: Text(
                'There is a request for reservation of the information security course.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5ca4a9),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Colors.grey, // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            // ทำต่อไปในส่วนอื่น ๆ ของ body ตามที่คุณต้องการ
            Container(
              padding:
                  EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
              child: Text(
                'There is a request for reservation of the information security course.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5ca4a9),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Colors.grey, // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
              child: Text(
                'There is a request for reservation of the information security course.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5ca4a9),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Colors.grey, // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
              child: Text(
                'There is a request for reservation of the information security course.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5ca4a9),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Colors.grey, // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
              child: Text(
                'There is a request for reservation of the information security course.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5ca4a9),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Colors.grey, // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
              child: Text(
                'There is a request for reservation of the information security course.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5ca4a9),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Colors.grey, // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
              child: Text(
                'There is a request for reservation of the information security course.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5ca4a9),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Colors.grey, // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
              child: Text(
                'There is a request for reservation of the information security course.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5ca4a9),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Colors.grey, // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
          ],
        ),
      ),
    );
  }
}
