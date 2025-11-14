import 'package:ffvii_app/version_widget.dart';
import 'package:ffvii_app/widgets/start/new_game.dart';
import 'package:ffvii_app/pages/saves_page.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.dark(surface: Colors.black),
        fontFamily: "Reactor7",
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 75),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => NewGameDialog(),
              ),
              child: Text(
                "NEW GAME?",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
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
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => VersionWidget(),
              ),
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset("assets/start-sword-large.png"),
            ),
          ],
        ),
      ),
    );
  }
}
