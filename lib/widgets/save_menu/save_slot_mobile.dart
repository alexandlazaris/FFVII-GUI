import 'package:ffvii_app/widgets/general/window_layout.dart';
import 'package:ffvii_app/widgets/save_menu/confirm_save_slot_selection.dart';
import 'package:flutter/material.dart';
import 'package:ffvii_app/models/save.dart';

class SaveSlotMobile extends StatefulWidget {
  final Save saveData;
  const SaveSlotMobile({super.key, required this.saveData});

  @override
  State<SaveSlotMobile> createState() => _SaveSlotMobile();
}

class _SaveSlotMobile extends State<SaveSlotMobile> {
  @override
  Widget build(BuildContext context) {
    final leadName = widget.saveData.partyLead?.name ?? "cloud";
    final leadLevel = widget.saveData.partyLead?.level.toString() ?? "1";
    final location = widget.saveData.location;
    final List<String> partyList = widget.saveData.party;

    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext dialogContext) {
                Future.delayed(const Duration(seconds: 2), () {
                  if (dialogContext.mounted) {
                    Navigator.of(dialogContext).pop();
                    showDialog(
                      context: dialogContext,
                      builder: (BuildContext context) {
                        return SaveSlotLoadComplete();
                      },
                    );
                  }
                });
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ConfirmSaveSlotSelection(),
                );
              },
            ),
            child: MenuBoxMobile(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          ...partyList
                              .take(3)
                              .map(
                                (name) => Padding(
                                  padding: const EdgeInsets.only(
                                    left: 3,
                                    right: 3,
                                  ),
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
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                    colors: [
                                      const Color.fromARGB(114, 96, 125, 139),
                                      const Color.fromARGB(123, 158, 158, 158),
                                    ],
                                  ).createShader(bounds),
                                  blendMode: BlendMode.srcIn,
                                  child: Image.asset(
                                    "assets/profile-empty.png",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MenuBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: leadName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Reactor7",
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Level ",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.lightBlueAccent,
                                        fontFamily: "Reactor7",
                                      ),
                                    ),
                                    TextSpan(
                                      text: leadLevel,
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontFamily: "Reactor7",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Time ",
                                      style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontFamily: "Reactor7",
                                        fontSize: 24,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "30:30",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: "Reactor7",
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: location,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Reactor7",
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
