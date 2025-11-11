import 'package:ffvii_app/widgets/general/window_layout.dart';
import 'package:flutter/material.dart';
import 'package:ffvii_app/models/save.dart';

class SaveSlotDesktop extends StatefulWidget {
  final Save saveData;
  const SaveSlotDesktop({super.key, required this.saveData});

  @override
  State<SaveSlotDesktop> createState() => _SaveSlotWidgetState();
}

class _SaveSlotWidgetState extends State<SaveSlotDesktop> {
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
                // TODO: how to expand the height of this column+row, it needs to be expanded to fill the surrounding space
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: leadName,
                                      style: TextStyle(color: Colors.white),
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
                                        color: Colors.lightBlueAccent,
                                      ),
                                    ),
                                    TextSpan(
                                      text: leadLevel,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
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
                  // TODO: extract the below into a private widget in this file
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: MenuBox(
                      width: double.infinity,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: location,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
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

class _SaveSlotTimeGil extends StatelessWidget {
  // TODO: figure out how to handle constructors & key args for private widgets
  const _SaveSlotTimeGil({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuBox(
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Time ",
                        style: TextStyle(color: Colors.white),
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
                        style: TextStyle(color: Colors.white),
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

// TODO: what's needed to make this data rebuilt when the BE data is modified? right now, I need to relaunch/rebuild the app
// class SaveSlotMobile extends StatefulWidget {
//   final Save saveData;
//   const SaveSlotMobile({super.key, required this.saveData});

//   @override
//   State<SaveSlotMobile> createState() => _SaveSlotMobile();
// }

// class _SaveSlotMobile extends State<SaveSlotMobile> {
//   bool _showName = true;

//   void _toggleDetails() {
//     setState(() {
//       if (_showName == false) {
//         _showName = true;
//       } else {
//         _showName = false;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final leadName = widget.saveData.partyLead?.name ?? "cloud";
//     final leadLevel = widget.saveData.partyLead?.level.toString() ?? "1";
//     final location = widget.saveData.location;
//     final List<String> partyList = widget.saveData.party;

//     return Flex(
//       direction: Axis.horizontal,
//       children: [
//         Expanded(
//           child: MenuBoxMobile(
//             height: 120,
//             width: 120,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 15),
//               child: Row(
//                 children: [
//                   Wrap(
//                     spacing: 6,
//                     runSpacing: 6,
//                     children: [
//                       ...partyList
//                           .take(3)
//                           .map(
//                             (name) => Padding(
//                               padding: const EdgeInsets.only(left: 3, right: 3),
//                               child: SizedBox(
//                                 width: 100,
//                                 height: 100,
//                                 child: Image.asset(
//                                   "assets/profile-$name.jpg".toLowerCase(),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ...List.generate(
//                         (3 - partyList.length).clamp(0, 3),
//                         (index) => Padding(
//                           padding: const EdgeInsets.only(left: 3, right: 3),
//                           child: SizedBox(width: 100, height: 100),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () => _toggleDetails(),
//                       child: MenuBoxMobile(
//                         height: 100,
//                         width: 120,
//                         child: Column(
//                           children: [
//                             (_showName
//                                 ? Column(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text: "Time ",
//                                               style: TextStyle(
//                                                 color: Colors.lightBlueAccent,
//                                               ),
//                                             ),
//                                             TextSpan(
//                                               text: "30:30",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text: "Gil ",
//                                               style: TextStyle(
//                                                 color: Colors.lightBlueAccent,
//                                               ),
//                                             ),
//                                             TextSpan(
//                                               text: "47957",
//                                               style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 : Column(
//                                     children: [
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text: "Lead ",
//                                               style: TextStyle(
//                                                 fontSize: 13,
//                                                 color: Colors.lightBlueAccent,
//                                               ),
//                                             ),
//                                             TextSpan(
//                                               text: leadName,
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize:
//                                                     leadName == "Cait Sith"
//                                                     ? 12
//                                                     : 13,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             TextSpan(
//                                               text: "Level ",
//                                               style: TextStyle(
//                                                 color: Colors.lightBlueAccent,
//                                               ),
//                                             ),
//                                             TextSpan(
//                                               text: "99",
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   )),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
