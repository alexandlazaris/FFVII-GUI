import 'package:ffvii_app/version_widget.dart';
import 'package:ffvii_app/widgets/start/create_new_game.dart';
import 'package:ffvii_app/pages/saves_page.dart';
import 'package:ffvii_app/constants/asset_paths.dart';
import 'package:flutter/material.dart';

// TODO: after authentication is successful, the background colour of this widget is white
class StarGameMenuPage extends StatelessWidget {
  const StarGameMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => CreateNewGame(),
            ),
            child: Text(
              "NEW GAME",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SavesPage();
                  },
                ),
              );
            },
            child: Text(
              "Continue",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => VersionWidget(),
            ),
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: Image.asset(AssetPaths.startSwordLarge),
          ),
        ],
      ),
    );
  }
}
