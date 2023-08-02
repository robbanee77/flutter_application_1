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
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5ca4a9),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Color(0xFF5ca4a9), // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5ca4a9),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Faculty of Science and Technology',
                      style: TextStyle(
                        fontSize:
                            20, // Adjust the font size for "There is" here
                        color: Color(0xFFed6a5a),
                      ),
                    ),
                    TextSpan(
                      text:
                          ' Information security course already reserved couse to you',
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Color(0xFF5ca4a9), // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5ca4a9),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Faculty of Science and Technology',
                      style: TextStyle(
                        fontSize:
                            20, // Adjust the font size for "There is" here
                        color: Color(0xFFed6a5a),
                      ),
                    ),
                    TextSpan(
                      text:
                          '   Web Technology course already reserved couse to you',
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Color(0xFF5ca4a9), // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5ca4a9),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Faculty of Science and Technology',
                      style: TextStyle(
                        fontSize:
                            20, // Adjust the font size for "There is" here
                        color: Color(0xFFed6a5a),
                      ),
                    ),
                    TextSpan(
                      text:
                          ' Information Technology Services Management course already reserved couse to you.',
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Color(0xFF5ca4a9), // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5ca4a9),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Faculty of Science and Technology',
                      style: TextStyle(
                        fontSize:
                            20, // Adjust the font size for "There is" here
                        color: Color(0xFFed6a5a),
                      ),
                    ),
                    TextSpan(
                      text:
                          ' Computer Programming course already reserved couse to you.',
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
              color: Color(0xFF5ca4a9), // สีของเส้น (ปรับตามที่คุณต้องการ)
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            // Container(
            //   padding:
            //       EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
            //   child: RichText(
            //     text: TextSpan(
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold,
            //         color: Color(0xFF5ca4a9),
            //       ),
            //       children: <TextSpan>[
            //         TextSpan(
            //           text: '611437710',
            //           style: TextStyle(
            //             fontSize:
            //                 20, // Adjust the font size for "There is" here
            //             color: Color(0xFFed6a5a),
            //           ),
            //         ),
            //         TextSpan(
            //           text:
            //               ' There is a request for reservation of the Network I course.',
            //         ),
            //       ],
            //     ),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            // Container(
            //   height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
            //   color: Color(0xFFed6a5a), // สีของเส้น (ปรับตามที่คุณต้องการ)
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            // ),
            // Container(
            //   padding:
            //       EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
            //   child: RichText(
            //     text: TextSpan(
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold,
            //         color: Color(0xFF5ca4a9),
            //       ),
            //       children: <TextSpan>[
            //         TextSpan(
            //           text: '631431453',
            //           style: TextStyle(
            //             fontSize:
            //                 20, // Adjust the font size for "There is" here
            //             color: Color(0xFFed6a5a),
            //           ),
            //         ),
            //         TextSpan(
            //           text:
            //               ' There is a request for reservation of the Computer Platform Technology course.',
            //         ),
            //       ],
            //     ),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            // Container(
            //   height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
            //   color: Color(0xFFed6a5a), // สีของเส้น (ปรับตามที่คุณต้องการ)
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            // ),
            // Container(
            //   padding:
            //       EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
            //   child: RichText(
            //     text: TextSpan(
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold,
            //         color: Color(0xFF5ca4a9),
            //       ),
            //       children: <TextSpan>[
            //         TextSpan(
            //           text: '631434533',
            //           style: TextStyle(
            //             fontSize:
            //                 20, // Adjust the font size for "There is" here
            //             color: Color(0xFFed6a5a),
            //           ),
            //         ),
            //         TextSpan(
            //           text:
            //               ' There is a request for reservation of the Software Development Process II course.',
            //         ),
            //       ],
            //     ),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            // Container(
            //   height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
            //   color: Color(0xFFed6a5a), // สีของเส้น (ปรับตามที่คุณต้องการ)
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            // ),
            // Container(
            //   padding:
            //       EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
            //   child: RichText(
            //     text: TextSpan(
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold,
            //         color: Color(0xFF5ca4a9),
            //       ),
            //       children: <TextSpan>[
            //         TextSpan(
            //           text: '621433421',
            //           style: TextStyle(
            //             fontSize:
            //                 20, // Adjust the font size for "There is" here
            //             color: Color(0xFFed6a5a),
            //           ),
            //         ),
            //         TextSpan(
            //           text:
            //               ' There is a request for reservation of the Social Issues and Ethics for IT Professional course.',
            //         ),
            //       ],
            //     ),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            // Container(
            //   height: 2, // ความสูงของเส้น (ปรับตามที่คุณต้องการ)
            //   color: Color(0xFFed6a5a), // สีของเส้น (ปรับตามที่คุณต้องการ)
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            // ),
          ],
        ),
      ),
    );
  }
}
