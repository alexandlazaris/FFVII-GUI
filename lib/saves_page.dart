import 'package:ffvii_app/widgets/save_slot_list_window.dart';
import 'package:ffvii_app/widgets/window_layout.dart';
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
          SaveSlotListWindow(),
        ],
      ),
    );
  }
}
