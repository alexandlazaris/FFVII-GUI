import 'dart:async';

import 'package:ffvii_app/widgets/general/window_layout.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionWidget extends StatefulWidget {
  const VersionWidget({super.key});

  @override
  State<VersionWidget> createState() => _VersionWidgetState();
}

class _VersionWidgetState extends State<VersionWidget> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String version = _packageInfo.version;
    final String build = _packageInfo.buildNumber;

    return Dialog(
      child: MenuBox(
        height: 240,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "App version & build #: ",
                  style: TextStyle(color: Colors.lightBlueAccent),
                ),
                Text("$version-$build"),
                Flexible(
                  child: Text(
                    "\n\nThank you for exploring ffvii_app. Please raise any issues or requests at: https://github.com/alexandlazaris/FFVII-GUI/issues.",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
