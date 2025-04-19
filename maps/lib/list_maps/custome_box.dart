import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomBoxMap extends StatelessWidget {
  final String name, gambarAsset;
  final double latitude, longitude, rating;
  final VoidCallback onPressed;

  const CustomBoxMap({
    super.key,
    required this.name,
    required this.gambarAsset,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.onPressed,
    required String descripsi,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ganti Expanded dengan SizedBox
          SizedBox(
            height: 120,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                gambarAsset,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$rating',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 5),
                    RatingBarIndicator(
                      rating: rating,
                      itemBuilder: (context, index) =>
                          Icon(Icons.star, color: Colors.amber),
                      itemCount: 5,
                      itemSize: 14,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                SizedBox(height: 8),

                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                      onPressed:(){
                        onPressed.call();
                      },
                      child: Text('VIEW'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
