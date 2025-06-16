import 'package:flutter/material.dart';
import 'package:her_3006/my_home_page.dart';


class DetailSPBU extends StatelessWidget {
  final LocationItem location;

  const DetailSPBU({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pom Bensin'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              location.gambar,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      ...List.generate(5, (i) {
                        return Icon(
                          i < location.rating.floor()
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.orange,
                          size: 20,
                        );
                      }),
                      SizedBox(width: 8),
                      Text(
                        location.rating.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Status: ${location.status}",
                    style: TextStyle(
                      fontSize: 16,
                      color: location.status.toLowerCase() == "buka"
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Jam Buka: ${location.jambuka.isNotEmpty ? location.jambuka : 'Tidak tersedia'}",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Alamat: ${location.alamat.isNotEmpty ? location.alamat : 'Tidak tersedia'}",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 12),
                  // Tambahan Keterangan di halaman detail
                  Text(
                    "Keterangan:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    location.ket.isNotEmpty ? location.ket : 'Tidak ada keterangan',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
