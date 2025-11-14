import 'package:ffvii_app/widgets/general/window_layout.dart';
import 'package:ffvii_app/widgets/save_menu/confirm_save_slot_selection.dart';
import 'package:flutter/material.dart';
import 'package:ffvii_app/models/save.dart';

// TODO: what's needed to make this data rebuilt when the BE data is modified? right now, I need to relaunch/rebuild the app
class SaveSlotDisplayDataDesktop extends StatefulWidget {
  final Save saveData;
  const SaveSlotDisplayDataDesktop({super.key, required this.saveData});

  @override
  State<SaveSlotDisplayDataDesktop> createState() =>
      _SaveSlotDisplayDataDesktop();
}

class _SaveSlotDisplayDataDesktop extends State<SaveSlotDisplayDataDesktop> {
  @override
  Widget build(BuildContext context) {
    final leadName = widget.saveData.partyLead?.name ?? "cloud";
    final leadLevel = widget.saveData.partyLead?.level.toString() ?? "1";
    final location = widget.saveData.location;
    final List<String> partyList = widget.saveData.party;

    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          // Start a delayed callback once the first dialog builds
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
      child: MenuBox(
        child: Container(
          // color: Colors.amber,
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
                            child: Image.asset("assets/profile-empty.png"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    // TODO:how to make the following tree: Expanded -> SizedBox -> Container -> Column fill up the vertical space in a Row
                    child: Container(
                      height: 90,
                      // color: Colors.red,
                      child: Column(
                        // spacing: 1,
                        children: [
                          Expanded(
                            child: Container(
                              // height: ,
                              // color: Colors.green,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 400,
                                      // height: 50,
                                      // how to make a container, cover the full height of a column
                                      child: Column(
                                        spacing: 20,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: leadName,
                                                  style: TextStyle(
                                                    color: Colors.white,
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
                                                    color:
                                                        Colors.lightBlueAccent,
                                                    fontFamily: "Reactor7",
                                                    fontSize: 24,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: leadLevel,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  _SaveSlotTimeGil(),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // color: Colors.red,
                            child: MenuBox(
                              // height: ,
                              width: double.infinity,
                              child: RichText(
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SaveSlotTimeGil extends StatelessWidget {
  // TODO: figure out how to handle constructors & key args for private widgets
  const _SaveSlotTimeGil({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuBox(
      child: SizedBox(
        width: 100,
        // height: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Time ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Reactor7",
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "30:30",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "Reactor7",
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Gil ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Reactor7",
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "47957",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "Reactor7",
                          fontSize: 20,
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
    );
  }
}
