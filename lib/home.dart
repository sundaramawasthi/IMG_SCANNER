import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  String result = "";
  File? images;
  ImagePicker imagePicker = ImagePicker();
  bool resultWaiting = false;
  capturefromgallary() async {
    PickedFile? pickedFile =
        await imagePicker.getImage(source: ImageSource.gallery);
    images = File(pickedFile!.path);
    setState(() {
      images;
      result = "";
      resultWaiting = true;
    });

    result = await textfromimg();

    setState(() {
      result;
      resultWaiting = false;
    });
  }

  capturefromCamera() async {
    PickedFile? pickedFile =
        await imagePicker.getImage(source: ImageSource.camera);
    images = File(pickedFile!.path);
    setState(() {
      images;
      result = "";
      resultWaiting = true;
    });

    result = await textfromimg();

    setState(() {
      result;
      resultWaiting = false;
    });
  }

  Future<String> textfromimg() async {
    String resultStr = "";
    final GoogleVisionImage visionImage = GoogleVisionImage.fromFile(images!);

    final BarcodeDetector barcodeDetector =
        GoogleVision.instance.barcodeDetector();
    final FaceDetector faceDetector = GoogleVision.instance.faceDetector();
    final ImageLabeler labeler = GoogleVision.instance.imageLabeler();
    final TextRecognizer textRecognizer =
        GoogleVision.instance.textRecognizer();

    final VisionText visionText =
        await textRecognizer.processImage(visionImage);

    String? text = visionText.text;
    for (TextBlock block in visionText.blocks) {
      final Rect? boundingBox = block.boundingBox;
      final List<Offset> cornerPoints = block.cornerPoints;
      final String? text = block.text;
      final List<RecognizedLanguage> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock

        print(line.text);
        resultStr += line.text! + "\n";
        // for (TextElement element in line.elements) {
        //   print(element.text!);
        //   resultStr += element.text!;
        // }
      }
    }

    barcodeDetector.close();
    faceDetector.close();
    labeler.close();
    textRecognizer.close();
    return resultStr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    width: 100,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 2 / 3,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: EdgeInsets.only(top: 40),
                    child: resultWaiting == false
                        ? SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                result,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          )
                        : Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                                Text(
                                  'Loading...',
                                ),
                              ],
                            ),
                          ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/write4.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.only(top: 20.0, right: 120.0),
                    child: Stack(
                      children: [
                        Center(
                          child: FlatButton(
                            onPressed: () {
                              capturefromgallary();
                            },
                            onLongPress: () {
                              capturefromCamera();
                            },
                            child: Container(
                              //margin: EdgeInsets.only(top: 25),
                              child: images != null
                                  ? Image.file(
                                      images!,
                                      width: 140,
                                      height: 192,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(
                                      'assets/insert.png',
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              4,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
