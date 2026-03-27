import 'package:ffvii_app/widgets/general/flexible_generic_window_.dart';
import 'package:flutter/material.dart';

class LoadingDataProgressBar extends StatelessWidget {
  const LoadingDataProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleGenericWindow(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: LinearProgressIndicator(
          minHeight: 20,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
        ),
      ),
    );
  }
}
