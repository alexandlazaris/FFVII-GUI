import 'package:ffvii_app/constants/asset_paths.dart';
import 'package:ffvii_app/party/view/new_party_complete.dart';
import 'package:ffvii_app/party/view_model/party_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ffvii_app/widgets/general/window_layout.dart';

class CreatePartyForSave extends ConsumerStatefulWidget {
  final String saveId;
  const CreatePartyForSave({super.key, required this.saveId});

  @override
  ConsumerState<CreatePartyForSave> createState() => _CreatePartyForSaveState();
}

class _CreatePartyForSaveState extends ConsumerState<CreatePartyForSave> {
  List<String> party = [];
  String? dropZone1;
  String? dropZone2;
  String? dropZone3;
  Map<String, bool> visibleItems = {
    'Cloud': true,
    'Tifa': true,
    'Aeris': true,
    'Barret': true,
  };

  bool isValid = false;
  List<String> availableCharacters = ["Cloud", "Tifa", "Aeris", "Barret"];
  List<String> dropZones = ['dropZone1', 'dropZone2', 'dropZone3'];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      constraints: BoxConstraints(
        minHeight: 100,
        maxHeight: 500,
        maxWidth: 400,
        minWidth: 100,
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: MenuBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Please make a party of three.",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: availableCharacters.map((name) {
                      return PartyCharacterSelectNewGame(
                        name: name,
                        visibleItems: visibleItems,
                      );
                    }).toList(), //
                  ),
                  Text(
                    "Drag your party to the slots below.",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...dropZones.map((zone) {
                        final assignedItem = zone == 'dropZone1'
                            ? dropZone1
                            : zone == 'dropZone2'
                            ? dropZone2
                            : dropZone3;
                        return PartyDropZone(
                          zoneName: zone,
                          assignedItem: assignedItem,
                          onItemDropped: (item) {
                            setState(() {
                              if (assignedItem != null) {
                                visibleItems[assignedItem] = true;
                                party.remove(item);
                              }
                              if (zone == 'dropZone1') {
                                dropZone1 = item;
                                party.add(item);
                                isValid = true;
                              }
                              if (zone == 'dropZone2') {
                                dropZone2 = item;
                                party.add(item);
                                isValid = true;
                              }
                              if (zone == 'dropZone3') {
                                dropZone3 = item;
                                party.add(item);
                                isValid = true;
                              }
                              visibleItems[item] = false;
                            });
                          },
                        );
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              for (var b in visibleItems.keys) {
                                visibleItems[b] = true;
                              }
                            });
                            dropZone1 = "";
                            dropZone2 = "";
                            dropZone3 = "";
                            party.clear();
                            isValid = false;
                          },
                          child: Text(
                            "Reset",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextButton(
                          isSemanticButton: true,
                          onPressed: isValid
                              ? () async {
                                  Navigator.of(context).pop();
                                  ref
                                      .read(createPartyProvider.notifier)
                                      .createParty(party, widget.saveId);
                                  showDialog(
                                    context: context,
                                    builder: (_) => NewPartyComplete(),
                                  );
                                }
                              : null,
                          child: Text(
                            isValid ? "Confirm" : "",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
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
    );
  }
}

class PartyCharacterSelectNewGame extends StatelessWidget {
  const PartyCharacterSelectNewGame({
    super.key,
    required this.visibleItems,
    required this.name,
  });

  final Map<String, bool> visibleItems;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: name,
      feedback: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: 80,
          width: 80,
          child: Image.asset(AssetPaths.profileForCharacter(name)),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: SizedBox(
          height: 80,
          width: 80,
          child: Image.asset(AssetPaths.profileForCharacter(name)),
        ),
      ),
      child: Opacity(
        opacity: visibleItems[name]! ? 1.0 : 0.0, // always returns a Widget
        child: SizedBox(
          height: 80,
          width: 80,
          child: Image.asset(AssetPaths.profileForCharacter(name)),
        ),
      ),
    );
  }
}

class PartyDropZone extends StatelessWidget {
  final String zoneName; // unique identifier for this drop zone
  final String? assignedItem;
  final Function(String) onItemDropped;

  const PartyDropZone({
    super.key,
    required this.zoneName,
    required this.assignedItem,
    required this.onItemDropped,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onAcceptWithDetails: (item) => onItemDropped(item.data),
      builder: (context, candidateData, rejectedData) {
        if (assignedItem == null || assignedItem!.isEmpty) {
          return Container(height: 80, width: 80, color: Colors.grey);
        }
        return SizedBox(
          height: 80,
          width: 80,
          child: assignedItem != null
              ? Image.asset(AssetPaths.profileForCharacter(assignedItem!))
              : Container(height: 80, width: 80, color: Colors.grey),
        );
      },
    );
  }
}
