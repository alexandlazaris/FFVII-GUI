import 'package:ffvii_app/saves_page.dart';
import 'package:flutter/material.dart';

class SaveSlotWidget extends StatefulWidget {
  const SaveSlotWidget({super.key, required this.save});

  final Object? save;

  @override
  State<SaveSlotWidget> createState() => _SaveSlotWidgetState();
}

class _SaveSlotWidgetState extends State<SaveSlotWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  "assets/profile-cloud.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  "assets/profile-caitsith.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3, right: 3),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  "assets/profile-barret.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("Cloud"), Text("Level 47")],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: WindowLayout(
                                  width: 120,
                                  textWidget: Text("Time 30:30\nGil 47957"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: WindowLayout(
                      width: double.infinity,
                      textWidget: Text(
                        "Rocket Launch Pad Area",
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
