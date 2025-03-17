import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PageDetailBerita extends StatelessWidget {
  final Map<String, dynamic> berita;

  const PageDetailBerita({super.key, required this.berita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(berita['judul'])),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                berita['gambar'],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            SizedBox(height: 10),
            Text(
              berita['judul'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              berita['tanggal'],
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RatingBarIndicator(
                  rating: berita['rating'].toDouble(),
                  itemBuilder: (context, index) =>
                      Icon(Icons.star, color: Colors.yellow),
                  itemCount: 5,
                  itemSize: 20,
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              berita['isi'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}