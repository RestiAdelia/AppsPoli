import 'package:flutter/material.dart';

class AboutPnp extends StatelessWidget {
  const AboutPnp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tentang Politeknik Negeri Padang',
          style: TextStyle(color: Colors.black), // Warna teks
        ),
        backgroundColor: Colors.amberAccent,
        centerTitle: true, // Agar teks di tengah
        elevation: 0, // Menghilangkan shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Agar ada ruang di sisi layar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Politeknik Negeri Padang',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10), // Jarak antara judul dan deskripsi
            const Text(
              'Politeknik Negeri Padang merupakan salah satu institusi pendidikan '
                  'terbaik di Indonesia yang berfokus pada pendidikan vokasi.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30), // Jarak sebelum tombol
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent, // Warna tombol
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Border tombol melengkung
                ),
              ),
              child: const Text(
                'Kembali',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
