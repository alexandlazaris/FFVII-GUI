import 'package:ffvii_app/widgets/general/custom_cursor.dart';
import 'package:ffvii_app/widgets/save_menu/save_slot_entry.dart';
import 'package:flutter/material.dart';

class SaveSlotListWindowDesktop extends StatelessWidget {
  const SaveSlotListWindowDesktop({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: CustomCursorRegion(
          assetPath: 'assets/cursor-large.png',
          hotX: 10,
          hotY: 5,
          child: SaveSlotBuilderDesktop(),
        ),
      ),
    );
  }
}

class SaveSlotListWindowMobile extends StatelessWidget {
  const SaveSlotListWindowMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: SaveSlotBuilderMobile());
  }
}
