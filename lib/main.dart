import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.dark()),
      home: const MyHomePage(title: 'FFVII'),
      debugShowMaterialGrid: false,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentSave = "";
  int _currentRandom = 0;

  final _saveSlots = [
    "save 1 - Cloud",
    "save 2 - Cloud, Aeris, Tifa",
    "save 3 - Cloud, Red XII, Barret",
  ];

  void _randomSave() {
    var random = Random();
    int randomNum = random.nextInt(_saveSlots.length);
    while (randomNum == _currentRandom) {
      randomNum = random.nextInt(_saveSlots.length);
    }
    _currentRandom = randomNum;

    // update the state of the associated widget
    setState(() {
      _currentSave = _saveSlots[randomNum];
      print(_currentSave);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 143),
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(onPressed: _randomSave, child: Text("NEW GAME?")),
                TextButton(onPressed: _randomSave, child: Text("Continue")),
                // card below is used for debug purposes, will be removed
                Card(
                  color: const Color.fromARGB(255, 0, 0, 75),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${_currentSave}"),
                  ),
                ),
              ],
            ),
          ),
          Image.asset("assets/ff7-sword.png"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomSave,
        tooltip: 'reset',
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}
