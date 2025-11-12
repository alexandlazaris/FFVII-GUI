import 'package:flutter/material.dart';
import 'package:custom_mouse_cursor/custom_mouse_cursor.dart';

class CustomCursorRegion extends StatelessWidget {
  final String assetPath;
  final double hotX;
  final double hotY;
  final Widget? child;

  const CustomCursorRegion({
    Key? key,
    required this.assetPath,
    this.hotX = 0,
    this.hotY = 0,
    this.child,
  }) : super(key: key);

  Future<CustomMouseCursor> _loadCursor() {
    return CustomMouseCursor.asset(
      assetPath,
      hotX: hotX.toInt(),
      hotY: hotY.toInt(),
      useExactAssetImage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CustomMouseCursor>(
      future: _loadCursor(),
      builder: (context, snapshot) {
        final cursor = snapshot.data ?? SystemMouseCursors.basic;
        return MouseRegion(cursor: cursor, child: child);
      },
    );
  }
}
