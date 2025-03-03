import 'package:flutter/material.dart';

class AboutMi extends StatelessWidget {
  const AboutMi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manajemen Informatika',
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
              'Manajemen Informatika',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10), // Jarak antara judul dan deskripsi
            const Text(
              'Manajemen Informatika adalah bidang yang berfokus pada penerapan teknologi informasi dalam pengelolaan dan pemrosesan data untuk mendukung pengambilan keputusan di berbagai sektor. '
                  'Program studi ini mengajarkan kombinasi ilmu komputer, sistem informasi, serta aspek bisnis dan manajemen, sehingga lulusannya mampu mengelola sistem informasi yang efisien dan efektif.',
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
