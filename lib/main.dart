import 'package:flutter/material.dart';
import 'pages/loginpage.dart';
import 'pages/homepage.dart';// Import halaman login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: LoginPage(),  // Tampilkan halaman login pertama kali
      routes: {
        '/home': (context) => HomePage(),  // Buat halaman home nantinya
      },
    );
  }
}
