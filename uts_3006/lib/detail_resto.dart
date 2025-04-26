
import 'package:flutter/material.dart';

import 'my_home_page.dart';

class DetailResto extends StatelessWidget {
  final LocationItem location;

  const DetailResto({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(location.gambar),
            SizedBox(height: 16),
            Text(
              location.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: List.generate(5, (i) {
                return Icon(
                  i < location.rating.floor()
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.orange,
                );
              }),
            ),
            SizedBox(height: 8),
            Text(
              'Rating: ${location.rating}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Status: ${location.status}',
              style: TextStyle(
                fontSize: 16,
                color: location.status.toLowerCase() == "buka"
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
