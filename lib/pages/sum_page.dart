import 'package:flutter/material.dart';

class SumPage extends StatefulWidget {
  @override
  _SumPageState createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {
  final TextEditingController _numbersController = TextEditingController();
  String _result = '';

  void _calculateSum() {
    List<String> numbers = _numbersController.text.split(',');
    int sum = numbers.map((e) => int.tryParse(e.trim()) ?? 0).reduce((a, b) => a + b);
    setState(() {
      _result = 'Total: $sum';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jumlah Total Angka'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numbersController,
              decoration: InputDecoration(labelText: 'Masukkan angka (pisahkan dengan koma)'),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateSum,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}