import 'package:ffvii_app/models/save.dart';
import 'package:ffvii_app/widgets/save_menu/save_slot_display_data_desktop.dart';
import 'package:ffvii_app/widgets/save_menu/save_slot_mobile.dart';
import 'package:flutter/material.dart';

class SaveSlotData extends StatefulWidget {
  final Save saveData;
  const SaveSlotData({super.key, required this.saveData});

  @override
  State<SaveSlotData> createState() => _SaveSlotWidgetState();
}

class _SaveSlotWidgetState extends State<SaveSlotData> {
  @override
  Widget build(BuildContext context) {
    return SaveSlotMobile(saveData: widget.saveData);
    // TODO: desktop needs refactoring, loading only mobile for now
    //   builder: (BuildContext context, BoxConstraints constraints) {
    //     if (constraints.maxWidth > 600) {
    //       return SaveSlotDesktop(saveData: widget.saveData);
    //     } else {
    //       return SaveSlotMobile(saveData: widget.saveData);
    //     }
    //   },
  }
}
