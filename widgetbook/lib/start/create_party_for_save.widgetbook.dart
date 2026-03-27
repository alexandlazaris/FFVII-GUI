import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from your app
import 'package:ffvii_app/party/view/create_party_for_save.dart';

@widgetbook.UseCase(name: 'Default', type: CreatePartyForSave)
Widget buildCoolButtonUseCase(BuildContext context) {
  return CreatePartyForSave(saveId: "1");
}
