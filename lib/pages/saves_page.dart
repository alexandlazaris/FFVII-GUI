import 'package:ffvii_app/widgets/save_menu/save_slot_list_window.dart';
import 'package:ffvii_app/widgets/save_menu/save_slots_top_bar.dart';
import 'package:flutter/material.dart';

class SavesPage extends StatelessWidget {
  const SavesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 75),
        title: Text("Saves"),
      ),
      body: Column(
        children: [
          SaveSlotsTopBar(width: _screenWidth),
          _screenWidth >= 600
              ? SaveSlotListWindowDesktop()
              : SaveSlotListWindowMobile(),
        ],
      ),
    );
  }
}
