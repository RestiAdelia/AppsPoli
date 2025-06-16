import 'package:flutter/material.dart';
import 'package:her_3006/detail_pom_bensin.dart';

class LocationItem {
  final String name;
  final String jambuka;
  final String gambar;
  final double rating;
  final String status;
  final String alamat;
  final String ket;

  LocationItem({
    required this.name,
    required this.jambuka,
    required this.gambar,
    required this.alamat,
    required this.rating,
    required this.status,
    required this.ket,
  });
}

class MyHomePage extends StatelessWidget {
  final List<LocationItem> locations = [
    LocationItem(
      name: 'SPBU Andalas',
      gambar: 'images/unand_spbu.jpg',
      rating: 4.5,
      status: "Buka",
      jambuka: '06.00',
      alamat: 'Jl. Andalas No.5, Padang',
      ket: 'SPBU ini buka mulai pukul 06.00 dan menyediakan BBM berkualitas.',
    ),
    LocationItem(
      name: 'SPBU COCO 11.251.502',
      gambar: 'images/coco_spbu.jpg',
      rating: 4.3,
      status: 'Tutup',
      jambuka: '07.00',
      alamat: 'JL S. Parman, Ulak Karang, Kota Padang',
      ket: '',
    ),
    LocationItem(
      name: 'SPBU Pertamina Pitameh',
      gambar: 'images/pitameh_spbu.jpg',
      rating: 4.2,
      status: 'Buka',
      jambuka: '06.00',
      alamat: 'Tj. Saba Pitameh, Lubuk Begalung, Padang',
      ket: 'Terletak strategis di pusat kota, mudah dijangkau',
    ),
    LocationItem(
      name: 'SPBU Pasar Ambacang',
      gambar: 'images/ambacang_spbu.jpg',
      rating: 4.2,
      status: 'Tutup',
      jambuka: '08.00',
      alamat: 'Ps. Ambacang, Kuranji, Padang',
      ket: 'Terletak strategis di pusat kota, mudah dijangkau',
    ),
    LocationItem(
      name: 'SPBU Khatib Sulaiman',
      gambar: 'images/katib_spbu.jpg',
      rating: 4.7,
      status: 'Buka',
      jambuka: '06.30',
      alamat: 'Jl. Khatib Sulaiman, Padang',
      ket:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata',
    ),
    LocationItem(
      name: 'SPBU Bypass',
      gambar: 'images/bypas_spbu.jpg',
      rating: 4.1,
      status: 'Buka',
      jambuka: '05.30',
      alamat: 'Jl. By Pass, Kalumbuk, Padang',
      ket:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata',
    ),
    LocationItem(
      name: 'SPBU 13.251.510 AMPANG',
      gambar: 'images/ampang.jpg',
      rating: 4.4,
      status: 'Buka',
      jambuka: '06.00',
      alamat: 'Jl. Raya Ampang No.88, Lubuk Lintah, Kota Padang',
      ket:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata',
    ),
    LocationItem(
      name: 'SPBU Pertamina 14.251.510 Tabing',
      gambar: 'images/tabing.jpg',
      rating: 4.5,
      status: 'Buka',
      jambuka: '06.00',
      alamat: 'Jl. Prof. Dr. Hamka, Kec. Koto Tangah, Kota Padang',
      ket:
          'SPBU ini berada di jalur utama dekat Bandara Internasional Minangkabau, cocok untuk pengendara yang akan bepergian jauh.',
    ),
    LocationItem(
      name: 'SPBU Marapalam',
      gambar: 'images/ampang.jpg',
      rating: 4.0,
      status: 'Tutup',
      jambuka: '07.00',
      alamat: 'Jl. Dr. Sutomo No.115, Kota Padang',
      ket:
          'Terletak di area ramai, SPBU Marapalam sering menjadi pilihan masyarakat sekitar untuk mengisi BBM meski saat ini sedang tutup.',
    ),

    LocationItem(
      name: 'SPBU Pertamina 14.251.519',
      gambar: 'images/spbu14.jpg',
      rating: 4.2,
      status: 'Tutup',
      jambuka: '07.30',
      alamat: 'Jalan KH Haji Agus Salim No. 56, Kota Padang',
      ket:
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'Daftar Pom Bensin di Padang',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.orange[50],
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: locations.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5 / 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          itemBuilder: (context, index) {
            final loc = locations[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailSPBU(location: loc),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        loc.gambar,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            loc.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              ...List.generate(5, (i) {
                                return Icon(
                                  i < loc.rating.floor()
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.orange,
                                  size: 14,
                                );
                              }),
                              SizedBox(width: 4),
                              Text(
                                loc.rating.toString(),
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Text(
                            loc.status,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: loc.status.toLowerCase() == "buka"
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            loc.jambuka.isNotEmpty ? 'Buka jam: ${loc.jambuka}' : '',
                            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                          ),
                          SizedBox(height: 4),
                          Text(
                            loc.alamat,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, color: Colors.black54),
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
