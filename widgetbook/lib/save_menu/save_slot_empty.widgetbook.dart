import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:ffvii_app/widgets/save_menu/save_slot_empty.dart';

@widgetbook.UseCase(name: 'Default', type: SaveSlotEmpty)
Widget buildCoolButtonUseCase(BuildContext context) {
  return SaveSlotEmpty();
}
