import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
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
        navigateRoute: home(),
        text: "LOADING...\n IMAGE_SCANNER ",
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
          fontSize: 20,
        ),
        imageSrc: 'assets/logo.png',
        imageSize: 140,
        backgroundColor: Colors.white,
        textType: TextType.TyperAnimatedText,
      ),
    );
  }
}
