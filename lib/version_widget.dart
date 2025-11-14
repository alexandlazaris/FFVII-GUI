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
      constraints: BoxConstraints(minHeight: 100, maxHeight: 300),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: MenuBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Thank you for exploring ffvii_app. Please raise any issues or requests at: https://github.com/alexandlazaris/FFVII-GUI/issues.",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "App version & build #: ",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 24,
                    ),
                  ),
                  Text("$version-$build", style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
