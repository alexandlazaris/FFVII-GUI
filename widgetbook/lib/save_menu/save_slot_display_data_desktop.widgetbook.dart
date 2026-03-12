import 'package:ffvii_app/models/save.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:ffvii_app/widgets/save_menu/save_slot_display_data_desktop.dart';

var mockPartyLeadData = PartyLead(level: 47, name: "cid");
var mockSaveData = Save(
  id: "1",
  location: "Mideel",
  party: ["cid", "cloud", "tifa"],
  partyLead: mockPartyLeadData,
);

@widgetbook.UseCase(name: 'Default', type: SaveSlotDisplayDataDesktop)
Widget buildCoolButtonUseCase(BuildContext context) {
  return SaveSlotDisplayDataDesktop(saveData: mockSaveData);
}
