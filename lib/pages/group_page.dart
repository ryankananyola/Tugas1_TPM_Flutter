import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kelompok'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Halaman Data Kelompok',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}