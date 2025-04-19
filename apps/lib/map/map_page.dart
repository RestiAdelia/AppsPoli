import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  //tambahkan marker
  Set<Marker> marker = {};

  //sebuah method untuk menambahkan marker
  void _singleMarker() {
    marker.add(
      Marker(
        markerId: MarkerId("Tempat 1"),
        position: LatLng(-0.9229627079268188, 100.36212938528745),
        infoWindow: InfoWindow(title: "Kota Padang, Sumbar", snippet: 'Padang'),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _singleMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map Flutter')),
      body: GoogleMap(

        initialCameraPosition: CameraPosition(
          target: LatLng(-0.9229627079268188, 100.36212938528745),
          zoom: 16,
        ),
        markers: marker,
      ),
    );
  }
}