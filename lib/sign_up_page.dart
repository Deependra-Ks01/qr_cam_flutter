import 'package:flutter/material.dart';
import 'user_database.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _mobile = '';
  String _password = '';
  bool _rememberMe = false;

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      UserDatabase.addUser(_name, _email, _password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully!')),
      );
      Navigator.pop(context); // Return to login page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Cuboid.jpeg', height: 200), // Replace with your image
            SizedBox(height: 20),
            Text(
              'Register',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              'Please register to login.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) => _name = value!,
                  ),
                  SizedBox(height: 10),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //     labelText: 'Mobile Number',
                  //     prefixIcon: Icon(Icons.phone),
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  //   ),
                  //   keyboardType: TextInputType.phone,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter your mobile number';
                  //     }
                  //     return null;
                  //   },
                  //   onSaved: (value) => _mobile = value!,
                  // ),
                  // SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) => _email = value!,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value!,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                          Text('Remember me'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _signUp,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Back to login page
                    },
                    child: Text("Already have an account? Sign In"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class SignUpPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/register_illustration.png', height: 150),
//             SizedBox(height: 20),
//             Text('Register', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//             Text('Please register to login.', style: TextStyle(fontSize: 16, color: Colors.grey)),
//             SizedBox(height: 20),
//             TextField(decoration: InputDecoration(labelText: 'Username', prefixIcon: Icon(Icons.person))),
//             SizedBox(height: 10),
//             TextField(decoration: InputDecoration(labelText: 'Mobile Number', prefixIcon: Icon(Icons.phone))),
//             SizedBox(height: 10),
//             TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock))),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 Checkbox(value: false, onChanged: (value) {}),
//                 Text('Remind me realtime')
//               ],
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
//               child: Text('Sign Up'),
//             ),
//             SizedBox(height: 20),
//             TextButton(onPressed: () {}, child: Text("Already have an account? Sign In"))
//           ],
//         ),
//       ),
//     );
//   }
// }



// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});
//
//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _email = '';
//   String _password = '';
//
//   void _signUp() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       UserDatabase.addUser(_name, _email, _password);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('User registered successfully!')),
//       );
//       Navigator.pop(context); // Return to login page
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sign Up')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _name = value!,
//               ),
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
//                 onPressed: _signUp,
//                 child: Text('Sign Up'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
