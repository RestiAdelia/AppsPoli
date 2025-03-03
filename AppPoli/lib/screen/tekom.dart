import 'package:flutter/material.dart';

class AboutTekkom extends StatelessWidget {
  const AboutTekkom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Teknik Komputer',
          style: TextStyle(color: Colors.black), // Warna teks
        ),
        backgroundColor: Colors.blueAccent, // Warna latar belakang AppBar
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
              'Teknik Komputer',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10), // Jarak antara judul dan deskripsi
            const Text(
              'Teknik Komputer adalah bidang yang menggabungkan ilmu komputer dan teknik elektro untuk mengembangkan sistem perangkat keras dan lunak. '
                  'Program studi ini mencakup desain, perakitan, serta pemrograman komputer dan jaringan. Lulusan Teknik Komputer memiliki kompetensi dalam membangun sistem komputer yang efisien serta merancang solusi teknologi berbasis hardware dan software.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30), // Jarak sebelum tombol
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Warna tombol
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Border tombol melengkung
                ),
              ),
              child: const Text(
                'Kembali',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
