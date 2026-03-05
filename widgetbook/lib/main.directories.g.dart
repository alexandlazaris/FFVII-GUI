// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgetbook_ffvii/start_menu.dart'
    as _widgetbook_ffvii_start_menu;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'start',
        children: [
          _widgetbook.WidgetbookLeafComponent(
            name: 'NewGameDialog',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder: _widgetbook_ffvii_start_menu.buildCoolButtonUseCase,
            ),
          ),
        ],
      ),
    ],
  ),
];
