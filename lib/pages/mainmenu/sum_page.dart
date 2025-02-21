import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SumPage extends StatefulWidget {
  @override
  _SumPageState createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {
  final TextEditingController _numbersController = TextEditingController();
  String _sumResult = '';
  String _digitCount = '';

  void _calculateSum() {
    String inputText = _numbersController.text.trim();

    if (inputText.isEmpty) {
      _showErrorSnackbar("Masukkan angka terlebih dahulu!");
      return;
    }

    // Ubah tiap digit menjadi angka
    List<int> numbers = inputText.split('').map((e) => int.parse(e)).toList();
    int sum = numbers.reduce((a, b) => a + b);

    setState(() {
      _digitCount = 'Jumlah Digit: ${numbers.length}';
      _sumResult = 'Total: $sum';
    });
  }

  void _resetInput() {
    setState(() {
      _numbersController.clear();
      _digitCount = '';
      _sumResult = '';
    });
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jumlah Total Angka'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.redAccent, Colors.deepOrangeAccent],
          ),
        ),
        child: Center(
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Masukkan Angka (tanpa spasi atau karakter lain)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _numbersController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Contoh: 1234',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, // Hanya angka
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _calculateSum,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: Text('Hitung', style: TextStyle(fontSize: 16)),
                      ),
                      ElevatedButton(
                        onPressed: _resetInput,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: Text('Reset', style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  if (_digitCount.isNotEmpty) // Menampilkan jika ada input
                    Text(
                      _digitCount,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  SizedBox(height: 5),
                  if (_sumResult.isNotEmpty) // Menampilkan jika ada hasil
                    Text(
                      _sumResult,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
