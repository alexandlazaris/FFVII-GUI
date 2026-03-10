import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:ffvii_app/widgets/save_menu/save_slot_list_window.dart';

@widgetbook.UseCase(name: 'Default', type: SaveSlotListWindowDesktop)
Widget buildCoolButtonUseCase(BuildContext context) {
  return SaveSlotListWindowDesktop();
}

@widgetbook.UseCase(name: 'Default', type: SaveSlotListWindowMobile)
Widget buildCoolButtonUseCase2(BuildContext context) {
  return SaveSlotListWindowMobile();
}
