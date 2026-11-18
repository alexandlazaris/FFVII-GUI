import 'package:ffvii_app/auth/view/signin_page.dart';
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
      body: SignInScreen(),
    );
  }
}
