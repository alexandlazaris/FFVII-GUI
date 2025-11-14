import 'package:ffvii_app/widgets/general/window_layout.dart';
import 'package:flutter/material.dart';

class ConfirmSaveSlotSelection extends StatelessWidget {
  const ConfirmSaveSlotSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuBox(
      height: 50,
      width: 200,
      child: Align(
        alignment: Alignment.center,
        child: Text("Loading. Please wait.", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class SaveSlotLoadComplete extends StatelessWidget {
  const SaveSlotLoadComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 400),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: MenuBox(
              child: Text(
                textAlign: TextAlign.center,
                "Success! You've reached the end of the FF7 Flutter app demo.\n\nLoading party data, setting materia, customizing party members & so much more is on the way. \n\nThere ain't no gettin' offa this train!",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
