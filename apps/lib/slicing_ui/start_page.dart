import 'package:apps/slicing_ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:apps/slicing_ui/custome_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE95322),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("gambar/img_splash2.png"),
              Text("Lorem ipsum dolor sit amet, consetet",style: TextStyle(color: Colors.white),),
              CostumButton(bgColor: Color(0xffefc960),
                labelButton: "Login", onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>LoginPage()),
                  );
                },
                labelColor: Color(0xfff1ecd4),
                sizeButton: 0.5,
              ),
              SizedBox(height: 18),
              CostumButton(bgColor: Color(0xffF3E985),
                labelButton: "Register", onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>LoginPage()),
                  );
                },
                labelColor: Color(0xfff1ecd4),
                sizeButton: 0.5,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
