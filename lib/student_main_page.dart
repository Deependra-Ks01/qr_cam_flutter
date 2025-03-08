// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'AttendanceStatus.dart'; // Import AttendanceStatusPage
// import 'GenerateQueryPage.dart'; // Import GenerateQueryPage
// import 'login_page_Stu.dart'; // Import the student login page
//
// class StudentMainPage extends StatefulWidget {
//   const StudentMainPage({super.key});
//
//   @override
//   State<StudentMainPage> createState() => _StudentMainPageState();
// }
//
// class _StudentMainPageState extends State<StudentMainPage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text('CLASSLTIC - Student'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.green,
//               ),
//               child: Text(
//                 'STUDENT',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Home'),
//               onTap: () {
//                 Navigator.pop(context);
//                 _showSnackBar("Navigated to Home");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.analytics_outlined),
//               title: Text('Attendance Status'),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => AttendanceStatusPage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.question_answer_outlined),
//               title: Text('Generate Query'),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => GenerateQueryPage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout_outlined),
//               title: Text('Log Out'),
//               onTap: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => StudentLoginPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('Welcome to the Student Dashboard!'),
//           SizedBox(height: 20),
//           ElevatedButton.icon(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => QRViewPage()),
//               );
//             },
//             icon: Icon(Icons.qr_code_scanner),
//             label: Text('Scan QR Code'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }
// }
//
// class QRViewPage extends StatefulWidget {
//   @override
//   _QRViewPageState createState() => _QRViewPageState();
// }
//
// class _QRViewPageState extends State<QRViewPage> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Scan QR Code")),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       Navigator.pop(context, scanData.code);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Scanned: ${scanData.code}")),
//       );
//     });
//   }
// }





import 'package:flutter/material.dart';
import 'AttendanceStatus.dart'; // Import AttendanceStatusPage
import 'GenerateQueryPage.dart'; // Import GenerateQueryPage
import 'login_page_Stu.dart'; // Import the student login page

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({super.key});

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

class _StudentMainPageState extends State<StudentMainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('CLASSLTIC - Student'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'STUDENT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar("Navigated to Home");
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics_outlined),
              title: Text('Attendance Status'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AttendanceStatusPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer_outlined),
              title: Text('Generate Query'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GenerateQueryPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text('Log Out'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => StudentLoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to the Student Dashboard!'),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
