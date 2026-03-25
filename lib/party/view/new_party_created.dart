import 'package:ffvii_app/widgets/general/window_layout.dart';
import 'package:flutter/material.dart';

class NewPartyCreated extends StatelessWidget {
  const NewPartyCreated({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      constraints: BoxConstraints(
        minHeight: 100,
        maxHeight: 100,
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
                              // fontWeight: FontWeight.bold,
                              fontFamily: "Reactor7",
                              fontSize: 24,
                            ),
                          ),
                          TextSpan(
                            text: "to select your save.",
                            style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
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
            ),
          ),
        ],
      ),
    );
  }
}
