import 'package:flutter/material.dart';

class FlexibleGenericWindow extends StatelessWidget {
  final Widget? child;

  const FlexibleGenericWindow({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
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
        child: child,
      ),
    );
  }
}
