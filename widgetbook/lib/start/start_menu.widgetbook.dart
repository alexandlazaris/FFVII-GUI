import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:ffvii_app/widgets/start/new_game.dart';

@widgetbook.UseCase(name: 'Default', type: NewGameDialog)
Widget buildCoolButtonUseCase(BuildContext context) {
  return NewGameDialog();
}
