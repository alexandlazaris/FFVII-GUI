import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:ffvii_app/widgets/general/custom_cursor.dart';

@widgetbook.UseCase(name: 'Default', type: CustomCursorRegion)
Widget buildCoolButtonUseCase(BuildContext context) {
  return SizedBox(
    height: 50,
    width: 50,
    child: CustomCursorRegion(
      assetPath: 'assets/cursor-large.png',
      hotX: 10,
      hotY: 5,
    ),
  );
}
