import 'package:ffvii_app/widgets/general/window_layout.dart';
import 'package:flutter/material.dart';

class SaveSlotsTopBar extends StatelessWidget {
  final double width;
  const SaveSlotsTopBar({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MenuBox(
          height: 40,
          width: width * 0.6,
          child: Text("Select a file.", style: TextStyle(fontSize: 18)),
        ),
        MenuBox(
          height: 40,
          width: width * 0.2,
          child: Text(
            "FILE",
            style: TextStyle(fontSize: 18, color: Colors.yellow),
          ),
        ),
        MenuBox(
          height: 40,
          width: width * 0.2,
          child: Text(
            "Load",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
