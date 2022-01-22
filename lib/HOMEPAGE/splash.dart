import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'myhomepage.dart';

class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IMGAGE_SCANNER",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: SplashScreenView(
        duration: 50,
        navigateRoute: MyHomePage(),
        text: "WELCOME \n IMAGE SCANNER...\n  ",
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
          fontSize: 20,
        ),
        imageSrc: 'assets/WELCOME.jpg',
        imageSize: 120,
        backgroundColor: Colors.white,
        textType: TextType.TyperAnimatedText,
      ),
    );
  }
}
