import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.grey,
        title: Text('Geleri'),
      ),
      //buat directory gambar
      //masukan gambar
      // update pu
      body: Center(
        child: Image.asset('gambar/logo_pnp.png'),
      ),
    );
  }
}