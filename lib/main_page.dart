import 'package:flutter/material.dart';
import 'login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('CLASSLTIC'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'FACULTY',
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
                Navigator.pop(context); // Close drawer
                _showSnackBar("Navigated to Home");
              },
            ),
            ListTile(
              leading: Icon(Icons.qr_code_2_outlined),
              title: Text('Generate QR'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                _showSnackBar("Navigated to Gallery");
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics_outlined),
              title: Text('Attendance Records'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                _showSnackBar("Navigated to Slideshow");
              },
            ),
            ListTile(
              leading: Icon(Icons.query_stats_outlined),
              title: Text('Queries'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                _showSnackBar("Navigated to Slideshow");
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text('Log Out'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to QR Cam App!'),
      ),
    );
  }
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Action',
          onPressed: () {},
        ),
      ),
    );
  }
}
