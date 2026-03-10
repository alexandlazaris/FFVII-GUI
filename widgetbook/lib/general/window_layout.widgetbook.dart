import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:ffvii_app/widgets/general/window_layout.dart';

@widgetbook.UseCase(name: 'Default', type: MenuBox)
Widget buildCoolButtonUseCase(BuildContext context) {
  return MenuBox(height: 100, width: 200);
}
