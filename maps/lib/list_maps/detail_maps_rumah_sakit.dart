import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailMapsRumahSakit extends StatelessWidget {
  final String name, harga;
  final String imageAsset;
  final double latitude;
  final double longitude;
  final String description;

  const DetailMapsRumahSakit({
    Key? key,
    required this.name,
    required this.imageAsset,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LatLng target = LatLng(latitude, longitude);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(name, style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
              child: Image.asset(
                imageAsset,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Lat: $latitude, Lng: $longitude'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(harga, style: TextStyle(fontSize: 16)),
                  Text(description, style: TextStyle(fontSize: 16)),

                  SizedBox(height: 20),
                  // Google Map View
                  SizedBox(
                    height: 300,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: target,
                        zoom: 16,
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId(name),
                          position: target,
                          infoWindow: InfoWindow(title: name),
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
