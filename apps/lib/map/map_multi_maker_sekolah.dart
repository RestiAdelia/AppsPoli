import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMultiMarkerPageSekolah extends StatefulWidget {
  const MapMultiMarkerPageSekolah({super.key});

  @override
  State<MapMultiMarkerPageSekolah> createState() => _MapMultiMarkerPageState();
}

class _MapMultiMarkerPageState extends State<MapMultiMarkerPageSekolah> {
  // Buat method menambahkan markers
  Set<Marker> _createMultiMarker() {
    Set<Marker> markers = {};

    // Marker Hotel
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
          title: 'Whiz Prime Hotel Khatib Sulaiman Padang',
          snippet: 'Whiz Prime Hotel',
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("Hotel Mercure Padang"),
        position: LatLng(-0.9281800859690038, 100.34906249448973),
        infoWindow: InfoWindow(
          title: 'Hotel Mercure Padang',
          snippet: 'Mercure Hotel',
        ),
      ),
    );

    // Marker Sekolah
    markers.add(
      Marker(
        markerId: MarkerId("SMAN 1 Padang"),
        position: LatLng(-0.934504, 100.360046),
        infoWindow: InfoWindow(
          title: 'SMAN 1 Padang',
          snippet: 'Sekolah Menengah Atas Negeri 1',
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("SMAN 2 Padang"),
        position: LatLng(-0.936784, 100.366313),
        infoWindow: InfoWindow(
          title: 'SMAN 2 Padang',
          snippet: 'Sekolah Menengah Atas Negeri 2',
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("SMAN 3 Padang"),
        position: LatLng(-0.934957, 100.356293),
        infoWindow: InfoWindow(
          title: 'SMAN 3 Padang',
          snippet: 'Sekolah Menengah Atas Negeri 3',
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("SMPN 1 Padang"),
        position: LatLng(-0.918283, 100.359501),
        infoWindow: InfoWindow(
          title: 'SMPN 1 Padang',
          snippet: 'Sekolah Menengah Pertama Negeri 1',
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("SMPN 5 Padang"),
        position: LatLng(-0.926057, 100.361114),
        infoWindow: InfoWindow(
          title: 'SMPN 5 Padang',
          snippet: 'Sekolah Menengah Pertama Negeri 5',
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("SDN 01 Padang"),
        position: LatLng(-0.925619, 100.358149),
        infoWindow: InfoWindow(
          title: 'SDN 01 Padang',
          snippet: 'Sekolah Dasar Negeri 01',
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("MAN 2 Padang"),
        position: LatLng(-0.938072, 100.368040),
        infoWindow: InfoWindow(
          title: 'MAN 2 Padang',
          snippet: 'Madrasah Aliyah Negeri 2',
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("SMA Adabiah Padang"),
        position: LatLng(-0.926314, 100.361251),
        infoWindow: InfoWindow(
          title: 'SMA Adabiah Padang',
          snippet: 'Sekolah Swasta Ternama',
        ),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("SMP Adabiah Padang"),
        position: LatLng(-0.926051, 100.361100),
        infoWindow: InfoWindow(
          title: 'SMP Adabiah Padang',
          snippet: 'Sekolah Swasta Menengah Pertama',
        ),
      ),
    );

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Markers"),
        backgroundColor: Colors.teal,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-0.919657792688955, 100.36256571324498),
          zoom: 14,
        ),
        markers: _createMultiMarker(),
      ),
    );
  }
}
