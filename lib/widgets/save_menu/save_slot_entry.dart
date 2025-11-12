import 'package:ffvii_app/models/save.dart';
import 'package:ffvii_app/providers/saves_provider.dart';
import 'package:ffvii_app/widgets/save_menu/save_slot_data.dart';
import 'package:ffvii_app/widgets/save_menu/save_slot_display_data_desktop.dart';
import 'package:ffvii_app/widgets/save_menu/save_slot_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveSlotBuilderDesktop extends StatelessWidget {
  const SaveSlotBuilderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final asyncSaves = ref.watch(savesProvider);
        return asyncSaves.when(
          // TODO: implement memory card loader effect whilst data is being fetched
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
          data: (saves) {
            return ListView.builder(
              // TEMP: append some empty
              //slots to show the empty save data widgets
              // TODO: logic to limit save slots length/pagination should be on BE, not in FE
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) {
                if (index < saves.length) {
                  final Save s = saves[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: SaveSlotDisplayDataDesktop(saveData: s),
                  );
                } else {
                  return SaveSlotEmpty();
                }
              },
            );
          },
        );
      },
    );
  }
}

class SaveSlotBuilderMobile extends StatelessWidget {
  const SaveSlotBuilderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final asyncSaves = ref.watch(savesProvider);
        return asyncSaves.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
          data: (saves) {
            return ListView.builder(
              // TEMP: append some empty
              //slots to show the empty save data widgets
              // TODO: logic to limit save slots length/pagination should be on BE, not in FE
              shrinkWrap: true,
              itemCount: saves.length + 5,
              itemBuilder: (context, index) {
                if (index < saves.length) {
                  final Save s = saves[index];
                  return SaveSlotData(saveData: s);
                } else {
                  return SaveSlotEmpty();
                }
              },
            );
          },
        );
      },
    );
  }
}
