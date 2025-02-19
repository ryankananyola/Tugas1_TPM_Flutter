import 'package:flutter/material.dart';
import 'mainmenu/group_page.dart';
import 'mainmenu/math_page.dart';
import 'mainmenu/odd_even_page.dart';
import 'mainmenu/sum_page.dart';
import 'profilepage.dart';
import 'aboutpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MainMenu(),
    AboutPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Utama'),
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
      ),
      body: _pages[_currentIndex], // Menampilkan halaman sesuai index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update tampilan sesuai indeks yang dipilih
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// Halaman Menu Utama (Tombol Grid)
class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2, // Dua kolom
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5, // Ukuran kotak tombol
        children: [
          _buildGridButton(context, 'Data Kelompok', Colors.blueAccent, GroupPage()),
          _buildGridButton(context, 'Penjumlahan & Pengurangan', Colors.green, MathPage()),
          _buildGridButton(context, 'Input Bilangan Ganjil/Genap', Colors.orange, OddEvenPage()),
          _buildGridButton(context, 'Jumlah Total Angka', Colors.red, SumPage()),
        ],
      ),
    );
  }

  Widget _buildGridButton(BuildContext context, String title, Color color, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
