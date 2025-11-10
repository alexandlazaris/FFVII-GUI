import 'package:ffvii_app/models/save.dart';
import 'package:ffvii_app/widgets/window_layout.dart';
import 'package:flutter/material.dart';

class SaveSlotData extends StatefulWidget {
  final Save saveData;
  const SaveSlotData({super.key, required this.saveData});

  @override
  State<SaveSlotData> createState() => _SaveSlotWidgetState();
}

class _SaveSlotWidgetState extends State<SaveSlotData> {
  @override
  Widget build(BuildContext context) {
    final leadName = widget.saveData.partyLead?.name ?? "cloud";
    final leadLevel = widget.saveData.partyLead?.level.toString() ?? "1";
    final location = widget.saveData.location;
    final List<String> partyList = widget.saveData.party;

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
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                ...partyList
                    .take(3)
                    .map(
                      (name) => Padding(
                        padding: const EdgeInsets.only(left: 3, right: 3),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            "assets/profile-$name.jpg".toLowerCase(),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                ...List.generate(
                  (3 - partyList.length).clamp(0, 3),
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: SizedBox(width: 100, height: 100),
                  ),
                ),
              ],
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
                            children: [
                              Text(leadName),
                              Text("Level $leadLevel"),
                            ],
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
                      textWidget: Text(location, softWrap: true),
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
