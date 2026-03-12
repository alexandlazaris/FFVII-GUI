import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:ffvii_app/widgets/save_menu/confirm_save_slot_selection.dart';

@widgetbook.UseCase(name: 'Default', type: ConfirmSaveSlotSelection)
Widget buildCoolButtonUseCase(BuildContext context) {
  return ConfirmSaveSlotSelection();
}

@widgetbook.UseCase(name: 'Default', type: SaveSlotLoadComplete)
Widget buildCoolButtonUseCase2(BuildContext context) {
  return SaveSlotLoadComplete();
}
