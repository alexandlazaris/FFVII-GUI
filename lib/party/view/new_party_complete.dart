import 'package:ffvii_app/widgets/general/flexible_generic_window_.dart';
import 'package:flutter/material.dart';

class NewPartyComplete extends StatelessWidget {
  const NewPartyComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleGenericWindow(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Your new game is ready. Press ",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Reactor7",
                      fontSize: 24,
                    ),
                  ),
                  TextSpan(
                    text: "Continue ",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontFamily: "Reactor7",
                      fontSize: 24,
                    ),
                  ),
                  TextSpan(
                    text: "to select your save.",
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
        ],
      ),
    );
  }
}
