import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRPage extends StatefulWidget {
  const GenerateQRPage({super.key});

  @override
  State<GenerateQRPage> createState() => _GenerateQRPageState();
}

class _GenerateQRPageState extends State<GenerateQRPage> {
  final TextEditingController _textController = TextEditingController(text: 'https://docs.google.com/spreadsheets/d/1w0Pk9HTR71sdwP-DpGwU6z5DPCN4XEE5C80axwI0aCM/edit?gid=0#gid=0');
  String _qrData = 'https://docs.google.com/spreadsheets/d/1w0Pk9HTR71sdwP-DpGwU6z5DPCN4XEE5C80axwI0aCM/edit?gid=0#gid=0';

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
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter text or link',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _qrData = _textController.text.isNotEmpty ? _textController.text : 'https://docs.google.com/spreadsheets/d/1w0Pk9HTR71sdwP-DpGwU6z5DPCN4XEE5C80axwI0aCM/edit?gid=0#gid=0';
                });
              },
              child: Text("Generate QR"),
            ),
          ],
        ),
      ),
    );
  }
}

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
