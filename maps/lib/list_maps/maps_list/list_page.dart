import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/pages/detail_hotel_page.dart';
// Pastikan kamu punya file ini
import '../../pages/custom_box_map.dart';

class ListPageMaps extends StatefulWidget {
  const ListPageMaps({super.key});

  @override
  State<ListPageMaps> createState() => _ListPageMapsState();
}

class _ListPageMapsState extends State<ListPageMaps> {
  final CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();

  MapType _mapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _mapType = _mapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  final List<Map<String, dynamic>> _listRumahSakit = [
    {
      'namaTempat': 'RSUP Dr. M. Djamil Padang',
      'gambar': 'assets/image_maps/rs_mdjamil.png',
      'harga': '-',
      'lat': -0.9431897240289424,
      'lng': 100.36695996574402,
      'rating': 4.6,
      'keterangan':
      "RSUP Dr. M. Djamil adalah rumah sakit rujukan utama di Sumatera Barat dan merupakan rumah sakit kelas A.",
    },
    {
      'namaTempat': 'RS Yos Sudarso Padang',
      'gambar': 'assets/image_maps/rs_yosodarso.jpg',
      'harga': '-',
      'lat': -0.955001,
      'lng': 100.365719,
      'rating': 4.3,
      'keterangan':
      'Rumah sakit swasta yang melayani pasien umum dan BPJS dengan berbagai layanan medis.',
    },
    {
      'namaTempat': 'RS Islam Ibnu Sina Padang',
      'gambar': 'assets/image_maps/rs_ibnusina.png',
      'harga': '-',
      'lat': -0.920534,
      'lng': 100.362343,
      'rating': 4.2,
      'keterangan':
      'RS Islam Ibnu Sina Padang merupakan rumah sakit swasta berbasis syariah dengan pelayanan medis yang lengkap dan nyaman.',
    },
    {
      'namaTempat': 'RS Bhayangkara Polda Sumbar',
      'gambar': 'assets/image_maps/rs_bhayangkara.png',
      'harga': '-',
      'lat': -0.938742,
      'lng': 100.369214,
      'rating': 4.0,
      'keterangan':
      'Rumah sakit milik Kepolisian Daerah Sumbar, melayani umum dan anggota Polri dengan berbagai fasilitas kesehatan.',
    },
    {
      'namaTempat': 'RSUP Universitas Andalas',
      'gambar': 'assets/image_maps/rs_unand.jpg',
      'harga': '-',
      'lat': -0.915831,
      'lng': 100.463792,
      'rating': 4.4,
      'keterangan':
      'Rumah sakit pendidikan milik Universitas Andalas dengan fasilitas modern dan layanan spesialis.',
    },
    {
      'namaTempat': 'RS Siti Rahmah Padang',
      'gambar': 'assets/image_maps/rs_sitirahmah.jpg',
      'harga': '-',
      'lat': -0.926877,
      'lng': 100.373554,
      'rating': 4.1,
      'keterangan':
      'RS Siti Rahmah adalah rumah sakit swasta yang berfokus pada pelayanan ibu dan anak serta bedah umum.',
    },
    {
      'namaTempat': 'RS Semen padang',
      'gambar': 'assets/image_maps/semenpadang.jpg',
      'harga': '-',
      'lat': -0.939417,
      'lng': 100.370372,
      'rating': 4.3,
      'keterangan':
      'Merupakan rumah sakit militer yang juga melayani pasien umum dengan fasilitas spesialistik.',
    },
    {
      'namaTempat': 'RS Aisyiyah Padang',
      'gambar': 'assets/image_maps/aisyiyah.jpg',
      'harga': '-',
      'lat': -0.927499,
      'lng': 100.371267,
      'rating': 4.0,
      'keterangan':
      'Rumah sakit swasta yang berafiliasi dengan organisasi Aisyiyah, melayani masyarakat umum dengan pendekatan islami.',
    },
    {
      'namaTempat': 'RS Hermina Padang',
      'gambar': 'assets/image_maps/rs_hermina.jpg',
      'harga': '-',
      'lat': -0.944582,
      'lng': 100.369321,
      'rating': 4.5,
      'keterangan':
      'Rumah sakit umum swasta nasional dengan berbagai layanan unggulan untuk ibu, anak, dan keluarga.',
    },
    {
      'namaTempat': 'RSUD Dr. Rasidin Padang',
      'gambar': 'assets/image_maps/rasidin.jpg',
      'harga': '-',
      'lat': -0.981423,
      'lng': 100.397114,
      'rating': 4.1,
      'keterangan':
      'Rumah sakit daerah milik pemerintah kota Padang dengan pelayanan BPJS dan umum.',
    },

  ];

  Set<Marker> _createMarker() {
    Set<Marker> markers = {};
    for (var rs in _listRumahSakit) {
      final LatLng koordinat = LatLng(rs['lat'], rs['lng']);
      markers.add(
        Marker(
          markerId: MarkerId(rs['namaTempat']),
          position: koordinat,
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              CustomBoxMap(
                gambar: rs['gambar'],
                namaTempat: rs['namaTempat'],
                rating: rs['rating'],
                harga: rs['harga'],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailHotelPage( // Ganti dengan halaman detail rumah sakit
                        nama: rs['namaTempat'],
                        gambar: rs['gambar'],
                        harga: rs['harga'],
                        rating: rs['rating'],
                        keterangan: rs['keterangan'],
                      ),
                    ),
                  );
                },
              ),
              koordinat,
            );
          },
        ),
      );
    }
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(-0.9294517008441783, 100.37253093611072),
              zoom: 12.8,
            ),
            mapType: _mapType,
            markers: _createMarker(),
            onMapCreated: (controller) {
              _customInfoWindowController.googleMapController = controller;
            },
            onTap: (position) => _customInfoWindowController.hideInfoWindow!(),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 200,
            offset: 50,
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: FloatingActionButton(
              onPressed: _onMapTypeButtonPressed,
              backgroundColor: Colors.green,
              child: _mapType == MapType.normal
                  ? Icon(Icons.map, color: Colors.white)
                  : Icon(Icons.satellite_alt, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
