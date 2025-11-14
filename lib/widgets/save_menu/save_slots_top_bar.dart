import 'package:ffvii_app/widgets/general/window_layout.dart';
import 'package:flutter/material.dart';

class SaveSlotsTopBar extends StatelessWidget {
  final double width;
  const SaveSlotsTopBar({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MenuBox(
          height: 40,
          width: width * 0.6,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Select a file.",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Reactor7",
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        MenuBox(
          height: 40,
          width: width * 0.2,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "FILE",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontFamily: "Reactor7",
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        MenuBox(
          height: 40,
          width: width * 0.2,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Load",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Reactor7",
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
