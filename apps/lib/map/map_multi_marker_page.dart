import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMultiMarkerPage extends StatefulWidget {
  const MapMultiMarkerPage({super.key});

  @override
  State<MapMultiMarkerPage> createState() => _MapMultiMarkerPageState();
}

class _MapMultiMarkerPageState extends State<MapMultiMarkerPage> {
  //buat method menambahkan markers
  Set<Marker> _createMultiMarker() {
    Set<Marker> markers = {};
    markers.add(
      Marker(
        markerId: MarkerId("New d’Dhave Hotel"),
        position: LatLng(-0.8918931079801747, 100.36248881555795),
        infoWindow: InfoWindow(
          title: 'New d’Dhave Hotel, kota padang, sumbar',
          snippet: 'New d’Dhave Hotel',
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("Whiz Prime Hotel Khatib Sulaiman Padang"),
        position: LatLng(-0.9074401027195745, 100.35666813075035),
        infoWindow: InfoWindow(
          title: 'Whiz Prime Hotel Khatib Sulaiman Padang, kota padang, sumbar',
          snippet: 'Whiz Prime Hotel Khatib Sulaiman Padang',
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("Hotel Mercure Padang"),
        position: LatLng(-0.9281800859690038, 100.34906249448973),
        infoWindow: InfoWindow(
          title: 'Hotel Mercure Padang, kota padang, sumbar',
          snippet: 'Hotel Mercure Padang',
        ),
      ),
    );
    return markers;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createMultiMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi Markers"),),
      body: GoogleMap(initialCameraPosition: CameraPosition(target:
      LatLng(-0.919657792688955, 100.36256571324498),
      zoom: 16)),
    );
  }
}