import 'package:flutter/material.dart';
import 'package:img_converter/splash_screen.dart';

import 'HOMEPAGE/myhomepage.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
