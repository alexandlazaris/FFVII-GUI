import 'package:ffvii_app/models/party.dart';
import 'package:ffvii_app/providers/party_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePartyForSave extends ConsumerStatefulWidget {
  final String saveId;
  const CreatePartyForSave({super.key, required this.saveId});

  @override
  ConsumerState<CreatePartyForSave> createState() => _CreatePartyForSaveState();
}

class _CreatePartyForSaveState extends ConsumerState<CreatePartyForSave> {
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
              CreateParty(name: 'Barret')
            ], widget.saveId);
          },
        ),
      ],
    );
  }
}
