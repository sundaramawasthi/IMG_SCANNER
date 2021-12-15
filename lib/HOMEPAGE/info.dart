import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text(
          "ABOUT US",
          style: TextStyle(fontSize: 40),
        ),
        toolbarHeight: 100,
      ),
      body: SafeArea(
        child: Text(
          "info page",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
