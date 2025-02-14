import 'package:flutter/material.dart';
import 'welcome_page.dart'; // Import WelcomePage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faculty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(), // Set initial page to WelcomePage
    );
  }
}
















// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Faculty',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(), // Start with the login page
//     );
//   }
// }
//
// // Login Page
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _email = '';
//   String _password = '';
//
//   void _login() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       // Simulate a login check (replace with your actual authentication logic)
//       if (_email == 'faculty@example.com' && _password == 'password') {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => MainPage()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Invalid email or password')),
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _email = value!,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _password = value!,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _login,
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Main Page
// class MainPage extends StatefulWidget {
//   const MainPage({super.key});
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text('CLASSLTIC'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'FACULTY',
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
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Home");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.qr_code_2_outlined),
//               title: Text('Generate QR'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Gallery");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.analytics_outlined),
//               title: Text('Attendance Records'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Slideshow");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.query_stats_outlined),
//               title: Text('Queries'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Slideshow");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout_outlined),
//               title: Text('Log Out'),
//               onTap: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Text('Welcome to QR Cam App!'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showSnackBar("Replace with your own action");
//         },
//         tooltip: 'Action',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
//
//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         action: SnackBarAction(
//           label: 'Action',
//           onPressed: () {},
//         ),
//       ),
//     );
//   }
// }

















// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Faculty',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(), // Start with the login page
//     );
//   }
// }
//
// // Login Page
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _email = '';
//   String _password = '';
//
//   void _login() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       // Simulate a login check (replace with your actual authentication logic)
//       if (_email == 'faculty@example.com' && _password == 'password') {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => MainPage()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Invalid email or password')),
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _email = value!,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _password = value!,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _login,
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Main Page
// class MainPage extends StatefulWidget {
//   const MainPage({super.key});
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text('CLASSLTIC'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text('FACULTY',
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
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Home");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.qr_code_2_outlined),
//               title: Text('Generate QR'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Gallery");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.analytics_outlined),
//               title: Text('Attendance Records'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Slideshow");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.query_stats_outlined),
//               title: Text('Queries'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Slideshow");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout_outlined),
//               title: Text('Log Out'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Slideshow");
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Text('Welcome to QR Cam App!'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showSnackBar("Replace with your own action");
//         },
//         tooltip: 'Action',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
//
//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         action: SnackBarAction(
//           label: 'Action',
//           onPressed: () {},
//         ),
//       ),
//     );
//   }
// }











// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Faculty',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MainPage(),
//     );
//   }
// }
//
//
// class MainPage extends StatefulWidget {
//   const MainPage({super.key});
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text('CLASSLTIC'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text('FACULTY',
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
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Home");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.qr_code_2_outlined),
//               title: Text('Generate QR'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Gallery");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.analytics_outlined),
//               title: Text('Attendance Records'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Slideshow");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.query_stats_outlined),
//               title: Text('Queries'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Slideshow");
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout_outlined),
//               title: Text('Log Out'),
//               onTap: () {
//                 Navigator.pop(context); // Close drawer
//                 _showSnackBar("Navigated to Slideshow");
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Text('Welcome to QR Cam App!'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showSnackBar("Replace with your own action");
//         },
//         tooltip: 'Action',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
//
//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         action: SnackBarAction(
//           label: 'Action',
//           onPressed: () {},
//         ),
//       ),
//     );
//   }
// }










// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
