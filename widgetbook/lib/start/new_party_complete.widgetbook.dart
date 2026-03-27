import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:ffvii_app/party/view/new_party_complete.dart';

@widgetbook.UseCase(name: 'Default', type: NewPartyComplete)
Widget buildCoolButtonUseCase(BuildContext context) {
  return NewPartyComplete();
}
