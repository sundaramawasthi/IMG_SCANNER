import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

import 'flatbutton.dart';

class language extends StatefulWidget {
  @override
  _languageState createState() => _languageState();
}

class _languageState extends State<language> {
  FlutterTts flutterTts = FlutterTts();
  GoogleTranslator translator = GoogleTranslator();
  String inputText = '';
  bool _loading = false;
  List<String> _translatedTexts = [];
  List<String> _languagesCode = [
    'en',
    'ru',
    'fr',
    'zh-cn',
    'hi',
    'de',
    'it',
    'es',
    'ja'
  ];
  Future translate() async {
    List<String> translatedTexts = [];
    setState(() {
      _loading = true;
    });
    for (String code in _languagesCode) {
      Translation translation = await translator.translate(inputText, to: code);
      String translatedText = translation.text;
      translatedTexts.add(translatedText);
    }
    setState(() {
      _translatedTexts = translatedTexts;
      _loading = false;
      print(_translatedTexts);
    });
  }

  Future speak(String languageCode, String text) async {
    await flutterTts.setLanguage(languageCode);
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translate & Speech'),
        centerTitle: true,
        backgroundColor: Color(0xffFFC100),
      ),
      body: Column(
        children: [
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(25),
              hintText: 'Enter Text...',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              filled: true,
              fillColor: Color(0xff263238),
              suffixIcon: _loading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.translate,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (inputText.isNotEmpty) translate();
                      },
                    ),
            ),
            onChanged: (input) {
              inputText = input;
            },
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                FlagButton(
                  text: _translatedTexts.isEmpty
                      ? 'English United States'
                      : _translatedTexts[0],
                  flag: 'united state.png',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('en-US', _translatedTexts[0]);
                  },
                ),
                FlagButton(
                  text: _translatedTexts.isEmpty
                      ? 'English United Kingdom'
                      : _translatedTexts[0],
                  flag: 'united .png',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('en-GB', _translatedTexts[0]);
                  },
                ),
                FlagButton(
                  text: _translatedTexts.isEmpty
                      ? 'Russian'
                      : _translatedTexts[1],
                  flag: 'russia.png',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('ru-RU', _translatedTexts[1]);
                  },
                ),
                FlagButton(
                  text:
                      _translatedTexts.isEmpty ? 'French' : _translatedTexts[2],
                  flag: 'france.png',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('fr-FR', _translatedTexts[2]);
                  },
                ),
                FlagButton(
                  text: _translatedTexts.isEmpty
                      ? 'Chinese'
                      : _translatedTexts[3],
                  flag: 'china.png',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('zh-CN', _translatedTexts[3]);
                  },
                ),
                FlagButton(
                  text:
                      _translatedTexts.isEmpty ? 'Hindi' : _translatedTexts[4],
                  flag: 'india.png',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('hi-IN', _translatedTexts[4]);
                  },
                ),
                FlagButton(
                  text:
                      _translatedTexts.isEmpty ? 'German' : _translatedTexts[5],
                  flag: 'zermany.png',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('de-DE', _translatedTexts[5]);
                  },
                ),
                FlagButton(
                  text: _translatedTexts.isEmpty
                      ? 'Italian'
                      : _translatedTexts[6],
                  flag: 'italy.png',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('it-IT', _translatedTexts[6]);
                  },
                ),
                FlagButton(
                  text: _translatedTexts.isEmpty
                      ? 'Spanish'
                      : _translatedTexts[7],
                  flag: 'spanish.jpg',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('es-ES', _translatedTexts[7]);
                  },
                ),
                FlagButton(
                  text: _translatedTexts.isEmpty
                      ? 'Japanese'
                      : _translatedTexts[8],
                  flag: 'jpan.jpg',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('ja-JP', _translatedTexts[8]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
