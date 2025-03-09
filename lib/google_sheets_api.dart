import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class GoogleSheetsApi {
  static const String _spreadsheetId = "1w0Pk9HTR71sdwP-DpGwU6z5DPCN4XEE5C80axwI0aCM"; // Your Google Sheet ID
  static const String _userSheet = "Sheet2"; // Sign-up details & login verification
  static const String _qrSheet = "Sheet1"; // QR code storage

  /// **Authenticate with Google Sheets API**
  static Future<AuthClient> _getAuthClient() async {
    final credentialsString = await rootBundle.loadString('assets/credentials.json');
    final credentials = ServiceAccountCredentials.fromJson(json.decode(credentialsString));
    final scopes = [sheets.SheetsApi.spreadsheetsScope];

    return await clientViaServiceAccount(credentials, scopes);
  }

  /// **Store Sign-up Data in Sheet2**
  static Future<void> addUserData(String name, String email, String password) async {
    try {
      final client = await _getAuthClient();
      final sheetsApi = sheets.SheetsApi(client);

      final valueRange = sheets.ValueRange(
        values: [
          [name, email, password], // Store name, email, and password
        ],
      );

      await sheetsApi.spreadsheets.values.append(
        valueRange,
        _spreadsheetId,
        '$_userSheet!A:C', // Store in columns A, B, C
        valueInputOption: 'RAW',
      );

      client.close();
    } catch (e) {
      print('Error storing user data in Google Sheets: $e');
    }
  }

  /// **Fetch Users for Login Verification from Sheet2**
  static Future<List<Map<String, String>>> fetchUsers() async {
    try {
      final client = await _getAuthClient();
      final sheetsApi = sheets.SheetsApi(client);

      final response = await sheetsApi.spreadsheets.values.get(
        _spreadsheetId,
        '$_userSheet!A:C', // Fetch Name, Email, Password
      );

      client.close();

      if (response.values == null || response.values!.isEmpty) {
        return [];
      }

      // Convert response to a list of maps with proper typing
      return response.values!.map((row) {
        return {
          'name': row.length > 0 ? row[0].toString() : "",
          'email': row.length > 1 ? row[1].toString() : "",
          'password': row.length > 2 ? row[2].toString() : "",
        };
      }).toList();
    } catch (e) {
      print('Error fetching user data from Google Sheets: $e');
      return [];
    }
  }

  static Future<void> addQRData(String qrData) async {
    try {
      final client = await _getAuthClient();
      final sheetsApi = sheets.SheetsApi(client);

      final valueRange = sheets.ValueRange(
        values: [
          [qrData, DateTime.now().toString()], // Store QR number and timestamp
        ],
      );

      await sheetsApi.spreadsheets.values.append(
        valueRange,
        _spreadsheetId,
        '$_qrSheet!A:B', // Append data in columns A and B
        valueInputOption: 'RAW',
      );

      client.close();
    } catch (e) {
      print('Error writing to Google Sheets: $e');
    }
  }
}


// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:googleapis/sheets/v4.dart' as sheets;
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart' as http;
//
// class GoogleSheetsAPI {
//   static const String _spreadsheetId = "1w0Pk9HTR71sdwP-DpGwU6z5DPCN4XEE5C80axwI0aCM"; // Your Google Sheet ID
//   static const String _userSheet = "Sheet2"; // Sign-up details & login verification
//   static const String _qrSheet = "Sheet1"; // QR code storage
//
//   /// **Authenticate with Google Sheets API**
//   static Future<AuthClient> _getAuthClient() async {
//     final credentialsString = await rootBundle.loadString('assets/credentials.json');
//     final credentials = ServiceAccountCredentials.fromJson(json.decode(credentialsString));
//     final scopes = [sheets.SheetsApi.spreadsheetsScope];
//
//     return await clientViaServiceAccount(credentials, scopes);
//   }
//
//   /// **Store Sign-up Data in Sheet2**
//   static Future<void> addUserData(String name, String email, String password) async {
//     try {
//       final client = await _getAuthClient();
//       final sheetsApi = sheets.SheetsApi(client);
//
//       final valueRange = sheets.ValueRange(
//         values: [
//           [name, email, password], // Store name, email, and password
//         ],
//       );
//
//       await sheetsApi.spreadsheets.values.append(
//         valueRange,
//         _spreadsheetId,
//         '$_userSheet!A:C', // Store in columns A, B, C
//         valueInputOption: 'RAW',
//       );
//
//       client.close();
//     } catch (e) {
//       print('Error storing user data in Google Sheets: $e');
//     }
//   }
//
//   /// **Fetch Users for Login Verification from Sheet2**
//   static Future<List<Map<String, String>>> fetchUsers() async {
//     try {
//       final client = await _getAuthClient();
//       final sheetsApi = sheets.SheetsApi(client);
//
//       final response = await sheetsApi.spreadsheets.values.get(
//         _spreadsheetId,
//         '$_userSheet!A:C', // Fetch Name, Email, Password
//       );
//
//       client.close();
//
//       if (response.values == null || response.values!.isEmpty) {
//         return [];
//       }
//
//       // Convert response to a list of maps
//       return response.values!.map((row) {
//         if (row.length < 3) return {};
//         return {
//           'name': row[0].toString(),
//           'email': row[1].toString(),
//           'password': row[2].toString(),
//         };
//       }).toList();
//     } catch (e) {
//       print('Error fetching user data from Google Sheets: $e');
//       return [];
//     }
//   }
//
//   /// **Store QR Scan Data in Sheet1**
//   static Future<void> addQRData(String qrData) async {
//     try {
//       final client = await _getAuthClient();
//       final sheetsApi = sheets.SheetsApi(client);
//
//       final valueRange = sheets.ValueRange(
//         values: [
//           [qrData, DateTime.now().toString()], // Store QR data and timestamp
//         ],
//       );
//
//       await sheetsApi.spreadsheets.values.append(
//         valueRange,
//         _spreadsheetId,
//         '$_qrSheet!A:B', // Append data in columns A and B
//         valueInputOption: 'RAW',
//       );
//
//       client.close();
//     } catch (e) {
//       print('Error writing QR data to Google Sheets: $e');
//     }
//   }
// }


// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:googleapis/sheets/v4.dart' as sheets;
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart' as http;
//
// class GoogleSheetsAPI {
//   static const String _spreadsheetId = "1w0Pk9HTR71sdwP-DpGwU6z5DPCN4XEE5C80axwI0aCM"; // Your Sheet ID
//   static const String _qrSheet = "Sheet1"; // Sheet for QR codes
//   static const String _userSheet = "Sheet2"; // Sheet for user sign-ups
//
//   /// **Authenticate with Google Sheets API**
//   static Future<AuthClient> _getAuthClient() async {
//     final credentialsString = await rootBundle.loadString('assets/credentials.json');
//     final credentials = ServiceAccountCredentials.fromJson(json.decode(credentialsString));
//     final scopes = [sheets.SheetsApi.spreadsheetsScope];
//
//     return await clientViaServiceAccount(credentials, scopes);
//   }
//
//   /// **Fetch all registered users from Google Sheets**
//   static Future<List<Map<String, String>>> fetchUsers() async {
//     try {
//       final client = await _getAuthClient();
//       final sheetsApi = sheets.SheetsApi(client);
//
//       final response = await sheetsApi.spreadsheets.values.get(
//         _spreadsheetId,
//         '$_userSheet!A:C', // Fetch Name, Email, Password
//       );
//
//       client.close();
//
//       if (response.values == null || response.values!.isEmpty) {
//         return [];
//       }
//
//       // Convert response to a list of maps
//       return response.values!.map((row) {
//         if (row.length < 3) return {};
//         return {
//           'name': row[0].toString(),
//           'email': row[1].toString(),
//           'password': row[2].toString(),
//         };
//       }).toList();
//     } catch (e) {
//       print('Error fetching user data from Google Sheets: $e');
//       return [];
//     }
//   }
//
//   /// **Append a new QR Code to Sheet1**
//   static Future<void> addDataToSheet(String qrData) async {
//     try {
//       final client = await _getAuthClient();
//       final sheetsApi = sheets.SheetsApi(client);
//
//       final valueRange = sheets.ValueRange(
//         values: [
//           [qrData, DateTime.now().toString()], // QR Code and timestamp
//         ],
//       );
//
//       await sheetsApi.spreadsheets.values.append(
//         valueRange,
//         _spreadsheetId,
//         '$_qrSheet!A:B',
//         valueInputOption: 'RAW',
//       );
//
//       client.close();
//     } catch (e) {
//       print('Error writing QR code to Google Sheets: $e');
//     }
//   }
//
//   /// **Append a new User Registration to Sheet2**
//   static Future<void> appendUserData(String name, String email, String password) async {
//     try {
//       final client = await _getAuthClient();
//       final sheetsApi = sheets.SheetsApi(client);
//
//       final valueRange = sheets.ValueRange(
//         values: [
//           [name, email, password, DateTime.now().toString()], // Store with timestamp
//         ],
//       );
//
//       await sheetsApi.spreadsheets.values.append(
//         valueRange,
//         _spreadsheetId,
//         '$_userSheet!A:D', // Append to Sheet2 columns A-D
//         valueInputOption: 'RAW',
//       );
//
//       client.close();
//     } catch (e) {
//       print('Error writing user data to Google Sheets: $e');
//     }
//   }
// }


// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:googleapis/sheets/v4.dart' as sheets;
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart' as http;
//
// class GoogleSheetsAPI {
//   static const String _spreadsheetId = "1w0Pk9HTR71sdwP-DpGwU6z5DPCN4XEE5C80axwI0aCM"; // Replace with your actual Google Sheet ID
//   static const String _qrSheet = "Sheet1"; // Sheet for QR codes
//   static const String _userSheet = "Sheet2"; // Sheet for sign-ups
//
//   /// **Authenticate with Google Sheets API using credentials.json**
//   static Future<AuthClient> _getAuthClient() async {
//     final credentialsString = await rootBundle.loadString('assets/credentials.json');
//     final credentials = ServiceAccountCredentials.fromJson(json.decode(credentialsString));
//     final scopes = [sheets.SheetsApi.spreadsheetsScope];
//
//     return await clientViaServiceAccount(credentials, scopes);
//   }
//
//   /// **Append a new QR code to Google Sheets (Sheet1)**
//   static Future<void> addQRToSheet(String qrData) async {
//     try {
//       final client = await _getAuthClient();
//       final sheetsApi = sheets.SheetsApi(client);
//
//       final valueRange = sheets.ValueRange(
//         values: [
//           [qrData, DateTime.now().toString()], // QR code & timestamp
//         ],
//       );
//
//       await sheetsApi.spreadsheets.values.append(
//         valueRange,
//         _spreadsheetId,
//         '$_qrSheet!A:B', // Append to Sheet1 (Columns A & B)
//         valueInputOption: 'RAW',
//       );
//
//       client.close();
//     } catch (e) {
//       print('Error writing QR to Google Sheets: $e');
//     }
//   }
//
//   /// **Append user sign-up information (Name, Email, Password) to Google Sheets (Sheet2)**
//   static Future<void> addUserToSheet(String name, String email, String password) async {
//     try {
//       final client = await _getAuthClient();
//       final sheetsApi = sheets.SheetsApi(client);
//
//       final valueRange = sheets.ValueRange(
//         values: [
//           [name, email, password, DateTime.now().toString()], // Name, Email, Password, Timestamp
//         ],
//       );
//
//       await sheetsApi.spreadsheets.values.append(
//         valueRange,
//         _spreadsheetId,
//         '$_userSheet!A:D', // Append to Sheet2 (Columns A to D)
//         valueInputOption: 'RAW',
//       );
//
//       client.close();
//     } catch (e) {
//       print('Error writing user data to Google Sheets: $e');
//     }
//   }
// }




// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:googleapis/sheets/v4.dart' as sheets;
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart' as http;
//
// class GoogleSheetsAPI {
//   static const String _spreadsheetId = "1w0Pk9HTR71sdwP-DpGwU6z5DPCN4XEE5C80axwI0aCM"; // Replace with your actual Google Sheet ID
//   static const String _sheetName = "Sheet1"; // Update if your sheet has a different name
//
//   /// **Load credentials.json from assets and authenticate with Google Sheets API**
//   static Future<AuthClient> _getAuthClient() async {
//     final credentialsString = await rootBundle.loadString('assets/credentials.json');
//     final credentials = ServiceAccountCredentials.fromJson(json.decode(credentialsString));
//     final scopes = [sheets.SheetsApi.spreadsheetsScope];
//
//     return await clientViaServiceAccount(credentials, scopes);
//   }
//
//   /// **Append a new row (random QR number) to Google Sheets**
//   static Future<void> addDataToSheet(String qrData) async {
//     try {
//       final client = await _getAuthClient();
//       final sheetsApi = sheets.SheetsApi(client);
//
//       final valueRange = sheets.ValueRange(
//         values: [
//           [qrData, DateTime.now().toString()], // Store QR number and timestamp
//         ],
//       );
//
//       await sheetsApi.spreadsheets.values.append(
//         valueRange,
//         _spreadsheetId,
//         '$_sheetName!A:B', // Append data in columns A and B
//         valueInputOption: 'RAW',
//       );
//
//       client.close();
//     } catch (e) {
//       print('Error writing to Google Sheets: $e');
//     }
//   }
// }


// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:googleapis/sheets/v4.dart' as sheets;
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart' as http;
//
// class GoogleSheetsAPI {
//   static const String _spreadsheetId = "1w0Pk9HTR71sdwP-DpGwU6z5DPCN4XEE5C80axwI0aCM"; // Replace with your actual Google Sheet ID
//   static const String _sheetName = "Sheet1"; // Update if your sheet has a different name
//
//   /// **Load credentials.json from assets and authenticate with Google Sheets API**
//   static Future<AuthClient> _getAuthClient() async {
//     final credentialsString = await rootBundle.loadString('assets/credentials.json');
//     final credentials = ServiceAccountCredentials.fromJson(json.decode(credentialsString));
//     final scopes = [sheets.SheetsApi.spreadsheetsScope];
//
//     return await clientViaServiceAccount(credentials, scopes);
//   }
//
//   /// **Append a new row (random QR number) to Google Sheets**
//   static Future<void> addDataToSheet(String qrData) async {
//     try {
//       final client = await _getAuthClient();
//       final sheetsApi = sheets.SheetsApi(client);
//
//       final valueRange = sheets.ValueRange(
//         values: [
//           [qrData, DateTime.now().toString()], // Store QR number and timestamp
//         ],
//       );
//
//       await sheetsApi.spreadsheets.values.append(
//         valueRange,
//         _spreadsheetId,
//         '$_sheetName!A:B', // Append data in columns A and B
//         valueInputOption: 'RAW',
//       );
//
//       client.close();
//     } catch (e) {
//       print('Error writing to Google Sheets: $e');
//     }
//   }
// }
