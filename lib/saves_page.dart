import 'package:ffvii_app/save_slot_widget.dart';
import 'package:flutter/material.dart';

class SavesPage extends StatelessWidget {
  const SavesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 75),
        title: Text("Saves"),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WindowLayout(
                textWidget: Text(
                  "Select a file.",
                  style: TextStyle(fontSize: 18),
                ),
                width: screenWidth * 0.6,
              ),
              WindowLayout(
                textWidget: Text(
                  "FILE 01",
                  style: TextStyle(fontSize: 18, color: Colors.yellow),
                ),
                width: screenWidth * 0.2,
              ),
              WindowLayout(
                textWidget: Text(
                  "Load",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                width: screenWidth * 0.2,
              ),
            ],
          ),
          // temp added below list view until I hook up fetching direct from API
          Expanded(
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                SaveSlotWidget(save: null),
                SaveSlotWidget(save: null),
                SaveSlotWidget(save: null),
                SaveSlotWidget(save: null),
                SaveSlotWidget(save: null),
                WindowLayout(
                  textWidget: Text("party", style: TextStyle(fontSize: 20)),
                  height: 250,
                  width: screenWidth * 0.6,
                ),
                WindowLayout(
                  textWidget: Text("party", style: TextStyle(fontSize: 20)),
                  height: 250,
                  width: screenWidth * 0.6,
                ),
                WindowLayout(
                  textWidget: Text("party", style: TextStyle(fontSize: 20)),
                  height: 250,
                  width: screenWidth * 0.6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WindowLayout extends StatelessWidget {
  const WindowLayout({
    super.key,
    this.textWidget,
    this.width,
    this.height,
    this.child,
  });

  final Text? textWidget;
  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: BoxBorder.all(
          style: BorderStyle.solid,
          width: 2.0,
          color: Color.fromARGB(255, 224, 221, 232),
        ),
        gradient: LinearGradient(
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
          colors: [
            Color.fromARGB(255, 0, 0, 143),
            Color.fromARGB(255, 0, 0, 75),
          ],
        ),
      ),
      child: textWidget,
    );
  }
}
