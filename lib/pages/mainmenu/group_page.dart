import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  final List<Map<String, String>> anggota = [
    {"nama": "Yohanes Febryan Kana Nyola", "nim": "123220198"},
    {"nama": "Aryamukti Satria Hendrayana", "nim": "123220181"},
    {"nama": "Sayudha Patria", "nim": "123220177"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kelompok'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Anggota Kelompok",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ...anggota.map((anggota) => buildCard(anggota)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(Map<String, String> anggota) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        leading: Icon(Icons.person, color: Colors.blueAccent, size: 40),
        title: Text(
          anggota["nama"]!,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text("NIM: ${anggota["nim"]}"),
      ),
    );
  }
}
