// import 'package:flutter/material.dart';
// import 'google_sheets_api.dart'; // Import the Google Sheets API file
//
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
//   bool _rememberMe = false;
//
//   void _signUp() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//
//       // Store user data in Google Sheets
//       // await GoogleSheetsAPI.appendUserData(_name, _email, _password);
//       await GoogleSheetsApi.addUserDataS(_name, _email, _password);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('User registered successfully!')),
//       );
//       Navigator.pop(context); // Return to login page
//     }
//   }
//   /// Function to store user data in Google Sheets
//   // Future<void> _signUp() async {
//   //   if (_formKey.currentState!.validate()) {
//   //     _formKey.currentState!.save();
//   //
//   //     // Store user details in Google Sheets
//   //     await GoogleSheetsApi.appendUserData(_name, _email, _password);
//   //
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text('User registered successfully!')),
//   //     );
//   //
//   //     Navigator.pop(context); // Return to login page
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/Cuboid.jpeg', height: 200), // Replace with your image
//             const SizedBox(height: 20),
//             const Text(
//               'Student Sign Up',
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               'Please register to login.',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             const SizedBox(height: 20),
//             Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Username',
//                       prefixIcon: const Icon(Icons.person),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => _name = value!,
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       prefixIcon: const Icon(Icons.email),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => _email = value!,
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       prefixIcon: const Icon(Icons.lock),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => _password = value!,
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: _rememberMe,
//                         onChanged: (value) {
//                           setState(() {
//                             _rememberMe = value!;
//                           });
//                         },
//                       ),
//                       const Text('Remember me'),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _signUp,
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     child: const Text('Sign Up'),
//                   ),
//                   const SizedBox(height: 20),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context); // Back to login page
//                     },
//                     child: const Text("Already have an account? Sign In"),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'student_database.dart';
//
// class StudentSignUpPage extends StatefulWidget {
//   const StudentSignUpPage({super.key});
//
//   @override
//   State<StudentSignUpPage> createState() => _StudentSignUpPageState();
// }
//
// class _StudentSignUpPageState extends State<StudentSignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _email = '';
//   String _password = '';
//   bool _rememberMe = false;
//   File? _selectedImage;
//
//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//
//     if (image != null) {
//       setState(() {
//         _selectedImage = File(image.path);
//       });
//     }
//   }
//
//   void _signUp() {
//     if (_formKey.currentState!.validate() && _selectedImage != null) {
//       _formKey.currentState!.save();
//       StudentDatabase.addStudent(_name, _email, _password);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Student registered successfully!')),
//       );
//       Navigator.pop(context); // Return to login page
//     } else if (_selectedImage == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please upload a close-up photo!')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/student_signup.jpeg', height: 200), // Student image
//             SizedBox(height: 20),
//             Text(
//               'Student Sign Up',
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'Create your student account to get started.',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             SizedBox(height: 20),
//             Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Name',
//                       prefixIcon: Icon(Icons.person),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => _name = value!,
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       prefixIcon: Icon(Icons.email),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => _email = value!,
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       prefixIcon: Icon(Icons.lock),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => _password = value!,
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton.icon(
//                     onPressed: _pickImage,
//                     icon: Icon(Icons.camera_alt),
//                     label: Text("Upload Close-up Photo"),
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                   ),
//                   if (_selectedImage != null)
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: Image.file(_selectedImage!, height: 100),
//                     ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: _rememberMe,
//                             onChanged: (value) {
//                               setState(() {
//                                 _rememberMe = value!;
//                               });
//                             },
//                           ),
//                           Text('Remember me'),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _signUp,
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     child: Text('Sign Up'),
//                   ),
//                   SizedBox(height: 20),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context); // Back to login page
//                     },
//                     child: Text("Already have an account? Sign In"),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'student_database.dart';
//
// class StudentSignUpPage extends StatefulWidget {
//   const StudentSignUpPage({super.key});
//
//   @override
//   State<StudentSignUpPage> createState() => _StudentSignUpPageState();
// }
//
// class _StudentSignUpPageState extends State<StudentSignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _email = '';
//   String _password = '';
//   bool _rememberMe = false;
//   File? _selectedImage;
//
//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//
//     if (image != null) {
//       setState(() {
//         _selectedImage = File(image.path);
//       });
//     }
//   }
//
//   void _signUp() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       StudentDatabase.addStudent(_name, _email, _password);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Student registered successfully!')),
//       );
//       Navigator.pop(context); // Return to login page
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: _pickImage,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundColor: Colors.grey[300],
//                 backgroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null,
//                 child: _selectedImage == null
//                     ? Icon(Icons.camera_alt, size: 50, color: Colors.white)
//                     : null,
//               ),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: _pickImage,
//               icon: Icon(Icons.upload),
//               label: Text("Upload Photo"),
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                 padding: EdgeInsets.symmetric(vertical: 10),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Student Sign Up',
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'Create your student account to get started.',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             SizedBox(height: 20),
//             Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Name',
//                       prefixIcon: Icon(Icons.person),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => _name = value!,
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       prefixIcon: Icon(Icons.email),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => _email = value!,
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       prefixIcon: Icon(Icons.lock),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => _password = value!,
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: _rememberMe,
//                             onChanged: (value) {
//                               setState(() {
//                                 _rememberMe = value!;
//                               });
//                             },
//                           ),
//                           Text('Remember me'),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _signUp,
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                     child: Text('Sign Up'),
//                   ),
//                   SizedBox(height: 20),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context); // Back to login page
//                     },
//                     child: Text("Already have an account? Sign In"),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//


import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'google_sheets_api.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'student_database.dart';

class StudentSignUpPage extends StatefulWidget {
  const StudentSignUpPage({super.key});

  @override
  State<StudentSignUpPage> createState() => _StudentSignUpPageState();
}

class _StudentSignUpPageState extends State<StudentSignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  bool _rememberMe = false;

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Store user data in Google Sheets
      // await GoogleSheetsAPI.appendUserData(_name, _email, _password);
      await GoogleSheetsApi.addUserDataS(_name, _email, _password);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully!')),
      );
      Navigator.pop(context); // Return to login page
    }
  }
  // void _signUp() {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     StudentDatabase.addStudent(_name, _email, _password);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Student registered successfully!')),
  //     );
  //     Navigator.pop(context); // Return to login page
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Cuboid.jpeg', height: 200), // Student image
            SizedBox(height: 20),
            Text(
              'Student Sign Up',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              'Create your student account to get started.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
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
