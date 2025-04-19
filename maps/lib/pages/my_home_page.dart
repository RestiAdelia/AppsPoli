import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/pages/detail_hotel_page.dart';
import 'custom_box_map.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();

  //tipe map
  MapType _mapType = MapType.normal;

  //style map
  String? _styleMap;

  //method klik
  void _onMapTypeButtonPressed() {
    setState(() {
      _mapType =
      _mapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  //method _loadfilestylemap
  Future<void> _loadFileStyleMap(String path) async {
    String style = await rootBundle.loadString(path);
    setState(() {
      _styleMap = style;
    });
  }

  //Standard
  void _standardStyle() => setState(() => _styleMap = null);
  //Dark
  void _darkStyle() => _loadFileStyleMap('assets/style_map/style_dark.json');
  //Retro
  void _retroStyle() => _loadFileStyleMap('assets/style_map/style_retro.json');

  final List<Map<String, dynamic>> _listHotel = [
    {
      'namaTempat': 'Whiz Prime Hotel Khatib Sulaiman Padang',
      'gambar': 'assets/images/hotel1.jpg',
      'harga': 'Rp.440.617',
      'lat': -0.9147098316700518,
      'lng': 100.36088842024157,
      'rating': 4.1,
      'keterangan':
      'Berada di jalan yang ramai dengan pertokoan dan restoran, hotel kontemporer ini berjarak 18 menit berjalan kaki dari Masjid Raya Sumatra Barat, dan 5 km baik dari Pantai Padang maupun Stasiun Padang.',
    },

    {
      'namaTempat': 'Surya Palace Syariah',
      'gambar': 'assets/images/hotel2.jpg',
      'harga': 'Rp.440.617',
      'lat': -0.920297999760722,
      'lng': 100.35801845233048,
      'rating': 4.1,
      'keterangan':
      'Berada di jalan yang ramai dengan pertokoan dan restoran, hotel kontemporer ini berjarak 18 menit berjalan kaki dari Masjid Raya Sumatra Barat, dan 5 km baik dari Pantai Padang maupun Stasiun Padang.',
    },
  ];

  Set<Marker> _createMarker() {
    Set<Marker> markers = {};
    for (var hotel in _listHotel) {
      final LatLng koordinat = LatLng(hotel['lat'], hotel['lng']);
      markers.add(
        Marker(
          markerId: MarkerId(hotel['namaTempat']),
          position: koordinat,
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              CustomBoxMap(
                gambar: hotel['gambar'],
                namaTempat: hotel['namaTempat'],
                rating: hotel['rating'],
                harga: hotel['harga'], onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => DetailHotelPage(
                    nama: hotel['namaTempat'],
                    gambar: hotel['gambar'],
                    harga: hotel['harga'],
                    rating: hotel['rating'],
                    keterangan: hotel['keterangan'],

                  )));
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
            //Tipe dari map : normal dan satellite
            mapType: _mapType,
            //Style Map
            style: _styleMap,
            //markers
            markers: _createMarker(),
            //controller
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
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: _onMapTypeButtonPressed,
                  backgroundColor: Colors.green,
                  child:
                  _mapType == MapType.normal
                      ? Icon(Icons.map, color: Colors.white)
                      : Icon(Icons.satellite_alt, color: Colors.white),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _standardStyle,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.sunny, color: Colors.white),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _darkStyle,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.dark_mode, color: Colors.black),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _retroStyle,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.location_city, color: Colors.yellow),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}