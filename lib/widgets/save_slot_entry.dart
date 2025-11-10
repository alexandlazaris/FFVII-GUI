import 'package:ffvii_app/models/save.dart';
import 'package:ffvii_app/providers/saves_provider.dart';
import 'package:ffvii_app/widgets/save_slot_data.dart';
import 'package:ffvii_app/widgets/save_slot_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveSlotEntry extends StatelessWidget {
  const SaveSlotEntry({super.key});

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
              // TEMP: append some empty slots to show the empty save data widgets
              // TODO: logic to limit save slots length/pagination should be on BE, not in FE
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
