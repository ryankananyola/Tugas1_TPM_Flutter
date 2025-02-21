import 'package:flutter/material.dart';
import 'pages/loginpage.dart';
import 'pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      initialRoute: '/', // Rute awal
      routes: {
        '/': (context) => LoginPage(),  // Halaman login sebagai halaman pertama
        '/home': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return HomePage(username: args['username']!);
        },
      },
    );
  }
}
