import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:ffvii_app/widgets/save_menu/save_slot_entry.dart';

@widgetbook.UseCase(name: 'Default', type: SaveSlotBuilderDesktop)
Widget buildCoolButtonUseCase(BuildContext context) {
  return SaveSlotBuilderDesktop();
}

@widgetbook.UseCase(name: 'Default', type: SaveSlotBuilderMobile)
Widget buildCoolButtonUseCase2(BuildContext context) {
  return SaveSlotBuilderMobile();
}
