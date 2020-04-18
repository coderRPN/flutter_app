import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/RPAppBar.dart';
import 'package:flutterapp/RandomPassword.dart';

void main() {
  runApp(MemorablePasswordGenerator());
}

class MemorablePasswordGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        primaryColorLight: Colors.deepPurple[100],
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.deepPurple,
          inactiveTrackColor: Colors.white70,
          trackShape: RectangularSliderTrackShape(disabledThumbGapWidth: 1),
          trackHeight: 5.0,
          thumbColor: Colors.deepPurple,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
          overlayColor: Colors.deepPurple.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 18.0),
          valueIndicatorColor: Colors.deepPurple,
        ),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String randomWord1 = '';
  String randomWord2 = '';
  String randomWord3 = '';
  String originalWord1;
  String originalWord2;
  String originalWord3;
  List wordList6;
  List wordList7;
  List wordList8;
  List wordList9;
  List wordList10;
  List wordList11;
  List wordList12;
  Random random;
  double greaterThanSlider = 6;
  bool specialCharsSwitch = false;
  bool numbersSwitch = false;
  bool mixedCaseSwitch = false;

  @override
  void initState() {
    super.initState();
    random = new Random();
    wordList6 = wordList7 = new List();
    wordList8 = new List();
    wordList9 = new List();
    wordList10 = new List();
    wordList11 = new List();
    wordList12 = new List();
    loadAssets();
  }

  void loadAssets() async {
    loadAsset('assets/words/words_6.txt', wordList6);
    loadAsset('assets/words/words_7.txt', wordList7);
    loadAsset('assets/words/words_8.txt', wordList8);
    loadAsset('assets/words/words_9.txt', wordList9);
    loadAsset('assets/words/words_10.txt', wordList10);
    loadAsset('assets/words/words_11.txt', wordList11);
    loadAsset('assets/words/words_12.txt', wordList12);
  }

  void loadAsset(String fileLocation, List list) async {
    rootBundle
        .loadString(fileLocation)
        .asStream()
        .transform(new LineSplitter())
        .listen((String line) => list.add(line), onDone: () {
      if (fileLocation == 'assets/words/words_6.txt') {
        setupWords(wordList6);
      }
    });
  }

  void getRandomWord() {
    setState(() {
      if (greaterThanSlider == 6) {
        setupWords(wordList6);
      } else if (greaterThanSlider == 7) {
        setupWords(wordList7);
      } else if (greaterThanSlider == 8) {
        setupWords(wordList8);
      } else if (greaterThanSlider == 9) {
        setupWords(wordList9);
      } else if (greaterThanSlider == 10) {
        setupWords(wordList10);
      } else if (greaterThanSlider == 11) {
        setupWords(wordList11);
      } else if (greaterThanSlider == 12) {
        setupWords(wordList12);
      } else if (greaterThanSlider == 13) {
        //TOD
        setupWords(wordList12);
      } else if (greaterThanSlider == 14) {
        //TOD
        setupWords(wordList12);
      } else if (greaterThanSlider == 15) {
        //TOD
        setupWords(wordList12);
      }
    });
  }

  void setupWords(List list) {
    randomWord1 = processList(list);
    randomWord2 = processList(list);
    randomWord3 = processList(list);
    originalWord1 = randomWord1;
    originalWord2 = randomWord2;
    originalWord3 = randomWord3;

    if (specialCharsSwitch) {
      replaceWithSpecialChars();
    }
  }

  void replaceWithSpecialChars() {
    randomWord1 = randomWord1.replaceFirst('a', '@');
    randomWord1 = randomWord1.replaceFirst('s', '\$');
    randomWord1 = randomWord1.replaceFirst('i', '!');
    randomWord1 = randomWord1.replaceFirst('o', '*');

    randomWord2 = randomWord2.replaceAll('a', '@');
    randomWord2 = randomWord2.replaceAll('s', '\$');
    randomWord2 = randomWord2.replaceAll('i', '!');
    randomWord2 = randomWord2.replaceAll('o', '*');

    randomWord3 = randomWord3.replaceAll('a', '@');
    randomWord3 = randomWord3.replaceAll('s', '\$');
    randomWord3 = randomWord3.replaceAll('i', '!');
    randomWord3 = randomWord3.replaceAll('o', '*');
  }

  void replaceWithOriginalWord() {
    randomWord1 = originalWord1;
    randomWord2 = originalWord2;
    randomWord3 = originalWord3;
  }

  String processList(List list) {
    return list.elementAt(random.nextInt(list.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) => Column(
          children: <Widget>[
            RPAppBar(),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                height: 18,
                                width: 18,
                                //color: Theme.of(context).primaryColor,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                height: 18,
                                width: 18,
//                                  color: Theme.of(context).primaryColor,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ],
                          ),
                          RandomPassword(randomWord: randomWord1),
                          RandomPassword(randomWord: randomWord2),
                          RandomPassword(randomWord: randomWord3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                height: 18,
                                width: 18,
//                                  color: Theme.of(context).primaryColor,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                height: 18,
                                width: 18,
//                                  color: Theme.of(context).primaryColor,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(35, 15, 23, 0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Length',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: 'Ariel',
                                    fontWeight: FontWeight.bold),
                              ),
                              Slider(
                                value: greaterThanSlider,
                                min: 6,
                                max: 15,
                                divisions: 9,
                                label: '${greaterThanSlider.toInt()}',
                                onChanged: (value) {
                                  setState(
                                    () {
                                      greaterThanSlider = value;
                                      getRandomWord();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Special Characters',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: 'Ariel',
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                value: specialCharsSwitch,
                                onChanged: (newValue) {
                                  setState(() {
                                    specialCharsSwitch = newValue;
                                    if (newValue) {
                                      replaceWithSpecialChars();
                                    } else {
                                      replaceWithOriginalWord();
                                    }
                                  });
                                },
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Numbers',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: 'Ariel',
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                value: numbersSwitch,
                                onChanged: (newValue) {
                                  setState(() {
                                    numbersSwitch = newValue;
                                  });
                                },
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Mixed Case',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: 'Ariel',
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                value: mixedCaseSwitch,
                                onChanged: (newValue) {
                                  setState(() {
                                    mixedCaseSwitch = newValue;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(35, 5, 35, 0),
                            child: RaisedButton(
                              color: Theme.of(context).primaryColor,
                              onPressed: getRandomWord,
                              child: Text(
                                'Generate',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Theme.of(context).primaryColorLight,
                                    fontFamily: 'Ariel',
                                    fontWeight: FontWeight.bold),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
