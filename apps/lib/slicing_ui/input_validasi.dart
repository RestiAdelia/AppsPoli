import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String birthDate;

  const ProfilePage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: $name", style: TextStyle(fontSize: 18)),
            Text("Email: $email", style: TextStyle(fontSize: 18)),
            Text("Phone: $phone", style: TextStyle(fontSize: 18)),
            Text("Birth Date: $birthDate", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
