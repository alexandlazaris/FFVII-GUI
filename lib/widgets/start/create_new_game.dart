import 'package:ffvii_app/widgets/general/window_layout.dart';
import 'package:flutter/material.dart';

class CreateNewGame extends StatelessWidget {
  const CreateNewGame({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return AlertDialog(
      title: const Text(
        'Enter your name',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
      content: TextField(
        controller: _controller,
        autofocus: true, //
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _controller.text),
          child: const Text(
            'Start',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ],
    );
  }
}
