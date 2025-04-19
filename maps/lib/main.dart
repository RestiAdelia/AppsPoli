import 'package:flutter/material.dart';
import 'package:maps/list_maps/list_page.dart';
import 'package:maps/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Maps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Maps Application'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange, // Warna teks tombol
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Sudut tombol melengkung
                ),
                shadowColor: Colors.black, // Warna bayangan tombol
                elevation: 10, // Memberikan efek bayangan
              ),
              onPressed: () {
                // Arahkan ke MyHomePage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Text(
                'Maps',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12, // Ukuran teks
                ),
              ),
            ),
            SizedBox(height: 10), // Memberi jarak antara tombol
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange, // Warna teks tombol
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Sudut tombol melengkung
                ),
                shadowColor: Colors.black, // Warna bayangan tombol
                elevation: 10, // Memberikan efek bayangan
              ),
              onPressed: () {
                // Arahkan ke ListPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage()),
                );
              },
              child: Text(
                'List Maps Page',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12, // Ukuran teks
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
