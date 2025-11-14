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
              style: TextStyle(
                color: Colors.blue,
                fontFamily: "Reactor7",
                fontSize: 24,
              ),
            ),
            TextSpan(
              text: " is coming soon.\n\n",
              style: TextStyle(fontFamily: "Reactor7", fontSize: 24),
            ),
            TextSpan(
              text: "Try out Continue for now.",
              style: TextStyle(fontFamily: "Reactor7", fontSize: 24),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK', style: TextStyle(fontSize: 24)),
        ),
      ],
    );
  }
}
