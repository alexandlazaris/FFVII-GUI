import 'package:ffvii_app/widgets/save_menu/save_slot_entry.dart';
import 'package:flutter/material.dart';

class SaveSlotListWindowDesktop extends StatelessWidget {
  const SaveSlotListWindowDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.8,
      width: 600,
      child: SaveSlotEntry(),
    );
  }
}

class SaveSlotListWindowMobile extends StatelessWidget {
  const SaveSlotListWindowMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: SaveSlotEntry());
  }
}
