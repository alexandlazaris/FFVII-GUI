import 'package:ffvii_app/widgets/general/window_layout.dart';

import 'package:flutter/material.dart';

class NewGameDialog extends StatelessWidget {
  const NewGameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: MenuBox(
        height: 50,
        width: 200,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.center,
            "NEW GAME is coming soon.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: "Reactor7",
            ),
          ),
        ),
      ),
    );
  }
}
