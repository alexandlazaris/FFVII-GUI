import 'package:flutter/material.dart';

class NewGameDialog extends StatelessWidget {
  const NewGameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Stay tuned!"),
      content: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "NEW GAME",
              style: TextStyle(color: Colors.blue),
            ),
            TextSpan(text: " is coming soon.\n\n"),
            TextSpan(text: "Try out Continue for now."),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
