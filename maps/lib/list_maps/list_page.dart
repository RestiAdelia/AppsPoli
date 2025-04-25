import 'package:flutter/material.dart';
import 'maps_screen.dart';

class LocationItem {
  final String name;
  final String gambarAsset;
  final String harga;
  final double latitude;
  final double longitude;
  final double rating;
  final String descripsi;

  LocationItem({
    required this.name,
    required this.harga,
    required this.gambarAsset,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.descripsi,
  });
}

class ListPage extends StatelessWidget {
  final List<LocationItem> locations = [
    LocationItem(
      name: 'RSUP Dr. M. Djamil Padang',
      gambarAsset: 'assets/image_maps/rs_mdjamil.png',
      harga: "Rp.150.000",
      latitude: -0.9431897240289424,
      longitude: 100.36695996574402,
      rating: 4.7,
      descripsi:
          "RSUP Dr. M. Djamil adalah rumah sakit rujukan utama di Sumatera Barat dan merupakan rumah sakit kelas A. Melayani pasien dari berbagai daerah, rumah sakit ini memiliki berbagai fasilitas unggulan dan tenaga medis sub-spesialis yang lengkap.",
    ),
    LocationItem(
      name: 'RSUP Universitas Andalas',
      gambarAsset: 'assets/image_maps/rs_unand.jpg',
      harga: "Rp.120.000",
      latitude: -0.9185020497138118,
      longitude: 100.45711816856962,
      rating: 4.5,
      descripsi:
          "Rumah Sakit Universitas Andalas adalah rumah sakit pendidikan yang terletak di kompleks Universitas Andalas, Padang. Dilengkapi dengan fasilitas modern dan tenaga medis profesional, RS Unand melayani berbagai kebutuhan kesehatan masyarakat serta sebagai sarana pendidikan bagi mahasiswa kedokteran.",
    ),
    LocationItem(
      name: 'Rumah Sakit Bhayangkara Padang',
      gambarAsset: 'assets/image_maps/rs_bayangkara.png',
      harga: "Rp.160.000",
      latitude: -0.9211,
      longitude: 100.3674,
      rating: 4.6,
      descripsi:
          "Rumah Sakit Bhayangkara Padang merupakan rumah sakit milik Kepolisian Negara Republik Indonesia (Polri) yang terbuka untuk umum. Selain melayani anggota Polri dan keluarganya, rumah sakit ini juga melayani masyarakat dengan fasilitas medis yang memadai dan pelayanan yang cepat dan sigap, terutama untuk penanganan kasus trauma dan kedaruratan.",
    ),
    LocationItem(
      name: 'Rumah Sakit Ibnu Sina Padang',
      gambarAsset: 'assets/image_maps/rs_ibnusina.png',
      harga: "Rp.100.000",
      latitude: -0.9285,
      longitude: 100.3659,
      rating: 4.4,
      descripsi:
          "RS Ibnu Sina Padang merupakan rumah sakit swasta yang memberikan pelayanan kesehatan umum dan spesialis. Rumah sakit ini dikenal dengan layanan rawat inap, rawat jalan, serta unit gawat darurat yang responsif dan profesional.",
    ),
    LocationItem(
      name: 'Rumah Sakit YosoDarsso',
      gambarAsset: 'assets/image_maps/rs_yosodarso.jpg',
      harga: "Rp.110.000",
      latitude: -0.9346101342856422,
      longitude: 100.36247210700412,
      rating: 4.8,
      descripsi:
          "RS Yos Sudarso adalah rumah sakit swasta yang telah berdiri sejak lama di Kota Padang. Rumah sakit ini menyediakan berbagai layanan spesialis, termasuk bedah, penyakit dalam, dan layanan radiologi, dengan komitmen tinggi terhadap keselamatan dan kenyamanan pasien.",
    ),
    LocationItem(
      name: 'Rumah Sakit Umum Aisiyah',
      gambarAsset: 'assets/image_maps/aisiyah.jpg',
      harga: "Rp.130.000",
      latitude: -0.9457666213429142,
      longitude: 100.36358790593988,
      rating: 4.2,
      descripsi:
          "RSUD Dr. Rasidin merupakan rumah sakit milik pemerintah kota Padang. Rumah sakit ini menjadi rujukan untuk pelayanan kesehatan dasar hingga lanjutan dengan berbagai layanan spesialis dan fasilitas penunjang yang terus berkembang.",
    ),
    LocationItem(
      name: 'Rumah Sakit Semen Padang Hospital',
      gambarAsset: 'assets/image_maps/semenpadang.jpg',
      harga: "Rp.125.000",
      latitude: -0.9403875751554237,
      longitude: 100.39947599953312,
      rating: 4.7,
      descripsi:
          "Rumah Sakit Semen Padang adalah rumah sakit swasta milik PT Semen Padang yang telah menjadi salah satu fasilitas kesehatan unggulan di Sumatera Barat. Rumah sakit ini melayani masyarakat umum dan karyawan perusahaan, dengan layanan spesialis dan peralatan medis modern.",
    ),
    LocationItem(
      name: 'Rumah Sakit Umum Daerah dr. Rasidin',
      gambarAsset: 'assets/image_maps/rasidin.jpg',
      harga: "Rp.100.000",
      latitude: -0.8781841499965528,
      longitude: 100.39533327571941,
      rating: 4.3,
      descripsi:
          "Rumah Sakit Siti Rahmah adalah rumah sakit swasta yang memiliki berbagai layanan seperti poliklinik, rawat inap, laboratorium, dan radiologi. Terkenal dengan pelayanan yang ramah dan fasilitas yang nyaman, rumah sakit ini menjadi pilihan banyak masyarakat Padang.",
    ),
    LocationItem(
      name: 'Rumah Sakit Tentara dr. Reksodiwiryo Padang.',
      gambarAsset: 'assets/image_maps/rs_tentara.jpg',
      harga: "Rp.125.000",
      latitude: -0.9495674790139361,
      longitude: 100.37254008365733,
      rating: 4.4,
      descripsi:
          "Rumah Sakit Tentara (RST) Dr. Reksodiwiryo adalah rumah sakit milik TNI AD yang melayani prajurit TNI, keluarga, serta masyarakat umum. Rumah sakit ini memiliki layanan kesehatan yang lengkap dan menjadi salah satu pusat rujukan di wilayah militer.",
    ),
    LocationItem(
      name: 'Rumah Sakit Hermina Padang',
      gambarAsset: 'assets/image_maps/rs_hermina.jpg',
      harga: "Rp.90.000",
      latitude: -0.9163878045967953,
      longitude: 100.36061573022043,
      rating: 4.5,
      descripsi:
          "Rumah Sakit Hermina Padang adalah bagian dari jaringan Rumah Sakit Hermina Group yang dikenal secara nasional. Rumah sakit ini menyediakan layanan kesehatan ibu dan anak, serta spesialis lainnya, dengan fasilitas yang modern dan pelayanan ramah.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Daftar Rumah Sakit di Padang',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.blue[50],
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            final loc = locations[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    loc.gambarAsset,
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
                            i < loc.rating.floor()
                                ? Icons.star
                                : Icons.star_border,
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
                      loc.harga,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MapScreen(location: loc)),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
