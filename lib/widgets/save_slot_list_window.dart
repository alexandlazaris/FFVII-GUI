import 'package:ffvii_app/widgets/save_slot_entry.dart';
import 'package:flutter/material.dart';

class SaveSlotListWindow extends StatelessWidget {
  const SaveSlotListWindow({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: 600,
      height: screenHeight * 0.8,
      child: SaveSlotEntry(),
    );
  }
}
