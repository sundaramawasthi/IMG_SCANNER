//import 'package:barcode_scan/barcode_scan.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  void _launchURL() async {
    try {
      await launch(
        _url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } catch (e) {
      print(e);
    }
    // if (!await launch(_url)) throw 'Could not launch $_url';
  }

  String qrCodeResult = "Not Yet Scanned";
  String _url = 'https://flutter.dev';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "QR-CODE\nSCANNER",
            style: TextStyle(fontSize: 35),
          ),
        ),
        toolbarHeight: 100,
        actions: <Widget>[],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Image.asset('assets/qrscan.png'),
            ),
            Text(
              "Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: qrCodeResult != "Not Yet Scanned" ? _launchURL : () {},
              child: Text(
                qrCodeResult,
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              padding: const EdgeInsets.all(15.0),
              onPressed: () async {
                ScanResult codeSanner =
                    await BarcodeScanner.scan(); //barcode scanner
                setState(() {
                  qrCodeResult = codeSanner.rawContent;
                });
              },
              child: Text(
                "Open Scanner",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 3.0),
                  borderRadius: BorderRadius.circular(20.0)),
            )
          ],
        ),
      ),
    );
  }

  //its quite simple as that you can use try and catch staatements too for platform exception
}
