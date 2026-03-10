import 'package:ffvii_app/models/save.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:ffvii_app/widgets/save_menu/save_slot_mobile.dart';

var mockPartyLeadData = PartyLead(level: 99, name: "cloud");
var mockSaveData = Save(
  id: "1",
  location: "Mideel",
  party: ["cloud"],
  partyLead: mockPartyLeadData,
);

@widgetbook.UseCase(name: 'Default', type: SaveSlotMobile)
Widget buildCoolButtonUseCase(BuildContext context) {
  return SaveSlotMobile(saveData: mockSaveData);
}
