import 'package:apppoli/screen/galeri.dart';
import 'package:apppoli/screen/manajemeninformatika.dart';
import 'package:apppoli/screen/tekom.dart';
import 'package:flutter/material.dart';
import 'package:apppoli/screen/about_pnp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PNP App'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('gambar/logo_pnp.png', height: 150),
            const SizedBox(height: 20),
            const Text(
              'SELAMAT DATANG DI POLITEKNIK NEGERI PADANG',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildMenuButton(context, 'Tentang Politeknik Negeri Padang', const AboutPnp()),
            const SizedBox(height: 10),
            _buildMenuButton(context, 'Manajemen Informatika', const AboutMi()),
            const SizedBox(height: 10),
            _buildMenuButton(context, 'Teknik Komputer', const AboutTekkom()),
            const SizedBox(height: 10),
            _buildMenuButton(context, 'Galeri Foto', const GalleryScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, Widget page) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(title, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
