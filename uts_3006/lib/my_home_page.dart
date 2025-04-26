import 'package:flutter/material.dart';
import 'package:uts_3006/detail_resto.dart';

class LocationItem {
  final String name;
  final String jambuka;
  final String gambar;
  final double rating;
  final String status;
  final String alamat;

  LocationItem({
    required this.name,
    required this.jambuka,
    required this.gambar,
    required this.alamat,
    required this.rating,
    required this.status,
  });
}

class MyHomePage extends StatelessWidget {
  final List<LocationItem> locations = [
    LocationItem(
      name: 'Radja Mie',
      gambar: 'images/radja.jpg',
      rating: 4.7,
      status: "Buka",
      jambuka: '09.00',
        alamat:'jln Setia',
    ),
    LocationItem(
      name: 'Clayton Resto ',
      gambar: 'images/clyton.jpg',
      rating: 4.7,
      status: 'Tutup',
      jambuka: '10.00',
      alamat:'Jln Suka Maju',
    ),
    LocationItem(
      name: 'Sa Cafe Resto ',
      gambar: 'images/sa_cafe.jpg',
      rating: 4.7,
      status: 'Tutup',
      jambuka: '12.00',
      alamat:'Kampung Kita',
    ),
    LocationItem(
      name: 'Chania Resto ',
      gambar: 'images/chania.png',
      rating: 4,
      status: 'Tutup',
      jambuka: '',
      alamat:'',
    ),
    LocationItem(
      name: 'Jopy Resto ',
      gambar: 'images/jopy.jpg',
      rating: 4.7,
      status: 'Tutup',
      jambuka: '',
      alamat:'',
    ),
    LocationItem(
      name: 'Garis Waktu Cafe',
      gambar: 'images/gariswaktu.jpg',
      rating: 4.7,
      status: 'Buka',
      jambuka: '10.00',
      alamat:'Jln Sekitar',
    ),
    LocationItem(
      name: 'Sederhana Resto ',
      gambar: 'images/sederhana.jpg',
      rating: 4.7,
      status: 'Tutup',
      jambuka: '09.00',
      alamat:'',
    ),
    LocationItem(
      name: 'Safari Resto ',
      gambar: 'images/clyton.jpg',
      rating: 4.7,
      status: 'Tutup',
      jambuka: '12.00',
      alamat:'Jln NIN Kit',
    ),
    LocationItem(
      name: 'HIL Cafe',
      gambar: 'images/hilcafe.jpg',
      rating: 4.7,
      status: 'Tutup',
      jambuka: '',
      alamat:'',
    ),
    LocationItem(
      name: 'Garis Waktu Cafe',
      gambar: 'images/gariswaktu.jpg',
      rating: 4.7,
      status: 'Tutup',
      jambuka: '11.00',
      alamat:'Jln Merpati',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'Daftar Resto  di Padang',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.orange[50],
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            final loc = locations[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child:ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailResto(location: loc),
                    ),
                  );
                },
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    loc.gambar,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  loc.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ...List.generate(5, (i) {
                          return Icon(
                            i < loc.rating.floor() ? Icons.star : Icons.star_border,
                            color: Colors.orange,
                            size: 16,
                          );
                        }),
                        SizedBox(width: 6),
                        Text(
                          loc.rating.toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      loc.status,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
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
