import 'dart:math';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'google_sheets_api.dart'; // Import your Google Sheets API file

class GenerateQRPage extends StatefulWidget {
  const GenerateQRPage({super.key});

  @override
  State<GenerateQRPage> createState() => _GenerateQRPageState();
}

class _GenerateQRPageState extends State<GenerateQRPage> {
  String _qrData = _generateRandomNumber();

  /// Generate a random 12-digit number
  static String _generateRandomNumber() {
    Random random = Random();
    return List.generate(12, (_) => random.nextInt(10).toString()).join();
  }

  /// Generate a new QR code and store it in Google Sheets
  Future<void> _generateAndStoreQR() async {
    String newQR = _generateRandomNumber();
    setState(() {
      _qrData = newQR;
    });

    // Store the generated QR number in Google Sheets
    // await GoogleSheetsAPI.addDataToSheet(newQR);
    await GoogleSheetsApi.addQRData(newQR);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Generate QR Code")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: _qrData,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateAndStoreQR,
              child: Text("Generate New QR"),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'google_sheets_api.dart'; // Import Google Sheets API file
//
// class GenerateQRPage extends StatefulWidget {
//   const GenerateQRPage({super.key});
//
//   @override
//   State<GenerateQRPage> createState() => _GenerateQRPageState();
// }
//
// class _GenerateQRPageState extends State<GenerateQRPage> {
//   String _qrData = '';
//
//   // Function to generate a 12-digit random number
//   String _generateRandomQr() {
//     Random random = Random();
//     return List.generate(12, (_) => random.nextInt(10).toString()).join();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _generateAndStoreQR();
//   }
//
//   Future<void> _generateAndStoreQR() async {
//     String newQR = _generateRandomQr();
//
//     setState(() {
//       _qrData = newQR;
//     });
//
//     await GoogleSheetsApi.appendQrCode(newQR); // Store in Google Sheets
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Generate QR Code")),
//       body: Center(  // Center everything
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,  // Center vertically
//           crossAxisAlignment: CrossAxisAlignment.center, // Align center horizontally
//           children: [
//             QrImageView(
//               data: _qrData,
//               version: QrVersions.auto,
//               size: 200.0,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _generateAndStoreQR,
//               child: Text("Generate New QR"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'google_sheets_api.dart'; // Import the API file
//
// class GenerateQRPage extends StatefulWidget {
//   const GenerateQRPage({super.key});
//
//   @override
//   State<GenerateQRPage> createState() => _GenerateQRPageState();
// }
//
// class _GenerateQRPageState extends State<GenerateQRPage> {
//   String _qrData = '';
//
//   // Function to generate a 12-digit random number
//   String _generateRandomQr() {
//     Random random = Random();
//     return List.generate(12, (_) => random.nextInt(10).toString()).join();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _generateAndStoreQR();
//   }
//
//   Future<void> _generateAndStoreQR() async {
//     String newQR = _generateRandomQr();
//
//     setState(() {
//       _qrData = newQR;
//     });
//
//     await GoogleSheetsApi.appendQrCode(newQR); // Store in Google Sheets
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Generate QR Code")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             QrImageView(
//               data: _qrData,
//               version: QrVersions.auto,
//               size: 200.0,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _generateAndStoreQR,
//               child: Text("Generate New QR"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'google_sheets_api.dart'; // Import your Google Sheets API file
//
// class GenerateQRPage extends StatefulWidget {
//   const GenerateQRPage({super.key});
//
//   @override
//   State<GenerateQRPage> createState() => _GenerateQRPageState();
// }
//
// class _GenerateQRPageState extends State<GenerateQRPage> {
//   String _qrData = _generateRandomNumber();
//
//   /// Generate a random 12-digit number
//   static String _generateRandomNumber() {
//     Random random = Random();
//     return List.generate(12, (_) => random.nextInt(10).toString()).join();
//   }
//
//   /// Generate a new QR code and store it in Google Sheets
//   Future<void> _generateAndStoreQR() async {
//     String newQR = _generateRandomNumber();
//     setState(() {
//       _qrData = newQR;
//     });
//
//     // Store the generated QR number in Google Sheets
//     await GoogleSheetsAPI.addDataToSheet(newQR);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Generate QR Code")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             QrImageView(
//               data: _qrData,
//               version: QrVersions.auto,
//               size: 200.0,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _generateAndStoreQR,
//               child: Text("Generate New QR"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
//
// class GenerateQRPage extends StatefulWidget {
//   const GenerateQRPage({super.key});
//
//   @override
//   State<GenerateQRPage> createState() => _GenerateQRPageState();
// }
//
// class _GenerateQRPageState extends State<GenerateQRPage> {
//   final TextEditingController _textController = TextEditingController(text: 'https://docs.google.com/spreadsheets/d/1w0Pk9HTR71sdwP-DpGwU6z5DPCN4XEE5C80axwI0aCM/edit?gid=0#gid=0');
//   String _qrData = 'https://docs.google.com/spreadsheets/d/1w0Pk9HTR71sdwP-DpGwU6z5DPCN4XEE5C80axwI0aCM/edit?gid=0#gid=0';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Generate QR Code")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             QrImageView(
//               data: _qrData,
//               version: QrVersions.auto,
//               size: 200.0,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _textController,
//               decoration: InputDecoration(
//                 labelText: 'Enter text or link',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _qrData = _textController.text.isNotEmpty ? _textController.text : 'https://docs.google.com/spreadsheets/d/1w0Pk9HTR71sdwP-DpGwU6z5DPCN4XEE5C80axwI0aCM/edit?gid=0#gid=0';
//                 });
//               },
//               child: Text("Generate QR"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
//
// class GenerateQRPage extends StatefulWidget {
//   const GenerateQRPage({super.key});
//
//   @override
//   State<GenerateQRPage> createState() => _GenerateQRPageState();
// }
//
// class _GenerateQRPageState extends State<GenerateQRPage> {
//   final TextEditingController _textController = TextEditingController();
//   String _qrData = 'https://example.com';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Generate QR Code")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             QrImageView(
//               data: _qrData,
//               version: QrVersions.auto,
//               size: 200.0,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _textController,
//               decoration: InputDecoration(
//                 labelText: 'Enter text or link',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _qrData = _textController.text.isNotEmpty ? _textController.text : 'https://example.com';
//                 });
//               },
//               child: Text("Generate QR"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
