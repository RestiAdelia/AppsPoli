import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'page_detail_berita.dart'; // Pastikan file ini ada

class PageListView extends StatefulWidget {
  const PageListView({super.key});

  @override
  State<PageListView> createState() => _PageListViewState();
}

class _PageListViewState extends State<PageListView> {
  List<Map<String, dynamic>> listBerita = [
    {
      'judul': 'Judul berita Satu',
      'isi': 'Ipsum elit laboris quis pariatur proident duis fugiat aliquip in voluptate fugiat nulla fugiat.',
      'tanggal': '15 Maret 2025',
      'gambar': 'gambar/berita1.jpeg',
      'rating': 5,
    },
    {
      'judul': 'Judul berita Dua',
      'isi': 'Ipsum elit laboris quis pariatur proident duis fugiat aliquip in voluptate fugiat nulla fugiat.',
      'tanggal': '16 Maret 2025',
      'gambar': 'gambar/berita2.jpeg',
      'rating': 4,
    },
    {
      'judul': 'Judul berita Tiga',
      'isi': 'Ipsum elit laboris quis pariatur proident duis fugiat aliquip in voluptate fugiat nulla fugiat.',
      'tanggal': '17 Maret 2025',
      'gambar': 'gambar/berita3.jpeg',
      'rating': 3,
    },
    {
      'judul': 'Judul berita Empat',
      'isi': 'Ipsum elit laboris quis pariatur proident duis fugiat aliquip in voluptate fugiat nulla fugiat.',
      'tanggal': '18 Maret 2025',
      'gambar': 'gambar/berita4.jpg',
      'rating': 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Berita")), // Tambahkan AppBar
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: listBerita.length,
          itemBuilder: (context, index) {
            return GestureDetector( // Tambahkan GestureDetector di sini
              onTap: () {
                // Push ke halaman detail berita
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageDetailBerita(berita: listBerita[index]),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          listBerita[index]['gambar'],
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listBerita[index]['judul'],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(listBerita[index]['tanggal']),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RatingBarIndicator(
                                rating: listBerita[index]['rating'].toDouble(),
                                itemBuilder: (context, index) =>
                                    Icon(Icons.star, color: Colors.yellow),
                                itemCount: 5,
                                itemSize: 15,
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}