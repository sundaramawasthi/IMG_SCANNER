import 'package:flutter/material.dart';

class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "  ABOUT ME",
            style: TextStyle(fontSize: 30),
          ),
          toolbarHeight: 100,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // USE MAXAXISALIGNMENT TOO ADD A CENTER
            children: const [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                    'assets/sundram.jpg'), // USE ASSETIMAGE TO USE A LOCAL IMAGE
              ),
              Text(
                'Sundram_Awasthi', //  USE TEXT TO EXT SOMETHING
                style: TextStyle(
                  // USE A TEXTSTYLE TO STYLE A TEXT
                  fontFamily: 'Pacifico',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Flutter developer',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                // USE OF SIZEDBOX TO ADD A SPACE
                height: 20.0,
                width: 150.0,
                child: Divider(color: Colors.black),
              ),
              Card(
                color: Colors.blue,
                margin: EdgeInsets.symmetric(vertical: 9, horizontal: 30.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  title: Text(
                    '  maintosundram@gmail.com ',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.blue,
                margin: EdgeInsets.symmetric(vertical: 9, horizontal: 30.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  title: Text(
                    '  CONNECT ME ON LINKEDIN ',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
