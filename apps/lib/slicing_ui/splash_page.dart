import 'package:apps/slicing_ui/start_page.dart';
import 'package:apps/slicing_ui/start_page.dart';
import 'package:flutter/material.dart';
import 'package:apps/slicing_ui/custome_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5CB58),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("gambar/img_splash.png"),
              CostumButton(bgColor: Color(0xffede069),
                labelButton: "Mulai", onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>StartPage()),
                  );
                }, labelColor: Color(0xfff6f6f5),
              sizeButton: 0.5,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
