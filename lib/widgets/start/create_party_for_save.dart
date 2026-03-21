import 'package:ffvii_app/constants/asset_paths.dart';
import 'package:ffvii_app/models/party.dart';
import 'package:ffvii_app/providers/party_provider.dart';
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
  String dropZone1 = "";
  String dropZone2 = "";
  String dropZone3 = "";
  Map<String, bool> visibleItems = {'Cloud': true, 'Tifa': true, 'Aeris': true};

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
                    children: [
                      // TODO: make a template widget of these draggable characters
                      Draggable(
                        data: 'Cloud',
                        feedback: Material(
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset("assets/profile-cloud.jpg"),
                          ),
                        ),
                        childWhenDragging: SizedBox.shrink(),
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: visibleItems['Cloud']!
                              ? Image.asset("assets/profile-cloud.jpg")
                              : SizedBox.shrink(),
                        ),
                      ),
                      Draggable(
                        data: 'Tifa',
                        feedback: Material(
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset("assets/profile-tifa.jpg"),
                          ),
                        ),
                        childWhenDragging: SizedBox.shrink(),
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: visibleItems['Tifa']!
                              ? Image.asset("assets/profile-tifa.jpg")
                              : SizedBox.shrink(),
                        ),
                      ),
                      Draggable(
                        data: 'Aeris',
                        feedback: Material(
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset(
                              AssetPaths.profileForCharacter("Aeris"),
                            ),
                          ),
                        ),
                        childWhenDragging: SizedBox.shrink(),
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: visibleItems['Aeris']!
                              ? Image.asset(
                                  AssetPaths.profileForCharacter("Aeris"),
                                )
                              : SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                  Container(height: 150),
                  Text(
                    "Drag your party to the slots below.",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: DragTarget(
                          onAcceptWithDetails: (data) {
                            final draggedItem = data.data;
                            print('drop target accepted: $draggedItem');
                            setState(() {
                              if (dropZone1 != "") {
                                visibleItems[dropZone1] = true;
                              }
                              dropZone1 = draggedItem.toString();
                              visibleItems[dropZone1] = false;
                            });
                          },
                          builder: (context, _, __) => SizedBox(
                            height: 80,
                            width: 80,
                            child: dropZone1.isNotEmpty
                                ? Image.asset(
                                    AssetPaths.profileForCharacter(dropZone1),
                                  )
                                : Container(
                                    height: 80,
                                    width: 80,
                                    color: Colors.grey,
                                  ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: DragTarget(
                          onAcceptWithDetails: (data) {
                            final draggedItem = data.data;
                            print('drop target accepted: $draggedItem');
                            setState(() {
                              if (dropZone2 != "") {
                                visibleItems[dropZone2] = true;
                              }
                              dropZone2 = draggedItem.toString();
                              visibleItems[dropZone2] = false;
                            });
                          },
                          builder: (context, _, __) => SizedBox(
                            height: 80,
                            width: 80,
                            child: dropZone2.isNotEmpty
                                ? Image.asset(
                                    AssetPaths.profileForCharacter(dropZone2),
                                  )
                                : Container(
                                    height: 80,
                                    width: 80,
                                    color: Colors.grey,
                                  ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DragTarget(
                          onAcceptWithDetails: (data) {
                            final draggedItem = data.data;
                            print('drop target accepted: $draggedItem');
                            setState(() {
                              if (dropZone3 != "") {
                                visibleItems[dropZone3] = true;
                              }
                              dropZone3 = draggedItem.toString();
                              visibleItems[dropZone3] = false;
                            });
                          },
                          builder: (context, _, __) => SizedBox(
                            height: 80,
                            width: 80,
                            child: dropZone3.isNotEmpty
                                ? Image.asset(
                                    AssetPaths.profileForCharacter(dropZone3),
                                  )
                                : Container(
                                    height: 80,
                                    width: 80,
                                    color: Colors.grey,
                                  ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.restart_alt_rounded),
                        iconSize: 50,
                        onPressed: () {
                          setState(() {
                            for (var b in visibleItems.keys) {
                              visibleItems[b] = true;
                            }
                          });
                          dropZone1 = "";
                          dropZone2 = "";
                          dropZone3 = "";
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        final notifier = ref.read(createPartyProvider.notifier);
                        final dropZones = [dropZone1, dropZone2, dropZone3];
                        final filtered = dropZones
                            .where((e) => e.trim().isNotEmpty)
                            .map((e) => CreateParty(name: e))
                            .toList();
                        await notifier.createParty(filtered, widget.saveId);
                      },
                      child: Text(
                        "Confirm party",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      // TODO: add a finishing dialog here to go to Continue
                    ),
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

// DemoPartyDialog(ref: ref, widget: widget)

class DemoPartyDialog extends StatelessWidget {
  const DemoPartyDialog({super.key, required this.ref, required this.widget});

  final WidgetRef ref;
  final CreatePartyForSave widget;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Creating a party'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('This will create a party of:'),
            Text('Cloud, Tifa, Barret'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Approve'),
          onPressed: () async {
            // 1️⃣ Close the dialog first (optional)
            Navigator.of(context).pop();
            final notifier = ref.read(createPartyProvider.notifier);
            await notifier.createParty([
              // example data
              CreateParty(name: 'Cloud'),
              CreateParty(name: 'Tifa'),
              CreateParty(name: 'Barret'),
            ], widget.saveId);
          },
        ),
      ],
    );
  }
}
