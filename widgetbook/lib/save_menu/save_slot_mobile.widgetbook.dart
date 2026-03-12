import 'package:ffvii_app/models/save.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:ffvii_app/widgets/save_menu/save_slot_mobile.dart';

var mockPartyLeadData = PartyLead(level: 20, name: "barret");
var mockSaveData = Save(
  id: "1",
  location: "Midgar area",
  party: ["barret"],
  partyLead: mockPartyLeadData,
);

@widgetbook.UseCase(name: 'Default', type: SaveSlotMobile)
Widget buildCoolButtonUseCase(BuildContext context) {
  return Center(
    child: SizedBox(width: 500, child: SaveSlotMobile(saveData: mockSaveData)),
  );
}
