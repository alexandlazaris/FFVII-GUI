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
import 'package:widgetbook_ffvii/general/custom_cursor.widgetbook.dart'
    as _widgetbook_ffvii_general_custom_cursor_widgetbook;
import 'package:widgetbook_ffvii/general/window_layout.widgetbook.dart'
    as _widgetbook_ffvii_general_window_layout_widgetbook;
import 'package:widgetbook_ffvii/save_menu/confirm_save_slot_selection.widgetbook.dart'
    as _widgetbook_ffvii_save_menu_confirm_save_slot_selection_widgetbook;
import 'package:widgetbook_ffvii/save_menu/save_slot_display_data_desktop.widgetbook.dart'
    as _widgetbook_ffvii_save_menu_save_slot_display_data_desktop_widgetbook;
import 'package:widgetbook_ffvii/save_menu/save_slot_empty.widgetbook.dart'
    as _widgetbook_ffvii_save_menu_save_slot_empty_widgetbook;
import 'package:widgetbook_ffvii/save_menu/save_slot_mobile.widgetbook.dart'
    as _widgetbook_ffvii_save_menu_save_slot_mobile_widgetbook;
import 'package:widgetbook_ffvii/save_menu/save_slots_top_bar.widgetbook.dart'
    as _widgetbook_ffvii_save_menu_save_slots_top_bar_widgetbook;
import 'package:widgetbook_ffvii/start/create_party_for_save.widgetbook.dart'
    as _widgetbook_ffvii_start_create_party_for_save_widgetbook;
import 'package:widgetbook_ffvii/start/new_party_complete.widgetbook.dart'
    as _widgetbook_ffvii_start_new_party_complete_widgetbook;
import 'package:widgetbook_ffvii/start/start_menu.widgetbook.dart'
    as _widgetbook_ffvii_start_start_menu_widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'party',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'view',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'CreatePartyForSave',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _widgetbook_ffvii_start_create_party_for_save_widgetbook
                        .buildCoolButtonUseCase,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'NewPartyComplete',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder: _widgetbook_ffvii_start_new_party_complete_widgetbook
                    .buildCoolButtonUseCase,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'general',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'CustomCursorRegion',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder: _widgetbook_ffvii_general_custom_cursor_widgetbook
                    .buildCoolButtonUseCase,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'MenuBox',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder: _widgetbook_ffvii_general_window_layout_widgetbook
                    .buildCoolButtonUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'save_menu',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'ConfirmSaveSlotSelection',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _widgetbook_ffvii_save_menu_confirm_save_slot_selection_widgetbook
                        .buildCoolButtonUseCase,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'SaveSlotDisplayDataDesktop',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _widgetbook_ffvii_save_menu_save_slot_display_data_desktop_widgetbook
                        .buildCoolButtonUseCase,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'SaveSlotEmpty',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder: _widgetbook_ffvii_save_menu_save_slot_empty_widgetbook
                    .buildCoolButtonUseCase,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'SaveSlotLoadComplete',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _widgetbook_ffvii_save_menu_confirm_save_slot_selection_widgetbook
                        .buildCoolButtonUseCase2,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'SaveSlotMobile',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder: _widgetbook_ffvii_save_menu_save_slot_mobile_widgetbook
                    .buildCoolButtonUseCase,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'SaveSlotsTopBar',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _widgetbook_ffvii_save_menu_save_slots_top_bar_widgetbook
                        .buildCoolButtonUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'start',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'NewGameDialog',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder: _widgetbook_ffvii_start_start_menu_widgetbook
                    .buildCoolButtonUseCase,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
