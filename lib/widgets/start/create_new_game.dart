import 'package:ffvii_app/party/view/create_party_for_save.dart';
import 'package:ffvii_app/providers/saves_provider.dart';
import 'package:ffvii_app/widgets/general/window_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateNewGame extends ConsumerStatefulWidget {
  const CreateNewGame({super.key});

  @override
  ConsumerState<CreateNewGame> createState() => _CreateNewGameState();
}

class _CreateNewGameState extends ConsumerState<CreateNewGame> {
  final TextEditingController _locationController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Enter your location',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
      content: TextField(
        controller: _locationController,
        autofocus: true,
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        TextButton(
          onPressed: isLoading
              ? null
              : () async {
                  final location = _locationController.text;
                  setState(() => isLoading = true);

                  try {
                    // call your AsyncNotifier and get saved object
                    print("creating a new save with this location: $location");
                    final newSave = await ref
                        .read(createSaveProvider.notifier)
                        .createSave(location);
                    final newSaveId = newSave.id;
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                    showDialog(
                      context: context,
                      builder: (_) => CreatePartyForSave(saveId: newSaveId),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Error: $e')));
                  } finally {
                    if (mounted) setState(() => isLoading = false);
                  }
                },
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text(
                  'Start',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
        ),
      ],
    );
  }
}
