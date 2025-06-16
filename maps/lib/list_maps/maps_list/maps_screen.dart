import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../list_page.dart';


 // Pastikan ini mengarah ke file yang benar

class MapScreenMaps extends StatefulWidget {
  final List<LocationItem> locations;

  const MapScreenMaps({Key? key, required this.locations}) : super(key: key);

  @override
  State<MapScreenMaps> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreenMaps> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _setMarkers();
  }

  void _setMarkers() {
    for (var location in widget.locations) {
      _markers.add(
        Marker(
          markerId: MarkerId(location.name),
          position: LatLng(location.latitude, location.longitude),
          infoWindow: InfoWindow(
            title: location.name,
            snippet: location.harga,
            onTap: () {
              // Navigasi ke detail jika diinginkan
              _showBottomDetail(location);
            },
          ),
        ),
      );
    }
  }

  void _showBottomDetail(LocationItem location) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            Image.asset(location.gambarAsset, height: 100, fit: BoxFit.cover),
            SizedBox(height: 8),
            Text("Harga: ${location.harga}"),
            Text("Rating: ${location.rating}"),
            Text("Deskripsi:"),
            Text(location.descripsi, maxLines: 3, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lokasi Rumah Sakit"),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.locations[0].latitude, widget.locations[0].longitude),
          zoom: 13,
        ),
        markers: _markers,
      ),
    );
  }
}
