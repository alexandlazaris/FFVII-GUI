import 'dart:async';
import 'package:ffvii_app/models/save.dart';
import 'package:ffvii_app/providers/saves_provider.dart';
import 'package:ffvii_app/save_slot_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavesConsumerWidget extends StatelessWidget {
  const SavesConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final asyncSaves = ref.watch(savesProvider);
        return asyncSaves.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
          data: (saves) {
            if (saves.isEmpty) {
              return const Center(child: Text('No saves found'));
            }
            return ListView.builder(
              itemCount: saves.length + 5,
              itemBuilder: (context, index) {
                if (index < saves.length) {
                  final Save s = saves[index];
                  return SaveSlotWidget(saveData: s);
                } else {
                  return Text("data");
                }
              },
            );
          },
        );
      },
    );
  }
}

class SavesPage extends StatelessWidget {
  const SavesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 75),
        title: Text("Saves"),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WindowLayout(
                textWidget: Text(
                  "Select a file.",
                  style: TextStyle(fontSize: 18),
                ),
                width: screenWidth * 0.6,
              ),
              WindowLayout(
                textWidget: Text(
                  "FILE 01",
                  style: TextStyle(fontSize: 18, color: Colors.yellow),
                ),
                width: screenWidth * 0.2,
              ),
              WindowLayout(
                textWidget: Text(
                  "Load",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                width: screenWidth * 0.2,
              ),
            ],
          ),
          Expanded(child: SavesConsumerWidget()),
        ],
      ),
    );
  }
}

class WindowLayout extends StatelessWidget {
  const WindowLayout({
    super.key,
    this.textWidget,
    this.width,
    this.height,
    this.child,
  });

  final Text? textWidget;
  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
      child: textWidget,
    );
  }
}
