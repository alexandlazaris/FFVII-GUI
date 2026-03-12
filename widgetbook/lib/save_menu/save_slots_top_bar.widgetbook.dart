import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:ffvii_app/widgets/save_menu/save_slots_top_bar.dart';

@widgetbook.UseCase(name: 'Default', type: SaveSlotsTopBar)
Widget buildCoolButtonUseCase(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return SaveSlotsTopBar(width: screenWidth);
}
