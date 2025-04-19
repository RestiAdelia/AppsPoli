import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/list_maps/detail_maps_rumah_sakit.dart';
import 'custome_box.dart';
import 'list_page.dart';

class MapScreen extends StatelessWidget {
  final LocationItem location;

  const MapScreen({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LatLng target = LatLng(location.latitude, location.longitude);

    return Scaffold(
      appBar: AppBar(title: Text(location.name)),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: target,
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: MarkerId(location.name),
            position: LatLng(location.latitude, location.longitude),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: CustomBoxMap(
                    name: location.name,
                    gambarAsset: location.gambarAsset,
                    rating: location.rating,
                    latitude: location.latitude,
                    longitude: location.longitude,
                    descripsi: location.descripsi,
                    onPressed: () {
                      Navigator.pop(context); // tutup dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailMapsRumahSakit(
                            name: location.name,
                            imageAsset: location.gambarAsset,
                            latitude: location.latitude,
                            longitude: location.longitude,
                            description: location.descripsi,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        },
      ),
    );
  }
}
