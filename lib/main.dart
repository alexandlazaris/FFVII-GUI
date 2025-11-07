import 'dart:math';

import 'package:ffvii_app/saves_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.dark()),
      home: const MyHomePage(title: 'FFVII'),
      debugShowMaterialGrid: false,
      showPerformanceOverlay: false,
      // TODO: make an in-app button to toggle these values
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

    setState(() {
      _currentSave = _saveSlots[randomNum];
      print(_currentSave);
    });
  }

  @override
  Widget build(BuildContext context) {
    _currentSave = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 75),
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: _randomSave,
            child: Text("NEW GAME?", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SavesPage();
                  },
                ),
              );
            },
            child: Text("Continue", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/ff7-sword.png"),
          ),
        ],
      ),
    );
  }
}
