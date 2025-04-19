import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPnp extends StatefulWidget {
  const MapPnp({super.key});

  @override
  State<MapPnp> createState() => _MapPnpState();
}

class _MapPnpState extends State<MapPnp> {
  //tambahkan marker
  Set<Marker> marker = {};

  //sebuah method untuk menambahkan marker
  void _singleMarker() {
    marker.add(
      Marker(
        markerId: MarkerId("Kampus"),
        position: LatLng(-0.9143211672688375, 100.46612953714727),
        infoWindow: InfoWindow(title: "Politeknik negri padang", snippet: 'Padang'),
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
          target: LatLng(-0.9143211672688375, 100.46612953714727),
          zoom: 16,
        ),
        markers: marker,
      ),
    );
  }
}