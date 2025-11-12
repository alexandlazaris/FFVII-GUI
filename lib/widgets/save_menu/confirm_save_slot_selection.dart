import 'package:ffvii_app/widgets/general/window_layout.dart';
import 'package:flutter/material.dart';

class ConfirmSaveSlotSelection extends StatelessWidget {
  const ConfirmSaveSlotSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuBox(
      height: 40,
      child: Align(
        alignment: Alignment.center,
        child: Text("Loading. Please wait."),
      ),
    );
  }
}

class SaveSlotLoadComplete extends StatelessWidget {
  const SaveSlotLoadComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: MenuBox(
        width: 100,
        height: 180,
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Success! You've reached the end of the FF7 Flutter app demo.\n\nLoading party data, setting materia, customizing party members & so much more is on the way. \n\nThere ain't no gettin' offa this train!",
          ),
        ),
      ),
    );
  }
}
