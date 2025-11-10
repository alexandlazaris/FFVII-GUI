import 'package:flutter/material.dart';

class SaveSlotEmpty extends StatelessWidget {
  const SaveSlotEmpty({super.key, this.width, this.child});

  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      width: screenWidth * 0.2,
      height: 120,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: BoxBorder.all(
          style: BorderStyle.solid,
          width: 2.0,
          color: Color.fromARGB(255, 224, 221, 232),
        ),
        gradient: LinearGradient(
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
          colors: [
            Color.fromARGB(255, 0, 0, 143),
            Color.fromARGB(255, 0, 0, 75),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 400),
        child: Text(
          "EMPTY",
          style: TextStyle(fontSize: 20, color: Colors.yellowAccent),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
